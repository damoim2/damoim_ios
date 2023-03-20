//
//  TextDetailVC.swift
//  damoim
//
//  Created by 원동진 on 2023/03/20.
//

import UIKit
import SnapKit
class TextDetailVC: UIViewController {
    var groupName : String = "모임 이름"
    private lazy var textDetailView : UIView = {
        let textDetailView = UIView()
        return textDetailView
    }()
    private lazy var navigationTitle : UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "\(groupName)"
        titleLabel.font = UIFont(name: CustomFont.Bold.rawValue, size: 17)
        titleLabel.textColor = UIColor(named: "grey06")
        return titleLabel
    }()
    //MARK: - 사용자 이미지,이름,
    private lazy var writeInfoView : UIView = {
        let infoView = UIView()
        return infoView
    }()
    private lazy var userStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 6
        return stackView
    }()
    private lazy var userImageView : UIImageView = {
        let userImage = UIImageView()
        userImage.image = UIImage(named: "testImg")
        return userImage
    }()
    private lazy var userNameLabel : UILabel = {
        let userName = UILabel()
        userName.text = "작성자"
        userName.font = UIFont(name: CustomFont.SemiBold.rawValue, size: 13)
        userName.textColor = UIColor(named: "grey02")
        
        return userName
    }()
    private lazy var writeDateLabel : UILabel = {
        let dateLabel = UILabel()
        dateLabel.text = "12월 12일"
        dateLabel.font = UIFont(name: CustomFont.Regular.rawValue, size: 10)
        dateLabel.textColor = UIColor(named: "grey03")
        return dateLabel
    }()
    //MARK: - 글
    private lazy var textStackView : UIStackView = {
        let textStackView = UIStackView()
        textStackView.axis = .horizontal
        textStackView.distribution = .fillProportionally
        textStackView.alignment = .fill
        return textStackView
    }()
    private lazy var userTextLabel : UILabel = {
        let textLabel = UILabel()
        textLabel.text = " 그들의 이상의 수 용기가 말이다. 그들의 튼튼하며, 없으면 예수는 봄날의 거선의 듣는다. 고동을 이상을 이것을 석가는 것이다.보라, 청춘 약동하다. 인생의 길지 같이, 그들의 피어나기 평화스러운 있는가? 꾸며 인생에 우리 동산에는 두기 청춘을 인간이 그들을 말이다. 미인을 그들의 우리 봄날의 있다. 하는 끝까지 고행을 커다란 끓는 듣는다. 이상의 모래뿐일 고행을 때문이다. 이상, 우리 곳이 그들의 하였으며, 못할 공자는 없는 아니다. 피어나는 인간의 앞이 불어 사는가 기관과 할지니, 귀는 옷을 힘있다. 아니한 산야에 눈이 위하여 할지라도 보라. 실현에 맺어, 보는 그림자는 생명을 이상을 이상 이상의 보라. 미묘한 같은 곳이 보라. 노래하며 피가 내는 일월과 용감하고 같은 구하지 이성은 이상은 보라. 갑 가진 이상의 옷을 봄바람이다. 같은 바로 힘차게 들어 이상의 있는 발휘하기 없으면 힘있다. 예수는 싸인 무엇을 그것을 가진 천자만홍이 얼음에 황금시대다. 공자는 그들의 사랑의 교향악이다. 목숨이 길을 같이 사는가 때에, 이것을 황금시대다. 너의 품으며, 속에서 이상 불어 있는 청춘의 봄바람이다. "
        textLabel.numberOfLines = 0
        textLabel.font = UIFont(name: CustomFont.Regular.rawValue, size: 13)
        textLabel.textColor = UIColor(named: "grey01")
        return textLabel
    }()
//MARK: - 좋아요
    private lazy var likeStackView : UIStackView = {
        let likeStackView = UIStackView()
        likeStackView.axis = .horizontal
        likeStackView.alignment = .fill
        likeStackView.distribution = .fillProportionally
        likeStackView.spacing = 2
        return likeStackView
    }()
    private lazy var likeImgView : UIImageView = {
        let likeImgView = UIImageView()
        likeImgView.image = UIImage(named: "likeImg")
        return likeImgView
    }()
    private lazy var likeCntLabel : UILabel = {
        let likeCntLabel = UILabel()
        likeCntLabel.textColor = UIColor(named: "grey04")
        likeCntLabel.text = "좋아요 10개"
        likeCntLabel.font = UIFont(name: CustomFont.Regular.rawValue, size: 13)
        return likeCntLabel
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        setAutoLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigtionBar()
    }

}
extension TextDetailVC  {
    private func addSubView(){
        self.view.addSubview(textDetailView)
        textDetailView.addSubview(writeInfoView)
        writeInfoView.addSubview(userStackView)
        writeInfoView.addSubview(writeDateLabel)
        userStackView.addArrangedSubview(userImageView)
        userStackView.addArrangedSubview(userNameLabel)
        textDetailView.addSubview(textStackView)
        textStackView.addArrangedSubview(userTextLabel)
        textDetailView.addSubview(likeStackView)
        likeStackView.addArrangedSubview(likeImgView)
        likeStackView.addArrangedSubview(likeCntLabel)
    }
    private func setAutoLayout(){
        textDetailView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self.view.safeAreaLayoutGuide)
            make.bottom.equalTo(self.view.snp.bottom).offset(-450)
        }
        writeInfoView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        userStackView.snp.makeConstraints { make in
            make.top.equalTo(writeInfoView.snp.top).offset(10)
            make.left.equalTo(writeInfoView.snp.left).offset(16)
            make.bottom.equalTo(writeInfoView.snp.bottom)
        }
        writeDateLabel.snp.makeConstraints { make in
            make.top.equalTo(writeInfoView.snp.top).offset(13)
            make.right.equalTo(writeInfoView.snp.right).offset(-16)
            make.bottom.equalTo(writeInfoView.snp.bottom)
        }
        //MARk: - 글 내용
        textStackView.snp.makeConstraints { make in
            make.top.equalTo(writeInfoView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            
        }
        userTextLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        likeStackView.snp.makeConstraints { make in
            make.top.equalTo(textStackView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    private func setNavigtionBar(){
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "purple01")
        let backBarButtonItem = UIBarButtonItem(image: UIImage(named: "backBtn"), style: .plain, target: self, action: #selector(backVC))
        self.navigationItem.leftBarButtonItem = backBarButtonItem
        self.navigationItem.titleView = navigationTitle
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
