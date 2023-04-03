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
        self.contentView.addSubview(groupImgView)
        self.contentView.addSubview(groupNameLabel)
        groupImgView.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top)
            make.left.equalTo(self.contentView.snp.left)
            make.right.equalTo(self.contentView.snp.right)
        }
        groupNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.groupImgView.snp.bottom)
            make.left.equalTo(self.contentView.snp.left)
            make.right.equalTo(self.contentView.snp.right)
            make.bottom.equalTo(self.contentView.snp.bottom)
        }
    }
}

