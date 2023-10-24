//
//  UserStackView.swift
//  damoim
//
//  Created by 원동진 on 2023/06/07.
//

import UIKit

class UserStackView: UIView {
    private lazy var userStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 6
        
        return stackView
    }()
    private lazy var userImageView : UIImageView = {
        let userImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        userImage.image = UIImage(named: "testImg")
        return userImage
    }()
    private lazy var userNameLabel : UILabel = {
        let userName = UILabel()
        userName.text = "test"
        userName.font = UIFont(name: CustomFont.Medium.rawValue, size: 13)
        userName.textColor = UIColor(named: "grey02")
        userName.numberOfLines = 1
        userName.sizeToFit()
        return userName
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:\(coder): has not been implemented")
    }
    func configure(){
        addSubview(userStackView)
        userStackView.addStackSubViews([userImageView,userNameLabel])
        userStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            
            make.bottom.equalToSuperview()
        }
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
        userImageView.layer.masksToBounds = true
        
        
    }
    func setDataFormat(img : UIImage ,name :String){
        userImageView.image = img
        userNameLabel.text = name
        
    }
}
#if DEBUG
import SwiftUI

struct UserStackViewPreview: PreviewProvider {
    static var previews: some View {
        return UserStackView().showPreview()
    }
}
#endif
