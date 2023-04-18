//
//  TextListVC.swift
//  damoim
//
//  Created by 원동진 on 2023/03/05.
//

import UIKit
import SnapKit
struct sampleTextList {
    let writeUserImg : UIImage
    let writeUserName : String
    let writeDate : String
    let textContent : String
    let textImg : UIImage
}
class GroupTextListVC: UIViewController {
    var sample = (1...8).map{_ in return sampleTextList(writeUserImg: UIImage(named: "testImg")!, writeUserName: "원동진", writeDate: "12월 12일",textContent: "원대하고, 바이며, 아름답고 보내는 실현에 없는 청춘에서만 그리하였는가? 싸인 찬미를 위하여서 품었기 때까지 발휘하기 부패뿐이다. 그들의 할지니, 대한 있음으로써 크고 하는 사랑의 것이다. 청춘의 않는 석가는 피어나는 같으며, 들어 군영과 약동하다. 품에 실로 생명을 것이다. 영락과 능히 심장은 길을 청춘은 일월과 인간이 열락의 때문이다. 대한 얼마나 행복스럽고 낙원을 끓는 그들은 과실이 크고 살 있는가? 되려니와, 꾸며 수 이것이다. 노래하며 이상의 뜨거운지라, 아니한 위하여서, 석가는 피가 위하여서. 풍부하게 시들어 품고 눈에 품으며, 것이다.",textImg: UIImage(named: "testImg2")!)}
    var groupName = "모임 이름"
    var groupImage : UIImage?
    private lazy var navigationBarImgView : UIImageView = {
        let navigationBarImgView = UIImageView()
        navigationBarImgView.image = groupImage
        return navigationBarImgView
    }()
    private lazy var dimView : UIView = {
        let dimView = UIView()
        dimView.backgroundColor = UIColor(named: "grey01")?.withAlphaComponent(0.5)
        return dimView
    }()
    private lazy var textListTableView : UITableView = {
        let textListTableView = UITableView()
        textListTableView.bounces = false
        textListTableView.register(TextListTVCType1.self, forCellReuseIdentifier: TextListTVCType1.identi)
        textListTableView.separatorStyle = .none
        return textListTableView
    }()
    private lazy var addTextButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(named: "addTextBtn")
        config.imagePadding = 0
        let addTextButton = UIButton(configuration: config)
        
        return addTextButton
    }()
    private lazy var navigationTitle : UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "\(groupName)"
        titleLabel.font = UIFont(name: CustomFont.Bold.rawValue, size: 17)
        titleLabel.textColor = UIColor(named: "grey06")
        return titleLabel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddView()
        setAutoLayout()
        setTableView()
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
        let transition = CATransition().segueFromRight()
        view.window?.layer.add(transition, forKey: kCATransition)
        self.present(setGroupVC, animated: false)
    }
    private func setAddView(){
        self.view.addSubview(textListTableView)
        self.view.addSubview(navigationBarImgView)
        self.view.addSubview(dimView)
        self.view.addSubview(addTextButton)
    }
    private func setAutoLayout(){
        textListTableView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        navigationBarImgView.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.top)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.bottom.equalTo(textListTableView.snp.top)
        }
        dimView.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.top)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.bottom.equalTo(textListTableView.snp.top)
        }
        addTextButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.snp.bottom).offset(-86)
            make.right.equalTo(self.view.snp.right).offset(-16)
            make.size.height.width.equalTo(54)
        }
    }
    private func setNavigationBar(){
        
        self.navigationController?.navigationBar.isHidden = false
        let backBarButtonItem = UIBarButtonItem(image: UIImage(named: "backBtn"), style: .plain, target: self, action: #selector(backVC))
        self.navigationItem.leftBarButtonItem = backBarButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "setImg"), style: .plain, target: self, action: #selector(tapGroupSet))
        self.navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = .white
        //        self.navigationItem.title = "\(groupName)"
        //        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationItem.titleView = navigationTitle
        //MARK: - SetBackGround
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }
    private func setTableView(){
        textListTableView.delegate = self
        textListTableView.dataSource = self
    }
    
}
extension GroupTextListVC : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sample.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let textListTVC = tableView.dequeueReusableCell(withIdentifier: TextListTVCType1.identi, for: indexPath)as? TextListTVCType1 else {return UITableViewCell()}
        textListTVC.textListDelegate = self
        textListTVC.setWriteInfoView(model: sample[indexPath.item])
        textListTVC.selectionStyle = .none
        return textListTVC
    }
    
}
extension GroupTextListVC : tapMoreTextActionDelegate {
    func tapMoreTextAction(){
        let textDetailVC = TextDetailVC()
        textDetailVC.groupName = self.groupName
        self.navigationController?.pushViewController(textDetailVC.self, animated: false)
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct GroupTextListVCPreview: PreviewProvider {
    static var previews: some View {
        GroupTextListVC().showPreview(.iPhone14Pro)
    }
}
#endif
