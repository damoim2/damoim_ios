//
//  TextListTVC.swift
//  damoim
//
//  Created by 원동진 on 2023/03/13.
//

import UIKit
import SnapKit

class CommentTVC : UITableViewCell {
    static let identi = "CommentTVCid"
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
        userName.font = UIFont(name: CustomFont.Medium.rawValue, size: 13)
        userName.textColor = UIColor(named: "grey02")
        userName.numberOfLines = 1
        userName.sizeToFit()
        return userName
    }()
    private lazy var writeDateLabel : UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = UIFont(name: CustomFont.Regular.rawValue, size: 10)
        dateLabel.textColor = UIColor(named: "grey03")
        dateLabel.numberOfLines = 1
        dateLabel.sizeToFit()
        return dateLabel
    }()
    //MARK: - 글

    private lazy var userTextLabel : UILabel = {
        let textLabel = UILabel()
        textLabel.font = UIFont(name: CustomFont.Regular.rawValue, size: 13)
        textLabel.textColor = UIColor(named: "grey01")
        textLabel.sizeToFit()
        textLabel.numberOfLines = 0
        return textLabel
    }()
    //MARK: - 답글달기 버튼
    private lazy var addCommentButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("답글달기", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Regular.rawValue, size: 13)!]))
        config.baseForegroundColor = UIColor(named: "purple04")
        let addTextButton = UIButton(configuration: config)
        addTextButton.sizeToFit()
        return addTextButton
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
extension CommentTVC  {
    
    private func addSubView(){
        contentView.addSubview(containerView)
        containerView.addSubview(writeInfoView)
        writeInfoView.addSubview(userStackView)
        writeInfoView.addSubview(writeDateLabel)
        userStackView.addArrangedSubview(userImageView)
        userStackView.addArrangedSubview(userNameLabel)
        containerView.addSubview(userTextLabel)
        containerView.addSubview(addCommentButton)
        
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
            make.left.equalTo(writeInfoView.snp.left).offset(20)
            make.bottom.equalTo(writeInfoView.snp.bottom)
        }
        writeDateLabel.snp.makeConstraints { make in
            make.top.equalTo(writeInfoView.snp.top).offset(13)
            make.right.equalTo(writeInfoView.snp.right).offset(-16)
            make.bottom.equalTo(writeInfoView.snp.bottom)
        }
        //MARK: - 글 내용
        userTextLabel.snp.makeConstraints { make in
            make.top.equalTo(writeInfoView.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(46)
            make.right.equalToSuperview().offset(-16)
        }
        //MARK: - 더보기 버튼
        addCommentButton.snp.makeConstraints { make in
            make.top.equalTo(userTextLabel.snp.bottom).offset(6)
            make.left.equalToSuperview().offset(46)
            make.bottom.equalTo(containerView.snp.bottom).offset(-6)
        }
    }
    func setComment(model: CommentDataStruct) {
        userImageView.image = model.userImg
        userNameLabel.text = model.userName
        writeDateLabel.text = model.date
        userTextLabel.text = model.comment
    }
}
