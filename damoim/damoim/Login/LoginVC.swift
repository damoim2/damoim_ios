//
//  LoginVC.swift
//  damoim
//
//  Created by 원동진 on 2023/04/18.
// login Start

import UIKit
import SnapKit
class LoginVC: UIViewController {
    private lazy var firstView : UIView = {
       let firstView = UIView()
        return firstView
    }()
    private lazy var logoImgView : UIImageView = {
        let logoImgView = UIImageView()
        logoImgView.image = UIImage(named: "LogoImg")
        return logoImgView
    }()
    private lazy var loginView : UIView = {
        let loginView = UIView()
        loginView.backgroundColor = UIColor(named: "grey06")
        loginView.layer.cornerRadius = 20
        loginView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        loginView.layer.masksToBounds = true
        return loginView
    }()
    private lazy var explainLabel : UILabel = {
        let explainLabel = UILabel()
        explainLabel.font = UIFont(name: CustomFont.Medium.rawValue, size: 17)
        explainLabel.textColor = UIColor(named: "grey02")
        explainLabel.textAlignment = .center
        explainLabel.text = "로그인 방법을 선택하세요."
        return explainLabel
    }()
    private lazy var loginStackView : UIStackView = {
        let loginStackView = UIStackView()
        loginStackView.axis = .vertical
        loginStackView.spacing = 10
        loginStackView.distribution = .fillEqually
        loginStackView.alignment = .fill
        return loginStackView
    }()
    private lazy var googleBtn : UIButton = {
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0)
        config.image = UIImage(named: "google")
        let googleBtn = UIButton(configuration: config)
        googleBtn.layer.shadowColor = UIColor.black.cgColor
        googleBtn.layer.shadowOpacity = 0.1
        googleBtn.layer.shadowOffset = CGSize.zero
        googleBtn.layer.shadowRadius = 2
        googleBtn.addTarget(self, action: #selector(tempAction), for: .touchUpInside)
        return googleBtn
    }()
    private lazy var appleBtn : UIButton = {
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0)
        config.image = UIImage(named: "apple")
        let appleBtn = UIButton(configuration: config)
        appleBtn.layer.shadowColor = UIColor.black.cgColor
        appleBtn.layer.shadowOpacity = 0.1
        appleBtn.layer.shadowOffset = CGSize.zero
        appleBtn.layer.shadowRadius = 2
        return appleBtn
    }()
    private lazy var kakaoBtn : UIButton = {
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0)
        config.image = UIImage(named: "kakao")
        let kakaoBtn = UIButton(configuration: config)
        kakaoBtn.layer.shadowColor = UIColor.black.cgColor
        kakaoBtn.layer.shadowOpacity = 0.1
        kakaoBtn.layer.shadowOffset = CGSize.zero
        kakaoBtn.layer.shadowRadius = 2
        return kakaoBtn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.view.backgroundColor = UIColor(named: "purple01")
        setGradient()
        addSubView()
        setAutoLayout()
    }
    
    
}
extension LoginVC {
    private func addSubView(){
        self.view.addSubview(firstView)
        firstView.addSubview(logoImgView)
        self.view.addSubview(loginView)
        loginView.addSubview(explainLabel)
        loginView.addSubview(loginStackView)
        loginStackView.addArrangedSubview(googleBtn)
        loginStackView.addArrangedSubview(appleBtn)
        loginStackView.addArrangedSubview(kakaoBtn)
    }
    private func setAutoLayout(){
        firstView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.left.equalTo(self.view.safeAreaLayoutGuide)
            make.right.equalTo(self.view.safeAreaLayoutGuide)
        }
        logoImgView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        loginView.snp.makeConstraints { make in
            make.top.equalTo(firstView.snp.bottom)
            make.left.equalTo(self.view.safeAreaLayoutGuide)
            make.right.equalTo(self.view.safeAreaLayoutGuide)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        explainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28)
            make.centerX.equalToSuperview()
        }
        loginStackView.snp.makeConstraints { make in
            make.top.equalTo(explainLabel.snp.bottom).offset(28)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-62)
        }
    }
    private func setGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        let color1 = UIColor(named: "purple01")
        let color2 = UIColor(named: "purple02")
        gradientLayer.colors = [color1!.cgColor,color2!.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.view.layer.addSublayer(gradientLayer)
    }
    @objc func tempAction(){
        let vc = SignUpVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
      
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
