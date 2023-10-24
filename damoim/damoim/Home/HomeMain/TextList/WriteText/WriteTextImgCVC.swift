//
//  WriteTextImgCVC.swift
//  damoim
//
//  Created by 원동진 on 2023/05/29.
//

import UIKit
import SnapKit
class WriteTextImgCVC: UICollectionViewCell {
    static let identi = "WriteTextImgCVCid"
    var cacnelButtonAction : (() -> Void) = {}
    private var upperView  : UIView = {
        let upperView = UIView()
        return upperView
    }()
    private lazy var writeTextImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.layer.cornerRadius = 8
        imgView.layer.masksToBounds = true
        return imgView
    }()
    lazy var imgCancelBtn : CancelButton = {
        let cancelBtn = CancelButton()
        cancelBtn.setImage(UIImage(named: "imgCancel"), for: .normal)
        cancelBtn.addTarget(self, action: #selector(tapCancelImg), for: .touchUpInside)
        return cancelBtn
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension WriteTextImgCVC {
    private func configure(){
        addSubview(upperView)
        addSubViews([writeTextImgView,imgCancelBtn])
        upperView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        writeTextImgView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.left.bottom.equalToSuperview()
        }
        imgCancelBtn.snp.makeConstraints { make in
            make.top.right.equalToSuperview()
            
        }
    }
    func setImg(model : UIImage){
        writeTextImgView.image = model
    }
    func setIndex(model : Int){
        imgCancelBtn.index = model
    }
    @objc func tapCancelImg(){
        cacnelButtonAction()
    }
}
