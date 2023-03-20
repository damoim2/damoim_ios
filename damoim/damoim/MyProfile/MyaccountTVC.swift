//
//  MyaccountTVC.swift
//  damoim
//
//  Created by 원동진 on 2023/02/20.
//

import UIKit
import SnapKit
class MyaccountTVC: UITableViewCell {
    static let identi = "MyaccountTVCid"
    private lazy var containerView : UIView = {
        let containerView = UIView()
        
        return containerView
    }()
    private lazy var accountLabel : UILabel = {
        let accountLabel = UILabel()
        accountLabel.font = UIFont(name: CustomFont.Regular.rawValue, size: 15)
        accountLabel.textColor = UIColor(named: "gray02")
        return accountLabel
    }()
    private lazy var accuntModifyButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("수정/삭제", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Regular.rawValue, size: 15)!]))
        config.baseForegroundColor = UIColor(named: "grey03")
        let modifyButton = UIButton(configuration: config)
        return modifyButton
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

        // Configure the view for the selected state
    }

}
extension MyaccountTVC {
    private func setAddView(){
        contentView.addSubview(containerView)
        containerView.addSubview(accountLabel)
        containerView.addSubview(accuntModifyButton)
    }
    private func setAutoLayout(){
        containerView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(contentView.snp.right)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        accountLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top)
            make.left.equalTo(containerView.snp.left).offset(9)
            make.bottom.equalTo(containerView.snp.bottom).offset(-9)
        }
        accuntModifyButton.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top)
            make.bottom.equalTo(containerView.snp.bottom).offset(-9)
            make.right.equalTo(containerView.snp.right).offset(-9)
        }
    }
}
extension MyaccountTVC {
    func setAccountInfo (model: String){
        accountLabel.text = "\(model)"
    }
}
