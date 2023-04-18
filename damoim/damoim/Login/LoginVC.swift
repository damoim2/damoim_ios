//
//  LoginVC.swift
//  damoim
//
//  Created by 원동진 on 2023/04/18.
// login Start

import UIKit
import SnapKit
class LoginVC: UIViewController {
    private lazy var logImgView : UIImageView = {
        let logImgView = UIImageView()
        logImgView.image = UIImage(named: "logImgView")
        return logImgView
    }()
    private lazy var loginView : UIView = {
       let loginView = UIView()
        loginView.backgroundColor = .white
        return loginView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "purple01")
        addSubView()
        setAutoLayout()
    }
    

}
extension LoginVC {
    private func addSubView(){
        self.view.addSubview(logImgView)
    }
    private func setAutoLayout(){
        logImgView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(242)
            make.left.equalTo(self.view.safeAreaLayoutGuide).offset(90)
            make.right.equalTo(self.view.safeAreaLayoutGuide).offset(-90)
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct LoginVCPreview: PreviewProvider {
    static var previews: some View {
        LoginVC().showPreview(.iPhone14Pro)
    }
}
#endif
