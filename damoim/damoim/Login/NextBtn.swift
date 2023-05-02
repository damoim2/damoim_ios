//
//  nextBtn.swift
//  damoim
//
//  Created by 원동진 on 2023/05/02.
//

import Foundation
import UIKit
class NextBtn : UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("다음", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Medium.rawValue, size: 13)!]))
        config.baseForegroundColor = UIColor(named: "grey06")
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 12, leading: 12, bottom: 12, trailing: 4)
        config.titleAlignment = .leading
        
        self.configuration = config
        self.layer.cornerRadius = 16
        self.backgroundColor = UIColor(named: "grey04")
        self.layer.masksToBounds = true
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:\(coder): has not been implemented")
    }
}
