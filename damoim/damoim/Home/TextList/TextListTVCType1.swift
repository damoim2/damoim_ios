//
//  TextListTVC.swift
//  damoim
//
//  Created by 원동진 on 2023/03/13.
//

import UIKit
import SnapKit
protocol tapMoreTextActionDelegate {
    func tapMoreTextAction()
}
class TextListTVCType1: UITableViewCell {
    var textListDelegate : tapMoreTextActionDelegate?
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
        userImage.layer.cornerRadius = 10
        userImage.clipsToBounds = true
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
        textLabel.numberOfLines = 3
        return textLabel
    }()
    private var ImgCntLabel : BasePaddingLabel = {
       let ImgCntLabel = BasePaddingLabel(padding: UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2))
        ImgCntLabel.text = "4"
        ImgCntLabel.textAlignment = .center
        ImgCntLabel.textColor = UIColor(named: "grey06")
        ImgCntLabel.backgroundColor = UIColor(named: "grey01")?.withAlphaComponent(0.8)
        ImgCntLabel.font = UIFont(name: CustomFont.Regular.rawValue, size: 10)
        ImgCntLabel.layer.masksToBounds = true
        ImgCntLabel.layer.cornerRadius = 9
        return ImgCntLabel
    }()
    private lazy var userTextImgView : UIImageView = {
        let testImgView = UIImageView()
        return testImgView
    }()
    //MARK: - 더보기 버튼
    private lazy var addMoreTextButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("...더보기", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Regular.rawValue, size: 13)!]))
        config.baseForegroundColor = UIColor(named: "purple04")
        let addTextButton = UIButton(configuration: config)
        addTextButton.addTarget(self, action: #selector(tapAddTextButton), for: .touchUpInside)
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
extension TextListTVCType1  {
    @objc private func tapAddTextButton(){
        self.textListDelegate?.tapMoreTextAction()
    }
    
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
        userTextImgView.addSubview(ImgCntLabel)
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
        ImgCntLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.right.equalToSuperview().offset(-2)
            make.size.height.equalTo(18)
            make.size.width.equalTo(18)
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
        userTextLabel.text = model.textContent
        userTextImgView.image = model.textImg
    }
}
