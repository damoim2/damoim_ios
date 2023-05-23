//
//  ExtensionTextField.swift
//  damoim
//
//  Created by 원동진 on 2023/04/27.
//

import Foundation
import UIKit
import SnapKit
class underLineTextField : UITextField {
    lazy var placeholderColor : UIColor = self.tintColor
    lazy var placeholderString : String = ""
    private lazy var underLineView : UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor(named: "grey05")
        return lineView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(underLineView)
        underLineView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        self.addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
        self.addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)
        self.becomeFirstResponder()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:\(coder): has not been implemented")
    }
    func setPlaceholder(_ placeholder: String,_ color : UIColor){
        placeholderString = placeholder
        placeholderColor = color
        setPlaceholedr()
        underLineView.backgroundColor = placeholderColor
    }
    func setPlaceholedr(){
        self.attributedPlaceholder = NSAttributedString(string: placeholderString,attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        
    }
    @objc func editingDidBegin(){
        setPlaceholedr()
        underLineView.backgroundColor = UIColor(named: "purple04")
    }
    @objc func editingDidEnd(){
        underLineView.backgroundColor = UIColor(named: "grey05")
    }
    
}
