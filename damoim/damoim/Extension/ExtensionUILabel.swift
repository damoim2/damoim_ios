//
//  ExtensionUILabel.swift
//  damoim
//
//  Created by 원동진 on 2023/03/16.
//

import UIKit
//extension UILabel {
//    func paddingLabel(top:CGFloat,left:CGFloat,bottom:CGFloat,right:CGFloat){
//        private var padding = UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
//        func drawText(in rect: CGRect) {
//            super.drawText(in: rect.inset(by: padding))
//        }
//        var intrinsicContentSize: CGSize {
//            var contentSize = super.intrinsicContentSize
//            contentSize.height += padding.top + padding.bottom
//            contentSize.width += padding.left + padding.right
//
//            return contentSize
//        }
//    }
//}
class BasePaddingLabel : UILabel {
    private var padding = UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
    convenience init(padding: UIEdgeInsets) {
        self.init()
        self.padding = padding
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right

        return contentSize
    }
}
