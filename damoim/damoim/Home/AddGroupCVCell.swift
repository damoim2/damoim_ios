//
//  AddGroupCVFooter.swift
//  damoim
//
//  Created by 원동진 on 2023/03/02.
//

import UIKit
import SnapKit
class AddGroupCVCell: UICollectionViewCell {
    static let identi = "AddGroupCVCellid"
    static var numberOfCol = 2
    private lazy var containerView : UIView = {
        let containerView = UIView()
        return containerView
    }()
    private lazy var addGroupButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("새 모임 만들기", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Regular.rawValue, size: 13)!]))
        config.image = UIImage(named: "plusImg")
        config.imagePlacement = .top
        config.imagePadding = 15
        config.baseForegroundColor = UIColor.white
        let addGroupButton = UIButton(configuration: config)
        addGroupButton.layer.cornerRadius = 16
        addGroupButton.backgroundColor = UIColor(named: "purple04")
        return addGroupButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setFooterView()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    func setFooterView(){
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.bottom.right.equalToSuperview()
        }
        containerView.addSubview(addGroupButton)
        addGroupButton.snp.makeConstraints { make in
            make.width.equalToSuperview()
            
            make.height.equalToSuperview()
        }
    }
}
