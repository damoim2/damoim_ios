//
//  TextListVC.swift
//  damoim
//
//  Created by 원동진 on 2023/03/05.
//

import UIKit
import SnapKit
class GroupTextListVC: UIViewController {
    var groupName = "모임 이름"
    private lazy var TestView : UIView = {
        let textView = UIView()
        return textView
    }()
    private lazy var navigationTitle : UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "\(groupName)"
        titleLabel.font = UIFont(name: CustomFont.Bold.rawValue, size: 17)
        titleLabel.textColor = UIColor(named: "grey06")
        titleLabel.sizeToFit()
        return titleLabel
    }()
    private lazy var test : UILabel = {
        let testLabel = UILabel()
        testLabel.text = groupName
        return testLabel
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddView()
        setAutoLayout()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBar()
        
    }
    
    
}
extension GroupTextListVC {
    @objc func tapGroupSet(){
        let setGroupVC = SetGroupVC()
        setGroupVC.modalPresentationStyle = .fullScreen
        self.present(setGroupVC, animated: true)
    }
    private func setAddView(){
        self.view.addSubview(TestView)
        TestView.addSubview(test)
    }
    private func setAutoLayout(){
        TestView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        test.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
extension GroupTextListVC {
    private func setNavigationBar(){
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "setImg"), style: .plain, target: self, action: #selector(tapGroupSet))
        navigationController?.navigationBar.tintColor = .white
//        self.navigationItem.title = "\(groupName)"
//        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationItem.titleView = navigationTitle
        //MARK: - SetBackGround
        let img = UIImage(named: "testNvImg")
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundImage = img
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }
}
