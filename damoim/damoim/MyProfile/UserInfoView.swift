//
//  MyProfileHV.swift
//  damoim
//
//  Created by 원동진 on 2023/02/20.
//

import UIKit

class UserInfoView: UIView {
    private lazy var containerView : UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        return containerView
    }()
    private lazy var labelStackView : UIStackView = {
        let labelStackView = UIStackView()
        labelStackView.axis = .vertical
        labelStackView.alignment = .fill
        labelStackView.distribution = .fillProportionally
        labelStackView.spacing = 4
        
        return labelStackView
    }()
    var userImgView : UIImageView = {
        var userImg = UIImageView()
        userImg.image = UIImage(named: "testImg")?.resizeImageTo(size: CGSize(width: 62.5, height: 62.5))
        return userImg
    }()
    private lazy var userNameLabel : UILabel = {
        let userName = UILabel()
        userName.text = "이아리"
        userName.font = UIFont(name: CustomFont.Bold.rawValue, size: 17)
        
        return userName
    }()
    private lazy var userJobLabel : UILabel = {
        let userJob = UILabel()
        userJob.text = "직장인"
        userJob.font = UIFont(name: CustomFont.Regular.rawValue, size: 13)
        userJob.textColor = UIColor(named: "grey02")
        return userJob
    }()
    private lazy var modifyProfileButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("수정", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Regular.rawValue, size: 13)!]))
        config.baseForegroundColor = UIColor(named: "purple01")
        let modifyProfile = UIButton(configuration: config)
        modifyProfile.backgroundColor = UIColor(named: "purple04")
        modifyProfile.layer.cornerRadius = 8
        return modifyProfile
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubView()
        autoLayout()
    }
    private func addSubView(){
        addSubview(containerView)
        containerView.addSubview(userImgView)
        containerView.addSubview(labelStackView)
        containerView.addSubview(modifyProfileButton)
        labelStackView.addArrangedSubview(userNameLabel)
        labelStackView.addArrangedSubview(userJobLabel)
        
    }
    private func autoLayout(){
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        userImgView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(9)
            make.left.equalTo(containerView.snp.left).offset(20)
            make.bottom.equalTo(containerView.snp.bottom).offset(-9)
        }
        labelStackView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(18)
            make.left.equalTo(userImgView.snp.right).offset(10)
            make.bottom.equalTo(containerView.snp.bottom).offset(-18)
        }
        modifyProfileButton.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(18)
            make.right.equalTo(containerView.snp.right).offset(-12)
            make.bottom.equalTo(containerView.snp.bottom).offset(-18)
        

        }
        
    }

}
