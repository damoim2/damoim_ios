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
        view.groupInfoViewdelegate = self
        return view
    }()

    private lazy var groupSetTableView : UITableView = {
        let tableView =  UITableView(frame: .zero, style: .insetGrouped)
        tableView.bounces = false
        tableView.register(SetGroupTVC.self, forCellReuseIdentifier: SetGroupTVC.identi)
        tableView.separatorStyle = .none
        tableView.sectionHeaderHeight = CGFloat.leastNormalMagnitude
        tableView.sectionFooterHeight = CGFloat.leastNormalMagnitude
        return tableView
    }()
    private lazy var groupDeleteButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("모임 삭제 하기", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Medium.rawValue, size: 15)!]))
        config.baseForegroundColor = UIColor(named: "grey03")
        let groupDeleteButton = UIButton(configuration: config)
        groupDeleteButton.backgroundColor = UIColor(named: "grey04")
        groupDeleteButton.layer.cornerRadius = 8
        return groupDeleteButton
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
        self.view.addSubview(groupDeleteButton)
        
    }
    private func setAutoLayout(){
        groupInfoView.snp.makeConstraints { make in
            make.top.left.right.equalTo(view.safeAreaLayoutGuide)
        }
        groupSetTableView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(groupInfoView.snp.bottom).offset(8)
        }
        groupDeleteButton.snp.makeConstraints { make in
            make.right.equalTo(view.snp.right).offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-34)
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
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
}
extension SetGroupVC : dismissActionDelegate {
    func dissmissAction(){
        self.presentingViewController?.dismiss(animated: true)
    }
}
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct SetGroupVCPreview: PreviewProvider {
    static var previews: some View {
        SetGroupVC().showPreview(.iPhone14Pro)
    }
}
#endif
