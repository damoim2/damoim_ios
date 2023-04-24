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
    var gridThreeAction :(() -> ())?
    var gridTwoAction :(() -> ())?
    private lazy var containerView : UIView = {
        let containerView = UIView()

        return containerView
    }()
    private lazy var groupLabel : UILabel = {
        let label = UILabel()
        label.text = "나의 모임"
        label.font = UIFont(name: CustomFont.Bold.rawValue, size: 17)
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
        self.threeGridUIButton.addTarget(self, action: #selector(tapThreeGrid), for: .touchUpInside)
        self.twoGridUIButton.addTarget(self, action: #selector(tapTwoGrid), for: .touchUpInside)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    private lazy var twoGridUIButton : UIButton = {
        let gridButton = UIButton()
        gridButton.setImage(UIImage(named: "twofillgrid"), for: .normal)
        return gridButton
    }()
    
    private lazy var threeGridUIButton : UIButton = {
        let gridButton = UIButton()
        gridButton.setImage(UIImage(named: "threegrid"), for: .normal)
        return gridButton
    }()
    
    @objc func tapTwoGrid(sender : UIButton!){
        twoGridUIButton.setImage(UIImage(named: "twofillgrid"), for: .normal)
        threeGridUIButton.setImage(UIImage(named: "threegrid"), for: .normal)
        gridTwoAction?()
    }
    @objc func tapThreeGrid(sender : UIButton!){
        twoGridUIButton.setImage(UIImage(named: "twogrid"), for: .normal)
        threeGridUIButton.setImage(UIImage(named: "threefillgrid"), for: .normal)
        gridThreeAction?()
    }
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
            make.left.equalTo(containerView.snp.left).offset(16)
            make.bottom.equalTo(containerView.snp.bottom)
            
        }
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top)
            make.bottom.equalTo(containerView.snp.bottom)
            make.right.equalTo(containerView.snp.right).offset(-16)
            
        }
        
    }
   
    
}
