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
class TextDetailVC: UIViewController, ConstraintRelatableTarget {
    var sampleCommentData = [CommentDataStruct(userImg: UIImage(named: "testImg")!, userName: "김초코", date: "00월 00일", comment: "능히 영락과 우리의 것이다. 뛰노는 그들에게 고동을 따뜻한 목숨이 있다. 장식하는 청춘의 끓는 고동을 물방아 동산에는 생명을 있는가? 인간이 얼마나 목숨을 약동하다. 동력은 것은 피고, 주는 살 있다. 길을 들어 곧 그리하였는가?"),CommentDataStruct(userImg: UIImage(named: "testImg")!, userName: "김코난", date: "00월 00일", comment: "능히 영락과 우리의 것이다. 뛰노는 그들에게 고동을 따뜻한 목숨이 있다. 장식하는 청춘의 끓는 고동을 물방아 동산에는 생명을 있는가? 인간이 얼마나 목숨을 약동하다. 동력은 것은 피고, 주는 살 있다. 길을 들어 곧 그리하였는가?"),CommentDataStruct(userImg: UIImage(named: "testImg")!, userName: "갱갱", date: "00월 00일", comment: "능히 영락과 우리의 것이다. 뛰노는 그들에게 고동을 따뜻한 목숨이 있다. 장식하는 청춘의 끓는 고동을 물방아 동산에는 생명을 있는가? 인간이 얼마나 목숨을 약동하다. 동력은 것은 피고, 주는 살 있다. 길을 들어 곧 그리하였는가?")
    ]

    private lazy var containerView : UIView = {
        let view = UIView()
        return view
    }()
    // Commet 관련
    var commentMaxHeight = 0
    let textViewPlaceHoler = "@김초코 댓글을 입력해주세요."// 댓글 textView placeHolder
    
    var groupName : String = "모임 이름"
    private lazy var commentTableView : UITableView = {
        let commentTableView = UITableView(frame: .zero, style: .grouped)
        commentTableView.bounces = false
        commentTableView.separatorColor = .clear
        commentTableView.register(CommentTVC.self, forCellReuseIdentifier: CommentTVC.identi)
        commentTableView.register(TextDetailTVH.self, forHeaderFooterViewReuseIdentifier: TextDetailTVH.identi)
        return commentTableView
    }()
    private lazy var navigationTitle : UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "\(groupName)"
        titleLabel.font = UIFont(name: CustomFont.Bold.rawValue, size: 17)
        titleLabel.textColor = UIColor(named: "grey06")
        return titleLabel
    }()
    private lazy var commentTextView : UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.font = UIFont(name: CustomFont.Regular.rawValue, size: 13)
        textView.textColor = UIColor(named: "grey03")
        let attributesString = NSMutableAttributedString(string: textViewPlaceHoler)
        attributesString.addAttribute(.foregroundColor, value: UIColor(named: "purple01") as Any, range: (textViewPlaceHoler as NSString).range(of: "@김초코"))
        attributesString.addAttribute(.backgroundColor, value: UIColor(named: "purple04") as Any, range: (textViewPlaceHoler as NSString).range(of: "@김초코"))
        textView.attributedText = attributesString
        textView.textContainerInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        textView.backgroundColor = UIColor(named: "grey05")
        textView.layer.cornerRadius = 16
        textView.layer.masksToBounds = true
        textView.sizeToFit()
        textView.delegate = self
        return textView
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
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TextDetailTVH.identi) as? TextDetailTVH else {return UITableViewHeaderFooterView()}
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        headerView.taptTestSetDelegate = self
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
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView
//    }
    //삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
        }
    }
}
extension TextDetailVC  {
    private func addSubView(){
        self.view.addSubview(containerView)
        containerView.addSubview(commentTableView)
        containerView.addSubview(commentTextView)

    }
    private func setAutoLayout(){
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        commentTableView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        commentTextView.snp.makeConstraints { make in
            make.top.equalTo(commentTableView.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
            make.height.equalTo(40)
        }
        commentMaxHeight = Int(commentTextView.bounds.height) * 3
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
extension TextDetailVC : tapTestSettingAction {
    func tapTextSettingAction() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let modifyAction = UIAlertAction(title: "수정하기", style: .default)
        let deleteAction = UIAlertAction(title: "삭제하기", style: .destructive)
        let cancelAction = UIAlertAction(title: "취소하기", style: .cancel)
        alert.addAction(modifyAction)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
}
extension TextDetailVC : UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceHoler {
            textView.text = nil
            textView.textColor = UIColor(named: "grey01")
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = textViewPlaceHoler
            textView.textColor = UIColor(named: "grey03")
        }
    }
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        if commentMaxHeight > Int(estimatedSize.height) {
            textView.snp.updateConstraints { make in
                make.height.equalTo(estimatedSize.height)
            }
        }else{
            textView.isScrollEnabled = true
        }
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
