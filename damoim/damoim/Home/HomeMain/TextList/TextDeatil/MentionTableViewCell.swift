//
//  MetionTableViewCell.swift
//  damoim
//
//  Created by 원동진 on 2023/06/07.
//

import UIKit

class MentionTableViewCell: UITableViewCell {
    static let identi = "MetionTableViewCellid"
    private lazy var userStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 6
        
        return stackView
    }()
    private lazy var userImageView : UIImageView = {
        let userImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        userImage.image = UIImage(named: "testImg")
        return userImage
    }()
    private lazy var userNameLabel : UILabel = {
        let userName = UILabel()
        userName.text = "test"
        userName.font = UIFont(name: CustomFont.Medium.rawValue, size: 13)
        userName.textColor = UIColor(named: "grey02")
        userName.numberOfLines = 1
        userName.sizeToFit()
        return userName
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func configure(){
        addSubview(userStackView)
        userStackView.addStackSubViews([userImageView,userNameLabel])
        userStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(6)
            make.left.equalToSuperview()
            make.bottom.equalToSuperview().offset(-6)
            
        }
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
        userImageView.layer.masksToBounds = true
    }
    func setData(model : MentionDataFormat){
        userImageView.image = model.userImg
        userNameLabel.text = model.userName
        
    }
}
