//
//  MyProfileTVC.swift
//  damoim
//
//  Created by 원동진 on 2023/02/20.
//

import UIKit

class MyProfileTVC: UITableViewCell {
    static let identi = "MyProfileTVCid"
    private lazy var containerView : UIView = {
        let containerView = UIView()
        
        return containerView
    }()
    private lazy var profileLabel : UILabel = {
        let profileLabel = UILabel()
        profileLabel.font = UIFont(name: CustomFont.Regular.rawValue, size: 15)
        profileLabel.textColor = UIColor(named: "gray02")
        return profileLabel
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setAddView()
        setAutoLayout()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
   
}
extension MyProfileTVC {
    private func setAutoLayout(){
        containerView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(contentView.snp.right)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        profileLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(9)
            make.left.equalTo(containerView.snp.left).offset(9)
            make.bottom.equalTo(containerView.snp.bottom).offset(-9)
        }
    }
    private func setAddView(){
        contentView.addSubview(containerView)
        containerView.addSubview(profileLabel)
    }
}


extension MyProfileTVC {
    func setString(model: String,font : String, fontsize : CGFloat,textcolor : String){
        profileLabel.text = "\(model)"
        profileLabel.font = UIFont(name: font, size: fontsize)
        profileLabel.textColor = UIColor(named: textcolor)
    }
    
}
