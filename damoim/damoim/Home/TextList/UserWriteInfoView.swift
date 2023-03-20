//
//  UserWriteInfoView.swift
//  damoim
//
//  Created by 원동진 on 2023/03/13.
//

import UIKit
import SnapKit
//cell에 customVieW불러온디 data 바인딩을 할줄 모르겠따.. data binding 할줄을 모르겠다,,,
class UserWriteInfoView: UIView {
    private lazy var containerView : UIView = {
       let containerView = UIView()
        return containerView
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
    private lazy var dateLabel : UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = UIFont(name: CustomFont.Regular.rawValue, size: 10)
        dateLabel.textColor = UIColor(named: "grey03")
        return dateLabel
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        addAutoLayout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    private func addSubView(){
        addSubview(containerView)
        containerView.addSubview(userStackView)
        containerView.addSubview(dateLabel)
        userStackView.addArrangedSubview(userImageView)
        userStackView.addArrangedSubview(userNameLabel)
    }
    private func addAutoLayout(){
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        userStackView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(10)
            make.left.equalTo(containerView.snp.left).offset(16)
            make.bottom.equalTo(containerView.snp.bottom)
        }
    }
 

}

