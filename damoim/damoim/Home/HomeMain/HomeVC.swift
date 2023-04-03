//
//  ViewController.swift
//  damoim
//
//  Created by 원동진 on 2023/02/10.
//

import UIKit
import SnapKit
struct ExampleCVItem{
    let groupImage : UIImage?
    let groupName : String?
}
class HomeVC: UIViewController {
    
    private lazy var scheduleView : UIView = {
        let scheduleView = ScheduleView()
        scheduleView.backgroundColor = UIColor.white
        return scheduleView
    }()
    private lazy var containerView : UIView = {
        let containerView = UIView()
        containerView.backgroundColor = UIColor(named: "grey05")
        return containerView
    }()
    let sample = (1...3).map{_ in return ExampleCVItem(groupImage: UIImage(named: "testImg"), groupName: "계모임 이름")}
    static var numOfcol = 2
    var gridFlowLayout : GridCollectionVFL = {
        let layout = GridCollectionVFL()
        layout.cellSpacing = 10
        layout.numberOfColumns = 2
        return layout
    }()
    private lazy var groupListCV : UICollectionView = {
        let grouptList = UICollectionView(frame: .zero, collectionViewLayout: self.gridFlowLayout)
        grouptList.isScrollEnabled = true
        grouptList.showsHorizontalScrollIndicator = false
        grouptList.showsVerticalScrollIndicator = true
        //    view.scrollIndicatorInsets = UIEdgeInsets(top: -2, left: 0, bottom: 0, right: 4)
        grouptList.contentInset = .zero
        grouptList.clipsToBounds = true
        grouptList.register(GroupCVCell.self, forCellWithReuseIdentifier: GroupCVCell.identi)
        grouptList.register(AddGroupCVCell.self, forCellWithReuseIdentifier: AddGroupCVCell.identi)
        grouptList.register(GroupCVCellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: GroupCVCellHeader.identi)
        grouptList.backgroundColor = UIColor(named: "grey05")
        return grouptList
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddSubView()
        setAutoLayout()
        setCV()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
}
extension HomeVC {
    private func setAddSubView(){
        
        self.view.addSubview(self.containerView)
        self.containerView.addSubview(scheduleView)
        self.containerView.addSubview(groupListCV)
        
    }
    private func setCV(){
        self.groupListCV.delegate = self
        self.groupListCV.dataSource = self
    }
    
    private func setAutoLayout(){
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        scheduleView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        groupListCV.snp.makeConstraints { make in
            make.top.equalTo(scheduleView.snp.bottom)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
    }
}
extension HomeVC : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return self.sample.count
        }else{
            return 1
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0{
            let groupCell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupCVCell.identi, for: indexPath) as! GroupCVCell
            groupCell.groupImgView.layer.cornerRadius = 16
            groupCell.groupImgView.layer.masksToBounds = true
            groupCell.prepare(model: self.sample[indexPath.item])
            return groupCell
        }else {
            let addGroupCell = collectionView.dequeueReusableCell(withReuseIdentifier: AddGroupCVCell.identi, for: indexPath) as! AddGroupCVCell
            return addGroupCell
        }
        
    }
    //MARK: - Header & footer
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader{
            if indexPath.section == 0{
                
            }
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: GroupCVCellHeader.identi, for: indexPath) as? GroupCVCellHeader else {return UICollectionReusableView()}
            header.gridTwoAction = { [unowned self] in
                gridFlowLayout.numberOfColumns = 2
                groupListCV.reloadData()
                
            }
            header.gridThreeAction = { [unowned self] in
                gridFlowLayout.numberOfColumns = 3
                groupListCV.reloadData()
                
            }
            
            return header
        }
        return UICollectionReusableView()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0{
            let width: CGFloat = collectionView.frame.width
            let height: CGFloat = 50
            return CGSize(width: width, height: height)
        }else {
            return CGSize(width: 0, height: 0)
        }
        
    }
    
}

extension HomeVC : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? GridCollectionVFL,
              flowLayout.numberOfColumns > 0
        else { fatalError() }
        
        let widthOfCells = collectionView.bounds.width - (collectionView.contentInset.left + collectionView.contentInset.right)
        let widthOfSpacing =  CGFloat(flowLayout.numberOfColumns - 1) * flowLayout.cellSpacing
        let width = (widthOfCells - widthOfSpacing) / CGFloat(flowLayout.numberOfColumns)
        return CGSize(width: width, height: width * flowLayout.ratioHeightToWidth)
    }
}
extension HomeVC : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let groupTextListVC = GroupTextListVC()
        groupTextListVC.groupName = self.sample[indexPath.item].groupName ?? "모임 이름"
        groupTextListVC.groupImage = self.sample[indexPath.item].groupImage ?? UIImage(named: "testImg")
        groupTextListVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(groupTextListVC, animated: false)
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct HomeVCPreview: PreviewProvider {
    static var previews: some View {
        HomeVC().showPreview(.iPhone14Pro)
    }
}
#endif

