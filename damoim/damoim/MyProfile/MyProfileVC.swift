//
//  MyProfileVC.swift
//  damoim
//
//  Created by 원동진 on 2023/02/15.
// fix

import Foundation
import UIKit
import SnapKit
class MyProfileVC: UIViewController {
    var profileText = [["내 계좌","KB국민카드 ******316*"],["설정","법적 고지","버전 정보","개인정보 사용방침","비밀번호 변경","로그아웃"]]
    var myProfileTableView : UITableView = {
        let tableView =  UITableView(frame: .zero, style: .insetGrouped)
        tableView.bounces = false
        tableView.register(MyProfileTVC.self, forCellReuseIdentifier: MyProfileTVC.identi)
        tableView.register(MyaccountTVC.self, forCellReuseIdentifier: MyaccountTVC.identi)
        tableView.separatorStyle = .none
        tableView.sectionHeaderHeight = 0
        return tableView
    }()
    var userInfoView : UserInfoView = {
        let view = UserInfoView()
        view.userNameLabel.text = "원동진"
        view.userImgView.layer.cornerRadius = Double(62.5/2)
        
        view.userImgView.layer.masksToBounds = true
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        cofigure()
        setAutoLayout()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
}
extension MyProfileVC {
    
    private func cofigure(){
        myProfileTableView.delegate = self
        myProfileTableView.dataSource = self
    }
    private func addSubView(){
        self.view.addSubview(userInfoView)
        self.view.addSubview(myProfileTableView)
        
    }
    private func setAutoLayout(){
        userInfoView.snp.makeConstraints { make in
            make.top.left.right.equalTo(view.safeAreaLayoutGuide)
            
        }
        myProfileTableView.snp.makeConstraints { make in
            make.bottom.left.right.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(userInfoView.snp.bottom)
            
        }
    }
}
extension MyProfileVC : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }else if section == 1 {
            return 6
        }
        return 0
    }
    
    //MARK: - Cell
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let profileCell = tableView.dequeueReusableCell(withIdentifier: MyProfileTVC.identi, for: indexPath) as? MyProfileTVC else {return UITableViewCell()}
        guard let accuntCell = tableView.dequeueReusableCell(withIdentifier: MyaccountTVC.identi, for: indexPath) as? MyaccountTVC else {return UITableViewCell()}
        if indexPath.row == 0 {
            profileCell.setString(model: profileText[indexPath.section][indexPath.row], font: CustomFont.SemiBold.rawValue, fontsize: 15, textcolor: "purple02")
        }else if indexPath == [0,1]{
            accuntCell.setAccountInfo(model: profileText[indexPath.section][indexPath.row])
            return accuntCell
        }else {
            profileCell.setString(model: profileText[indexPath.section][indexPath.row], font: CustomFont.Regular.rawValue, fontsize: 15, textcolor: "black")
        }
        
        
        return profileCell
    }
    
  
 
    
}
import SwiftUI
@available(iOS 13.0.0, *)
struct MyProfileVCRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = MyProfileVC
    
    func makeUIViewController(context: Context) -> MyProfileVC {
        return MyProfileVC()
    }
    
    func updateUIViewController(_ uiViewController: MyProfileVC, context: Context) {
    }
    
}
struct MyProfileVCPreview: PreviewProvider {
    static var previews: some View {
        MyProfileVCRepresentable()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iPhone 14 Pro")
    }
}
