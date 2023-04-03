//
//  TextDetailVC.swift
//  damoim
//
//  Created by 원동진 on 2023/03/20.
//

import UIKit
import SnapKit
struct CommentDataStruct {
    let userImg : UIImage
    let userName : String
    let date : String
    let comment : String
}
class TextDetailVC: UIViewController {
    var sampleCommentData = [CommentDataStruct(userImg: UIImage(named: "testImg")!, userName: "김초코", date: "00월 00일", comment: "능히 영락과 우리의 것이다. 뛰노는 그들에게 고동을 따뜻한 목숨이 있다. 장식하는 청춘의 끓는 고동을 물방아 동산에는 생명을 있는가? 인간이 얼마나 목숨을 약동하다. 동력은 것은 피고, 주는 살 있다. 길을 들어 곧 그리하였는가?"),CommentDataStruct(userImg: UIImage(named: "testImg")!, userName: "김코난", date: "00월 00일", comment: "능히 영락과 우리의 것이다. 뛰노는 그들에게 고동을 따뜻한 목숨이 있다. 장식하는 청춘의 끓는 고동을 물방아 동산에는 생명을 있는가? 인간이 얼마나 목숨을 약동하다. 동력은 것은 피고, 주는 살 있다. 길을 들어 곧 그리하였는가?"),CommentDataStruct(userImg: UIImage(named: "testImg")!, userName: "갱갱", date: "00월 00일", comment: "능히 영락과 우리의 것이다. 뛰노는 그들에게 고동을 따뜻한 목숨이 있다. 장식하는 청춘의 끓는 고동을 물방아 동산에는 생명을 있는가? 인간이 얼마나 목숨을 약동하다. 동력은 것은 피고, 주는 살 있다. 길을 들어 곧 그리하였는가?")
    ]
    
    var groupName : String = "모임 이름"
    
    private lazy var commentTableView : UITableView = {
        let commentTableView = UITableView(frame: .zero, style: .grouped)
        commentTableView.bounces = false
        commentTableView.separatorColor = .clear
        commentTableView.register(CommentTVC.self, forCellReuseIdentifier: CommentTVC.identi)
        commentTableView.register(CommentTVH.self, forHeaderFooterViewReuseIdentifier: CommentTVH.identi)
        return commentTableView
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
        addSubView()
        setAutoLayout()
        setTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigtionBar()
    }
    
}
extension TextDetailVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleCommentData.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CommentTVH.identi) as? CommentTVH else {return UITableViewHeaderFooterView()}
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        headerView.upperImgView.addGestureRecognizer(tapGestureRecognizer)
        headerView.upperImgView.snp.makeConstraints { make in
            make.height.equalTo(self.view.frame.height*0.28)
        }
        return headerView
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let commentTVC = tableView.dequeueReusableCell(withIdentifier: CommentTVC.identi, for: indexPath) as? CommentTVC else {return UITableViewCell()}
        commentTVC.setComment(model: sampleCommentData[indexPath.row])
        return commentTVC
        
    }
}
extension TextDetailVC  {
    private func addSubView(){
        self.view.addSubview(commentTableView)
    }
    private func setAutoLayout(){
        commentTableView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        
    }
    private func setNavigtionBar(){
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "purple01")
        let backBarButtonItem = UIBarButtonItem(image: UIImage(named: "backBtn"), style: .plain, target: self, action: #selector(backVC))
        self.navigationItem.leftBarButtonItem = backBarButtonItem
        self.navigationItem.titleView = navigationTitle
    }
    
    private func setTableView(){
        commentTableView.delegate = self
        commentTableView.dataSource = self
    }
    @objc private func didTapView(){
        let imgDetailModalVC = ImgDetailModalVC()
        imgDetailModalVC.modalPresentationStyle = .fullScreen
        self.present(imgDetailModalVC, animated: true)
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct TextDetailVCPreview: PreviewProvider {
    static var previews: some View {
        TextDetailVC().showPreview(.iPhone14Pro)
    }
}
#endif
