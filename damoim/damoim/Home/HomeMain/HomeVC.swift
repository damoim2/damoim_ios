//
//  ViewController.swift
//  damoim
//
//  Created by 원동진 on 2023/02/10.
//
//
import UIKit
import SnapKit
struct ExampleCVItem{
    let groupImage : UIImage?
    let groupName : String?
}
struct ExampleDate {
    let date : String // 날짜
    let day : String // 요일
}
struct ExampleScData{
    let groupName : String
    let groupImg : UIImage
    let date : String // 날짜
    let time : String // 시간
}
class HomeVC: UIViewController {
    let dateSample = [ExampleDate(date: "월", day: "11"),ExampleDate(date: "화", day: "12"),ExampleDate(date: "수", day: "13"),ExampleDate(date: "목", day: "14"),ExampleDate(date: "금", day: "15")]
    var scSample : [ExampleScData] = []
//    scSample = [ExampleScData(groupName: "모임001", groupImg: UIImage(named: "scTest1")!, date: "10월 10일 목요일", time: "오후 6:30")]
    let sample = (1...9).map{_ in return ExampleCVItem(groupImage: UIImage(named: "testImg"), groupName: "계모임 이름")}
    private var buttons: [UIButton]!
    var moreBtnState : Bool = false // more 했을경우 True
    var selectedIndex : Int = 0
    //MARK: - 일정 관리 View
    private lazy var scheduleView  : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "grey06")
        view.roundCorners(cornerRadius: 30, maskedCorners: [.layerMinXMaxYCorner,.layerMaxXMaxYCorner])
        return view
    }()
    private lazy var damoimLogo : UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "damoimLogo")
        return logoImageView
    }()
    private lazy var scheduleLabel : UILabel = {
        let textLabel = UILabel()
        textLabel.text = "다가오는 일정"
        textLabel.textAlignment = .left
        textLabel.font = UIFont(name: CustomFont.SemiBold.rawValue, size: 13)
        return textLabel
    }()
    
    private lazy var schduleDateStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.backgroundColor = UIColor(named: "grey06")
        return stackView
    }()
    private lazy var scheduleListStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    private lazy var moreDownBtn : UIButton = { // 일정 더보기 Btn
       let btn = UIButton()
        btn.setImage(UIImage(named: "moreDownImg"), for: .normal)
        btn.addTarget(self, action: #selector(moreSceduleBtnAction), for: .touchUpInside)
        return btn
        
    }()
    //MARK: - 모임
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
        self.view.backgroundColor = UIColor(named: "grey05")
        createSCButton()
        scheduleViews()
        setAddSubView()
        setAutoLayout()
        setCV()
 
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
}
extension HomeVC : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //MARK: - Cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sample.count + 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let groupCell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupCVCell.identi, for: indexPath) as! GroupCVCell
        let addGroupCell = collectionView.dequeueReusableCell(withReuseIdentifier: AddGroupCVCell.identi, for: indexPath) as! AddGroupCVCell
        if indexPath.row == self.sample.count{ // 모임만들기 버튼일경우
            if gridFlowLayout.numberOfColumns == 2{
                if self.sample.count % 2 == 1{
                    addGroupCell.groupImageSameBtn(same: true)
                }else{
                    addGroupCell.groupImageSameBtn(same: false)
                }
                
            }else if gridFlowLayout.numberOfColumns == 3{
                if self.sample.count % 3 == 0{
                    addGroupCell.groupImageSameBtn(same: false)
                }else{
                    addGroupCell.groupImageSameBtn(same: true)
                }
            }
            return addGroupCell
        }else {
            groupCell.groupImgView.layer.cornerRadius = 16
            groupCell.groupImgView.layer.masksToBounds = true
            groupCell.prepare(model: self.sample[indexPath.row])
            
            return groupCell
        }
    }
    //MARK: - Header & footer
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader{
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
extension HomeVC {
    private func setAddSubView(){
        self.view.addSubview(scheduleView)
        scheduleView.addSubview(damoimLogo)
        scheduleView.addSubview(scheduleLabel)
        scheduleView.addSubview(schduleDateStackView)
        scheduleView.addSubview(scheduleListStackView)
        scheduleView.addSubview(moreDownBtn)
        for btn in buttons {
            schduleDateStackView.addArrangedSubview(btn)
        }
        self.view.addSubview(groupListCV)
        self.view.bringSubviewToFront(scheduleView)
    }
    private func setAutoLayout(){
        scheduleView.snp.makeConstraints { make in
            make.left.right.top.equalTo(self.view.safeAreaLayoutGuide)
        }
        damoimLogo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(16)
        }
        scheduleLabel.snp.makeConstraints { make in
            make.top.equalTo(damoimLogo.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        schduleDateStackView.snp.makeConstraints { make in
            make.top.equalTo(scheduleLabel.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(18)
            make.right.equalToSuperview().offset(-18)
        }
        scheduleListStackView.snp.makeConstraints { make in
            make.top.equalTo(schduleDateStackView.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(18)
            make.right.equalToSuperview().offset(-18)
        }
        moreDownBtn.snp.makeConstraints { make in
            make.top.equalTo(scheduleListStackView.snp.bottom).offset(14)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        let offset = scheduleView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        groupListCV.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(offset.height)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
        }
    }
    private func setCV(){
        self.groupListCV.delegate = self
        self.groupListCV.dataSource = self
    }
    private func createSCButton(){ // 요일 ,날짜 캘린더 Button
        buttons = [UIButton]()
        buttons.removeAll()
        for button in dateSample {
            var config = UIButton.Configuration.plain()
            config.attributedTitle = AttributedString(button.day, attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Medium.rawValue, size: 13)!]))
            config.attributedSubtitle = AttributedString(button.date, attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 17)!]))
            config.baseForegroundColor = UIColor(named: "grey03")
            let scheduleButton = UIButton(configuration: config)
            scheduleButton.addTarget(self, action: #selector(scDateBtnAction(sender:)), for: .touchUpInside)
            scheduleButton.layer.cornerRadius = 8
            scheduleButton.backgroundColor = UIColor(named: "grey06")
            scheduleButton.layer.borderWidth = 1
            scheduleButton.layer.borderColor = UIColor(named: "grey05")?.cgColor
            buttons.append(scheduleButton)
        }
        var config = buttons[0].configuration
        config?.baseForegroundColor = UIColor(named: "grey06")
        buttons[0].configuration = config
        buttons[0].backgroundColor = UIColor(named: "purple01")
    }
    private func scheduleViews(){ // 일정 View
        scSample = [ExampleScData(groupName: "모임001", groupImg: UIImage(named: "scTest1")!, date: "10월 10일 목요일", time: "오후 6:30"),ExampleScData(groupName: "모임002", groupImg: UIImage(named: "scTest2")!, date: "10월 10일 목요일", time: "오후 6:30"),ExampleScData(groupName: "모임003", groupImg: UIImage(named: "scTest3")!, date: "10월 10일 목요일", time: "오후 6:30"),ExampleScData(groupName: "모임004", groupImg: UIImage(named: "scTest4")!, date: "10월 10일 목요일", time: "오후 6:30")]
        if scSample.count > 1 {
            let view = ScheduleList()
            view.groupImgView.image = scSample[0].groupImg
            view.groupNameLabel.text = scSample[0].groupName
            view.dateLabel.text = scSample[0].date
            view.timeLabel.text = scSample[0].time
            scheduleListStackView.addArrangedSubview(view)
        }

    }
    @objc func scDateBtnAction(sender: UIButton){ //스케줄 일정 버튼 action
        for (buttonIndex, btn) in buttons.enumerated() {
            if btn == sender {
                selectedIndex = buttonIndex
                var config = btn.configuration
                config?.baseForegroundColor = UIColor(named: "grey06")
                btn.configuration = config
                btn.backgroundColor = UIColor(named: "purple01")
            }else {
                var config = btn.configuration
                config?.baseForegroundColor = UIColor(named: "grey03")
                btn.configuration = config
                btn.backgroundColor = UIColor(named: "grey06")
            }
        }
    }
    @objc func moreSceduleBtnAction(_ sender: UIButton){
        if sender.imageView?.image == UIImage(named: "moreDownImg"){
            for i in 1..<scSample.count{
                let view = ScheduleList()
                view.groupImgView.image = scSample[i].groupImg
                view.groupNameLabel.text = scSample[i].groupName
                view.dateLabel.text = scSample[i].date
                view.timeLabel.text = scSample[i].time
                scheduleListStackView.addArrangedSubview(view)
            }
            moreDownBtn.setImage(UIImage(named: "foldUpImg"), for: .normal)
        }else if sender.imageView?.image == UIImage(named: "foldUpImg"){
            scheduleListStackView.arrangedSubviews.forEach { UIView in
                UIView.removeFromSuperview()
            }
            let view = ScheduleList()
            view.groupImgView.image = scSample[0].groupImg
            view.groupNameLabel.text = scSample[0].groupName
            view.dateLabel.text = scSample[0].date
            view.timeLabel.text = scSample[0].time
            scheduleListStackView.addArrangedSubview(view)
            moreDownBtn.setImage(UIImage(named: "moreDownImg"), for: .normal)
        }
        
        
            
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

