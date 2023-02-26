//
//  GroupCVCellHeader.swift
//  damoim
//
//  Created by 원동진 on 2023/02/26.
//

import UIKit
import SnapKit
class GroupCVCellHeader: UICollectionReusableView {
    static let identi = "GroupCVCellHeaderid"
    private lazy var containerView : UIView = {
        let containerView = UIView()

        return containerView
    }()
    private lazy var groupLabel : UILabel = {
        let label = UILabel()
        label.text = "나의 모임"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    private lazy var buttonStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 6
        return stackView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setAddSubView()
        setAutoLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    private lazy var twoGridUIButton : UIButton = {
        let gridButton = UIButton()
        gridButton.setImage(UIImage(named: "twogrid"), for: .normal)
        return gridButton
    }()
    private lazy var threeGridUIButton : UIButton = {
        let gridButton = UIButton()
        gridButton.setImage(UIImage(named: "threegrid"), for: .normal)
        return gridButton
    }()
    func setAddSubView(){
        addSubview(containerView)
        containerView.addSubview(groupLabel)
        containerView.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(twoGridUIButton)
        buttonStackView.addArrangedSubview(threeGridUIButton)
    }
    func setAutoLayout(){
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        groupLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top)
            make.left.equalTo(containerView.snp.left)
            make.bottom.equalTo(containerView.snp.bottom)
            
        }
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top)
            make.bottom.equalTo(containerView.snp.bottom)
            make.right.equalTo(containerView.snp.right)
            
        }
        
    }
    
}
