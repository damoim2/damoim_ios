//
//  SignUpVC.swift
//  damoim
//
//  Created by 원동진 on 2023/04/27.
//

import UIKit
import SnapKit
class SignUpVC: UIViewController {
    private let logoImgView : UIButton = {
        let imgView = UIButton()
        imgView.setImage(UIImage(named: "LogoImg"), for: .normal)
        return imgView
    }()
    private let explainLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: CustomFont.Bold.rawValue, size: 17)
        label.textColor = UIColor(named: "grey02")
        label.text = "다모임 시작을 위한 정보를 입력해주세요"
        label.textAlignment = .left
        return label
    }()
    private lazy var inputStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
        
    }()
    private lazy var nameInputView : SignInputView = {
        let inputView = SignInputView()
        inputView.inputTypeLabel.text = "이름"
        inputView.inputField.setPlaceholder(" 이름을 입력하세요", UIColor(named: "grey04") ?? UIColor.gray)
        return inputView
    }()
    private lazy var emailInputView : SignInputView = {
        let inputView = SignInputView()
        inputView.inputTypeLabel.text = "이메일"
        inputView.inputField.setPlaceholder(" 이메일을 입력하세요", UIColor(named: "grey04") ?? UIColor.gray)
        return inputView
    }()
    private lazy var phoneInputView : SignInputView = {
        let inputView = SignInputView()
        
        inputView.inputTypeLabel.text = "휴대폰 번호"
        inputView.inputField.setPlaceholder(" 휴대폰 번호를 입력하세요", UIColor(named: "grey04") ?? UIColor.gray)
        inputView.inputField.keyboardType = .numberPad
        return inputView
    }()
    
    private lazy var jobtypeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: CustomFont.Medium.rawValue, size: 13)
        label.textColor = UIColor(named: "purple01")
        label.text = "직업 선택"
        label.textAlignment = .left
        return label
    }()
    private lazy var jobSelectButton1 : UIButton = {
        let selectBtn = UIButton()
        setConfig(selectBtn, UIImage(named: "dropDown") ?? UIImage(),"직업 분류")
        selectBtn.layer.borderWidth = 1
        selectBtn.layer.borderColor = UIColor(named: "purple04")?.cgColor
        selectBtn.layer.cornerRadius = 16
        selectBtn.addTarget(self, action: #selector(dropDown), for: .touchUpInside)
        return selectBtn
        
    }()
    
    private lazy var dropDownStackVIew : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 6
        stackView.distribution = .equalSpacing
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor(named: "purple04")?.cgColor
        stackView.layer.cornerRadius = 16
        stackView.layer.masksToBounds = true
//        stackView.isHidden = true
        return stackView
    }()
    private lazy var jobSelectButton2 : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("직업 분류", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Medium.rawValue, size: 13)!]))
        config.baseForegroundColor = UIColor(named: "purple01")
        config.imagePadding = 15
        config.imagePlacement = .trailing
        config.image = UIImage(named: "foldUp")
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 6, leading: 12, bottom: 6, trailing: 4)
        let selectBtn = UIButton(configuration: config)
        selectBtn.addTarget(self, action: #selector(foldUp), for: .touchUpInside)
        
        selectBtn.isEnabled = true
        return selectBtn
        
    }()
    private lazy var type1Btn : UIButton = {// 직장인
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("직장인", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Medium.rawValue, size: 13)!]))
        config.baseForegroundColor = UIColor(named: "grey01")
        let btn = UIButton(configuration: config)
        btn.addTarget(self, action: #selector(tapType1), for: .touchUpInside)
        return btn
    }()
    private lazy var type2Btn : UIButton = {//직업 서칭중
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("직업 서칭중", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Medium.rawValue, size: 13)!]))
        config.baseForegroundColor = UIColor(named: "grey01")
        config.titleAlignment = .leading
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 12, bottom: 0, trailing: 0)
        let btn = UIButton(configuration: config)
        btn.addTarget(self, action: #selector(tapType2), for: .touchUpInside)
        return btn
        
    }()
    private lazy var type3Btn : UIButton = {// 직업입력
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("직접 입력", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Medium.rawValue, size: 13)!]))
        config.baseForegroundColor = UIColor(named: "grey01")
        config.titleAlignment = .leading
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 12, bottom: 12, trailing: 0)
        let btn = UIButton(configuration: config)
        btn.addTarget(self, action: #selector(tapType3), for: .touchUpInside)
        return btn
        
    }()
    //직업 직접입력
    private lazy var jopInputTextField : underLineTextField = {
        let inputField = underLineTextField()
        inputField.borderStyle = .none
        inputField.tintColor = UIColor(named: "grey01")
        inputField.textColor = UIColor(named: "grey01")
        inputField.font = UIFont(name: CustomFont.Regular.rawValue, size: 13)
        inputField.setPlaceholder(" 직업을 입력하세요", UIColor(named: "grey04") ?? UIColor.gray)
        return inputField
    }()
    // 다음버튼
    private lazy var nextBtn : NextBtn = {
        let nextBtn = NextBtn()
        nextBtn.addTarget(self, action: #selector(nextBtnAction), for: .touchUpInside)
        return nextBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "grey06")
        addSubView()
        setAutoLayout()
        
        
    }
    
}
extension SignUpVC {
    private func addSubView(){
        self.view.addSubview(logoImgView)
        self.view.addSubview(explainLabel)
        self.view.addSubview(inputStackView)
        inputStackView.addArrangedSubview(nameInputView)
        inputStackView.addArrangedSubview(emailInputView)
        inputStackView.addArrangedSubview(phoneInputView)
        self.view.addSubview(jobtypeLabel)
        self.view.addSubview(jobSelectButton1)
        self.view.addSubview(nextBtn)
        self.view.addSubview(dropDownStackVIew)
        self.view.bringSubviewToFront(jobSelectButton1)
        self.view.addSubview(jopInputTextField)
        dropDownStackVIew.addArrangedSubview(jobSelectButton2)
        dropDownStackVIew.addArrangedSubview(type1Btn)
        dropDownStackVIew.addArrangedSubview(type2Btn)
        dropDownStackVIew.addArrangedSubview(type3Btn)
        dropDownStackVIew.isHidden = true
        jopInputTextField.isHidden = true
        
    }
    private func setAutoLayout(){
        logoImgView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(10)
            make.left.equalToSuperview().offset(16)
            
        }
        explainLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImgView.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(34)
            make.right.equalToSuperview().offset(-34)
        }
        inputStackView.setContentCompressionResistancePriority(.required, for: .vertical)
        inputStackView.snp.makeConstraints { make in
            make.top.equalTo(explainLabel.snp.bottom).offset(32)
            make.left.equalToSuperview().offset(34)
            make.right.equalToSuperview().offset(-34)
            make.bottom.equalTo(jobtypeLabel.snp.top).offset(-34)
        }
        jobtypeLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.top).offset(self.view.frame.height * 0.5)
            make.left.equalToSuperview().offset(34)
            make.right.equalToSuperview().offset(-34)
        }
        jobSelectButton1.snp.makeConstraints { make in
            make.top.equalTo(jobtypeLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(34)
        }
        
        dropDownStackVIew.snp.makeConstraints { make in
            make.top.equalTo(jobtypeLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(34)
        }
        nextBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(34)
            make.right.equalToSuperview().offset(-34)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-34)
        }
        jopInputTextField.snp.makeConstraints { make in
            make.top.equalTo(jobSelectButton1.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(34)
            make.right.equalToSuperview().offset(-34)
        }
        
        
    }
