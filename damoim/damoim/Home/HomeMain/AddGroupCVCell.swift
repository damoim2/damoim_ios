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
    lazy var containerView : UIStackView = {
        let containerView = UIStackView()
        containerView.axis = .vertical
        containerView.distribution = .fill
        containerView.alignment = .fill
        containerView.spacing = 1
        return containerView
    }()
    private lazy var addGroupButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("새 모임 만들기", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Medium.rawValue, size: 13)!]))
        config.image = UIImage(named: "plusImg")
        config.imagePlacement = .top
        config.imagePadding = 15
        config.baseForegroundColor = UIColor.white
        let addGroupButton = UIButton(configuration: config)
        addGroupButton.layer.cornerRadius = 16
        addGroupButton.backgroundColor = UIColor(named: "purple04")
        return addGroupButton
    }()
    private lazy var requireConstraintLabel : UILabel = {
       let label = UILabel()
        label.font = UIFont(name: CustomFont.Regular.rawValue, size: 15)
        label.text = "onlyRequireConstraint" //제약조건 맞추기 위함
        label.textColor = .clear
        return label
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
        containerView.addArrangedSubview(addGroupButton)
        containerView.addArrangedSubview(requireConstraintLabel)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    func groupImageSameBtn(same : Bool){ // 모임 이미지와 새모임 만드기 버튼이 같을경우
        if same{
            requireConstraintLabel.isHidden = false
        }else{
            requireConstraintLabel.isHidden = true
        }
    }
   
}
