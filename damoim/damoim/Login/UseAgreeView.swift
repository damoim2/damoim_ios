//
//  UseAgreeView.swift
//  damoim
//
//  Created by 원동진 on 2023/05/02.
//

import Foundation
import UIKit
import SnapKit
class UseAgreeView : UIView {
    private lazy var upperView : UIView = {
        let upperView = UIView()
        return upperView
    }()
    private lazy var upperStackView : UIStackView  = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 4
        stackView.alignment = .fill
        return stackView
    }()
    lazy var agreeBtn : UIButton = {
        let btn = UIButton()
        btn.changesSelectionAsPrimaryAction = true
        return btn
    }()
    private let essentialLabel : UILabel = {
        let label = UILabel()
        label.text = "(필수)"
        label.font = UIFont(name: CustomFont.Medium.rawValue, size: 15)
        label.textColor = UIColor(named: "purple02")
        return label
    }()
    private lazy var agreeExplainLabel : BasePaddingLabel = {
        let label = BasePaddingLabel(padding: UIEdgeInsets(top: 6, left: 10, bottom: 6, right: 10))
        label.font = UIFont(name: CustomFont.Regular.rawValue, size: 13)
        label.textColor = UIColor(named: "grey03")
        label.text = "소리다.이것은 실로 위하여 이것이다. 청춘 그림자는 원대하고, 타오르고 기관과 부패를 수 밝은 소리다.이것은 이것이다. 같은 바이며, 꽃 길을 보이는 만물은 쓸쓸하랴? 온갖 하는 있으며, 찾아다녀도, 힘차게 있는가? 때에, 노래하며 무한한 것이다. 공자는 위하여서 예수는 인간에 길지 있으며, 이것이다. 보이는 기쁘며, 무한한 가진 것이다. 곳으로 석가는 얼마나 동력은 만천하의 무엇을 풀이 사막이다. 내는 곧 대한 봄바람이다. 때에, 보이는 피어나는 반짝이는 것이다. 위하여 스며들어 이상의 뛰노는 어디 그들은 피고, 있으며, 더운지라 그리하였는가?"
        label.numberOfLines = 0
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(named: "grey05")?.cgColor
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUseAgreeView()
        setCheckBox()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:\(coder): has not been implemented")
    }
    private func setUseAgreeView(){
        addSubview(upperView)
        upperView.addSubview(upperStackView)
        upperStackView.addArrangedSubview(agreeBtn)
        upperStackView.addArrangedSubview(essentialLabel)
        upperView.addSubview(agreeExplainLabel)
        upperView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        upperStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(34)
            
        }
        agreeExplainLabel.snp.makeConstraints { make in
            make.top.equalTo(upperStackView.snp.bottom).offset(6)
            make.left.equalToSuperview().offset(34)
            make.right.equalToSuperview().offset(-34)
            make.bottom.equalToSuperview()
            
        }
        
        

    }
    private func setCheckBox(){
        agreeBtn.configurationUpdateHandler = {  btn in
            var config = btn.configuration
            config?.image = btn.isSelected ? UIImage(named: "enableBtn") : UIImage(named: "disableBtn")
            config?.baseBackgroundColor = .clear
            btn.configuration = config
            
        }
    }
    func setTitle(_ title: String){
        var config = UIButton.Configuration.plain()
        config.baseForegroundColor = UIColor(named: "grey02")
        config.image = UIImage(named: "disableBtn")
        config.imagePadding = 8
        config.imagePlacement = .leading
        config.attributedTitle  = AttributedString("\(title)", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.SemiBold.rawValue, size: 15)!]))
        agreeBtn.configuration = config
    }
}
#if DEBUG
import SwiftUI

struct UseAgreeViewPreview: PreviewProvider {
    static var previews: some View {
        return UseAgreeView().showPreview()
    }
}
#endif
