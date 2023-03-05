//
//  SetGroupVC.swift
//  damoim
//
//  Created by 원동진 on 2023/03/05.
//

import UIKit
import SnapKit
struct SetManageForm {
    let image : UIImage?
    let name : String?
}
class SetGroupVC: UIViewController {
    let manageSetData = [SetManageForm(image: UIImage(named: "memberSet"), name: "멤버 관리"),SetManageForm(image: UIImage(named: "scheduleSet"), name: "일정 관리"),SetManageForm(image: UIImage(named: "moneySet"), name: "곗돈 관리"),SetManageForm(image: UIImage(named: "invite"), name: "초대코드 생성")]
    
    private lazy var groupInfoView : GroupInfoView = {
        let view = GroupInfoView()
        view.delegate = self
        return view
    }()

    private lazy var groupSetTableView : UITableView = {
        let tableView =  UITableView(frame: .zero, style: .insetGrouped)
        tableView.bounces = false
        tableView.register(SetGroupTVC.self, forCellReuseIdentifier: SetGroupTVC.identi)
        tableView.separatorStyle = .none
        tableView.sectionHeaderHeight = 0
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubView()
        cofigure()
        setAutoLayout()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        
    }
  
}
extension SetGroupVC {
    private func cofigure(){
        groupSetTableView.delegate = self
        groupSetTableView.dataSource = self
    }
    private func addSubView(){
        self.view.addSubview(groupInfoView)
        self.view.addSubview(groupSetTableView)
        
    }
    private func setAutoLayout(){
        groupInfoView.snp.makeConstraints { make in
            make.top.left.right.equalTo(view.safeAreaLayoutGuide)
        }
        groupSetTableView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(groupInfoView.snp.bottom).offset(8)
        }
        
    }
}
extension SetGroupVC : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let setGroupCell = tableView.dequeueReusableCell(withIdentifier: SetGroupTVC.identi, for: indexPath)as? SetGroupTVC else {return UITableViewCell()}
        setGroupCell.setmanage(model: self.manageSetData[indexPath.item])

        return setGroupCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
}
extension SetGroupVC : dismissActionDelegate {
    func dissmissAction(){
        self.presentingViewController?.dismiss(animated: true)
    }
}
import SwiftUI
@available(iOS 13.0.0, *)
struct SetGroupVCRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = SetGroupVC
    
    func makeUIViewController(context: Context) -> SetGroupVC {
        return SetGroupVC()
    }
    
    func updateUIViewController(_ uiViewController: SetGroupVC, context: Context) {
    }
    
}
struct SetGroupVCPreview: PreviewProvider {
    static var previews: some View {
        SetGroupVCRepresentable()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iPhone 14 Pro")
    }
}
