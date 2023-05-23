//
//  ExtensionUIStackView.swift
//  damoim
//
//  Created by 원동진 on 2023/05/09.
//

import Foundation
import UIKit
extension UIStackView{
    func addStackSubViews(_ views : [UIView]){
        _ = views.map{self.addArrangedSubview($0)}
    }
}
