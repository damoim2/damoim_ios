//
//  CancelButton.swift
//  damoim
//
//  Created by 원동진 on 2023/05/30.
//

import UIKit
// img cacnelButton
class CancelButton: UIButton {
    var index : Int = 0
    convenience init(index: Int) {
        self.init()
        self.index = index
    }

}
