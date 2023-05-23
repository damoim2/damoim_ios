//
//  ExtensionUIView.swift
//  damoim
//
//  Created by 원동진 on 2023/03/05.
//

import Foundation
import UIKit
extension UIView {
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
    func addSubViews(_ views : [UIView]){
        _ = views.map{self.addSubview($0)}
    }
}
#if canImport(SwiftUI) && DEBUG
import SwiftUI
extension UIView {
    private struct Preview: UIViewRepresentable {
        typealias UIViewType = UIView

        let view: UIView

        func makeUIView(context: Context) -> UIView {
            return view
        }

        func updateUIView(_ uiView: UIView, context: Context) {
        }
    }

    func showPreview() -> some View {
        Preview(view: self).previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
    }
    func setChangeFont(changeLabel: UILabel,fontName : String,fontSize:CGFloat,targetStriong : String){
        let fullText = changeLabel.text ?? ""
        let attFont = UIFont(name: fontName, size: fontSize)
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetStriong)
        attributedString.addAttribute(.font, value: attFont!, range: range)
        changeLabel.attributedText = attributedString
        
    }
}
#endif
