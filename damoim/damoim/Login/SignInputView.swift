//
//  InputView.swift
//  damoim
//
//  Created by 원동진 on 2023/04/27.
//

import Foundation
import UIKit
import SnapKit
class SignInputView : UIView {
    lazy var upperView : UIStackView = {
        let UIStackView = UIStackView()
        UIStackView.axis = .vertical
        UIStackView.distribution = .fill
        UIStackView.spacing = 4
        UIStackView.alignment = .fill
        return UIStackView
    }()
    lazy var inputTypeLabel : UILabel = {
       let label = UILabel()
        label.text = "이름"
        label.textColor = UIColor(named: "purple01")
        label.font = UIFont(name: CustomFont.Medium.rawValue, size: 13)
        return label
    }()
    lazy var inputField : underLineTextField = {
        let textField = underLineTextField()
        textField.borderStyle = .none
        textField.tintColor = UIColor(named: "grey01")
        textField.textColor = UIColor(named: "grey01")
        textField.font = UIFont(name: CustomFont.Regular.rawValue, size: 13)
        textField.setPlaceholder(" 이름을 입력하세요", UIColor(named: "grey04") ?? UIColor.gray)
        return textField
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSignputView()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:\(coder): has not been implemented")
    }
    private func setSignputView(){
        addSubview(upperView)
        upperView.addArrangedSubview(inputTypeLabel)
        upperView.addArrangedSubview(inputField)
        upperView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
    }
}
#if DEBUG
import SwiftUI

struct SignInputViewPreview: PreviewProvider {
    static var previews: some View {
        return SignInputView().showPreview()
    }
}
#endif
