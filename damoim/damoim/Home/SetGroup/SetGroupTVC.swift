//
//  SetGroupTVC.swift
//  damoim
//
//  Created by 원동진 on 2023/03/05.
//

import UIKit

class SetGroupTVC: UITableViewCell {
    static let identi = "SetGroupTVCid"
    private lazy var imgView : UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()
    private lazy var setNameLabel : UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont(name: CustomFont.Medium.rawValue, size: 15)
        nameLabel.textColor = UIColor(named: "grey02")
        nameLabel.textAlignment = .left
        return nameLabel
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setCell()
        
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    private func setCell(){
        contentView.addSubview(imgView)
        contentView.addSubview(setNameLabel)
        imgView.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(10)
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        setNameLabel.snp.makeConstraints { make in
            make.left.equalTo(imgView.snp.right).offset(8)
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.snp.bottom)
            
        }
    }
    func setmanage(model : SetManageForm){
        setNameLabel.text = model.name
        imgView.image = model.image
    }
}