//MARK: - Btn action
    @objc func dropDown(){
        dropDownStackVIew.isHidden = false
        jobSelectButton1.isHidden = true
        jopInputTextField.isHidden = true
        self.view.bringSubviewToFront(dropDownStackVIew)
        
    }
    @objc func foldUp(){
        setConfig(jobSelectButton1, UIImage(named: "dropDown") ?? UIImage(),"직업 분류")
        jobSelectButton1.isHidden = false
        dropDownStackVIew.isHidden = true
        jopInputTextField.isHidden = true
        self.view.bringSubviewToFront(jobSelectButton1)
    }
    @objc func tapType1(){
        setConfig(jobSelectButton1, UIImage(named: "dropDown") ?? UIImage(),"직장인")
        jobSelectButton1.isHidden = false
        dropDownStackVIew.isHidden = true
        jopInputTextField.isHidden = true
        self.view.bringSubviewToFront(jobSelectButton1)
    }
    @objc func tapType2(){
        setConfig(jobSelectButton1, UIImage(named: "dropDown") ?? UIImage(),"직업 서칭중")
        jobSelectButton1.isHidden = false
        dropDownStackVIew.isHidden = true
        jopInputTextField.isHidden = true
        self.view.bringSubviewToFront(jobSelectButton1)
        
    }
    @objc func tapType3(){
        setConfig(jobSelectButton1, UIImage(named: "dropDown") ?? UIImage(),"직접 입력")
        jobSelectButton1.isHidden = false
        dropDownStackVIew.isHidden = true
        jopInputTextField.isHidden = false
        self.view.bringSubviewToFront(jobSelectButton1)
        
    }
    @objc func nextBtnAction(){
        let vc = TermsOfSurviceVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
      
    }
    private func setConfig(_ btn : UIButton,_ image : UIImage,_ str: String){
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString(str, attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Medium.rawValue, size: 13)!]))
        config.baseForegroundColor = UIColor(named: "purple01")
        config.imagePadding = 15
        config.imagePlacement = .trailing
        config.image = image
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 6, leading: 12, bottom: 6, trailing: 4)
        btn.configuration = config
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct SignUpVCPreview: PreviewProvider {
    static var previews: some View {
        SignUpVC().showPreview(.iPhone14Pro)
    }
}
#endif
