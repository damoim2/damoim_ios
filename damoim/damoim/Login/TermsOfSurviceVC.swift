//
//  TermsOfSurvice.swift
//  damoim
//
//  Created by 원동진 on 2023/05/02.
//

import UIKit
import SnapKit
class TermsOfSurviceVC: UIViewController {
    

    private let logoImgView : UIButton = {
        let imgView = UIButton()
        imgView.setImage(UIImage(named: "LogoImg"), for: .normal)
        return imgView
    }()
    private let explainLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: CustomFont.Bold.rawValue, size: 17)
        label.textColor = UIColor(named: "grey02")
        label.text = "이용 약과 동의"
        label.textAlignment = .left
        return label
    }()
    private lazy var allAgreeView : UIView = {
        let view = UIStackView()
        view.backgroundColor = UIColor(named: "grey05")
        return view
    }()
    private lazy var allAgreeBtn : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle  = AttributedString("네,모두 동의합니다.", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.SemiBold.rawValue, size: 15)!]))
        config.baseForegroundColor = UIColor(named: "purple01")
        config.image = UIImage(named: "disableBtn")
        config.imagePadding = 8
        config.imagePlacement = .leading
        let btn = UIButton(configuration: config)
        btn.addTarget(self, action: #selector(tapAllAgreeBtn), for: .touchUpInside)
        btn.changesSelectionAsPrimaryAction = true
        return btn
        
    }()
    //이용약관
    private lazy var useTermView : UseAgreeView = {
        let useTermView = UseAgreeView()
        useTermView.setTitle("이용약관")
        useTermView.agreeBtn.addTarget(self, action: #selector(tapUseTemrBtn), for: .touchUpInside)
        return useTermView
    }()
    //개인 정보 처리방침
    private lazy var personalInfoView : UseAgreeView = {
        let useTermView = UseAgreeView()
        useTermView.setTitle("개인정보 처리방침")
        useTermView.agreeBtn.addTarget(self, action: #selector(tapPesonaInfoBtn), for: .touchUpInside)
        return useTermView
    }()
    // 마켓팅 수신 동의
    private lazy var upperStackView : UIStackView  = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 4
        stackView.alignment = .fill
        return stackView
    }()
    lazy var agreeBtn : UIButton = {
        var config = UIButton.Configuration.plain()
        config.baseForegroundColor = UIColor(named: "grey02")
        config.image = UIImage(named: "disableBtn")
        config.imagePadding = 8
        config.imagePlacement = .leading
        config.attributedTitle  = AttributedString("마켓팅 수신 동의", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.SemiBold.rawValue, size: 15)!]))
        let btn = UIButton(configuration: config)
        btn.changesSelectionAsPrimaryAction = true
        return btn
        
    }()
    private let essentialLabel : UILabel = {
        let label = UILabel()
        label.text = "(선택)"
        label.font = UIFont(name: CustomFont.Medium.rawValue, size: 15)
        label.textColor = UIColor(named: "purple02")
        return label
    }()
    private lazy var nextBtn : NextBtn = {
        let nextBtn = NextBtn()
        nextBtn.addTarget(self, action: #selector(tapNextBtn), for: .touchUpInside)
        return nextBtn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "grey06")
        addSubView()
        setAutoLayout()
        setCheckBoxAction()
    }
}
extension TermsOfSurviceVC {
    private func addSubView(){
        self.view.addSubview(logoImgView)
        self.view.addSubview(explainLabel)
        self.view.addSubview(allAgreeView)
        allAgreeView.addSubview(allAgreeBtn)
        self.view.addSubview(useTermView)
        self.view.addSubview(personalInfoView)
        self.view.addSubview(upperStackView)
        upperStackView.addArrangedSubview(agreeBtn)
        upperStackView.addArrangedSubview(essentialLabel)
        self.view.addSubview(nextBtn)
    }
    private func setAutoLayout(){
        logoImgView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(10)
            make.left.equalTo(self.view.snp.left).offset(16)
        }
        explainLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImgView.snp.bottom).offset(50)
            make.left.equalTo(self.view.snp.left).offset(34)
            make.right.equalTo(self.view.snp.right).offset(-34)
        }
        allAgreeView.snp.makeConstraints { make in
            make.top.equalTo(explainLabel.snp.bottom).offset(27)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
        }
        allAgreeBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(9)
            make.left.equalToSuperview().offset(34)
            make.bottom.equalToSuperview().offset(-9)
        }
        useTermView.snp.makeConstraints { make in
            make.top.equalTo(allAgreeBtn.snp.bottom).offset(33)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
        }
        personalInfoView.snp.makeConstraints { make in
            make.top.equalTo(useTermView.snp.bottom).offset(24)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
        }
        upperStackView.snp.makeConstraints { make in
            make.top.equalTo(personalInfoView.snp.bottom).offset(24)
            make.left.equalTo(self.view.snp.left).offset(34)
        }
        nextBtn.snp.makeConstraints { make in
            make.left.equalTo(self.view.snp.left).offset(34)
            make.right.equalTo(self.view.snp.right).offset(-34)
            make.bottom.equalTo(self.view.snp.bottom).offset(-34)
        }
    }
    @objc func tapUseTemrBtn(_ sender : UIButton){
        if sender.isSelected && personalInfoView.agreeBtn.isSelected{
            nextBtn.backgroundColor = UIColor(named: "purple01")
        }else {
            nextBtn.backgroundColor = UIColor(named: "grey04")
        }
    }
    @objc func tapPesonaInfoBtn(_ sender : UIButton){
        if sender.isSelected && useTermView.agreeBtn.isSelected{
            nextBtn.backgroundColor = UIColor(named: "purple01")
        }else {
            nextBtn.backgroundColor = UIColor(named: "grey04")
        }
    }
    @objc func tapNextBtn(){    
    }
    @objc func tapAllAgreeBtn(_ sender : UIButton){
        if sender.isSelected {
            [useTermView,personalInfoView].forEach { view in
                view.agreeBtn.isSelected = true
            }
            agreeBtn.isSelected = true
            nextBtn.backgroundColor = UIColor(named: "purple01")
        }else{
            [useTermView,personalInfoView].forEach { view in
                view.agreeBtn.isSelected = false
            }
            agreeBtn.isSelected = false
            nextBtn.backgroundColor = UIColor(named: "grey04")
        }
        
    }
  
    private func setCheckBoxAction(){
        [allAgreeBtn,agreeBtn].forEach { btn in
            btn.configurationUpdateHandler = { btn in
                var config = btn.configuration
                config?.image = btn.isSelected ? UIImage(named: "enableBtn") : UIImage(named: "disableBtn")
                config?.baseBackgroundColor = .clear
                btn.configuration = config
            }
            
        }
    }
}
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct TermsOfSurviceVCPreview: PreviewProvider {
    static var previews: some View {
        TermsOfSurviceVC().showPreview(.iPhone14Pro)
    }
}
#endif
