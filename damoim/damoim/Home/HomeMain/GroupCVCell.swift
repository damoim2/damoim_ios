//
//  GroupCVCell.swift
//  damoim
//
//  Created by 원동진 on 2023/02/21.
//

import UIKit
import SnapKit
class GroupCVCell: UICollectionViewCell {
    static let identi = "GroupCVCellid"
    private lazy var upperView : UIStackView = {
       let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 1
        return view
    }()
     let groupImgView : UIImageView = {
        let ImgView = UIImageView()
        ImgView.contentMode = .scaleAspectFill
        
        return ImgView
    }()
    private lazy var groupNameLabel : UILabel = {
        let groupName = UILabel()
        groupName.textAlignment = .center
        groupName.font = UIFont(name: CustomFont.Regular.rawValue, size: 15)
        return groupName
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setCell()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    func prepare(model : ExampleCVItem){
        self.groupImgView.image = model.groupImage
        self.groupNameLabel.text = model.groupName
    }
    
    
}
extension GroupCVCell {
    private func setCell(){
        self.contentView.addSubview(upperView)
        upperView.addArrangedSubview(groupImgView)
        upperView.addArrangedSubview(groupNameLabel)
        upperView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
}

