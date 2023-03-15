//
//  TextListTVCType2.swift
//  damoim
//
//  Created by 원동진 on 2023/03/15.
//

import UIKit

class TextListTVCType2: UITableViewCell {
    static let identi = "TextListTVCid"
    private lazy var containerView : UIView = {
        let view = UIView()
        return view
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
        return userImage
    }()
    private lazy var userNameLabel : UILabel = {
        let userName = UILabel()
        userName.font = UIFont(name: CustomFont.SemiBold.rawValue, size: 13)
        userName.textColor = UIColor(named: "grey02")
        
        return userName
    }()
    private lazy var writeDateLabel : UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = UIFont(name: CustomFont.Regular.rawValue, size: 10)
        dateLabel.textColor = UIColor(named: "grey03")
        return dateLabel
    }()
    //MARK: - 글 , 글 이미지
    private lazy var textStackView : UIStackView = {
        let textStackView = UIStackView()
        textStackView.axis = .horizontal
        textStackView.distribution = .fillProportionally
        textStackView.alignment = .fill
        return textStackView
    }()
    private lazy var userTextLabel : UILabel = {
        let textLabel = UILabel()
        textLabel.font = UIFont(name: CustomFont.Regular.rawValue, size: 13)
        textLabel.textColor = UIColor(named: "grey01")
        textLabel.text = "원대하고, 바이며, 아름답고 보내는 실현에 없는 청춘에서만 그리하였는가? 싸인 찬미를 위하여서 품었기 때까지 발휘하기 부패뿐이다. 그들의 할지니, 대한 있음으로써 크고 하는 사랑의 것이다. 청춘의 않는 석가는 피어나는 같으며, 들어 군영과 약동하다. 품에 실로 생명을 것이다. 영락과 능히 심장은 길을 청춘은 일월과 인간이 열락의 때문이다. 대한 얼마나 행복스럽고 낙원을 끓는 그들은 과실이 크고 살 있는가? 되려니와, 꾸며 수 이것이다. 노래하며 이상의 뜨거운지라, 아니한 위하여서, 석가는 피가 위하여서. 풍부하게 시들어 품고 눈에 품으며, 것이다."
        textLabel.numberOfLines = 3
        return textLabel
    }()
    private lazy var userTextImgView : UIImageView = {
        let testImgView = UIImageView()
        testImgView.image = UIImage(named: "testImg2")
        return testImgView
    }()
    //MARK: - 더보기 버튼
    private lazy var addMoreTextButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("...더보기", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Regular.rawValue, size: 13)!]))
        config.baseForegroundColor = UIColor(named: "purple04")
        let addTextButton = UIButton(configuration: config)
        return addTextButton
    }()
    //MARK: - 좋아요 댓글
    private lazy var likeNCommentStackView : UIStackView = {
        let likeNCommentStackView = UIStackView()
        likeNCommentStackView.axis = .horizontal
        likeNCommentStackView.alignment = .fill
        likeNCommentStackView.distribution = .fillProportionally
        likeNCommentStackView.spacing = 20
        return likeNCommentStackView
    }()
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
    private lazy var commentStackView : UIStackView = {
        let commentStackView = UIStackView()
        commentStackView.axis = .horizontal
        commentStackView.alignment = .fill
        commentStackView.distribution = .fillProportionally
        commentStackView.spacing = 2
        return commentStackView
    }()
    private lazy var commentImgView : UIImageView = {
        let commentImgView = UIImageView()
        commentImgView.image = UIImage(named: "commentImg")
        return commentImgView
    }()
    private lazy var commentCntLabel : UILabel = {
        let commentCntLabel = UILabel()
        commentCntLabel.textColor = UIColor(named: "grey04")
        commentCntLabel.text = "댓글 8개"
        commentCntLabel.font = UIFont(name: CustomFont.Regular.rawValue, size: 13)
        return commentCntLabel
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
        setAutoLayou()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
extension TextListTVCType2  {
    private func addSubView(){
        contentView.addSubview(containerView)
        containerView.addSubview(writeInfoView)
        writeInfoView.addSubview(userStackView)
        writeInfoView.addSubview(writeDateLabel)
        userStackView.addArrangedSubview(userImageView)
        userStackView.addArrangedSubview(userNameLabel)
        containerView.addSubview(textStackView)
        textStackView.addArrangedSubview(userTextLabel)
        textStackView.addArrangedSubview(userTextImgView)
        containerView.addSubview(addMoreTextButton)
        containerView.addSubview(likeNCommentStackView)
        likeNCommentStackView.addArrangedSubview(likeStackView)
        likeNCommentStackView.addArrangedSubview(commentStackView)
        likeStackView.addArrangedSubview(likeImgView)
        likeStackView.addArrangedSubview(likeCntLabel)
        commentStackView.addArrangedSubview(commentImgView)
        commentStackView.addArrangedSubview(commentCntLabel)
    }
    private func setAutoLayou(){
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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
        //MARK: - 글 내용
        textStackView.snp.makeConstraints { make in
            make.top.equalTo(writeInfoView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        userTextLabel.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
        }
        userTextImgView.snp.makeConstraints { make in
            make.left.equalTo(userTextLabel.snp.right)
            make.size.height.equalTo(60)
            make.size.width.equalTo(60)
        }
        //MARK: - 더보기 버튼
        addMoreTextButton.snp.makeConstraints { make in
            make.top.equalTo(textStackView.snp.bottom)
            make.left.equalTo(containerView.snp.left)
        }
        likeNCommentStackView.snp.makeConstraints { make in
            make.top.equalTo(addMoreTextButton.snp.bottom).offset(16)
            make.left.equalTo(containerView.snp.left).offset(16)
            make.bottom.equalTo(containerView.snp.bottom).offset(-12)
            
        }
        //MARK: - 좋아요 댓글 부분
        
    }
    func setWriteInfoView(model :sampleTextList) {
        userImageView.image = model.writeUserImg
        userNameLabel.text = model.writeUserName
        writeDateLabel.text = model.writeDate
    }
}
