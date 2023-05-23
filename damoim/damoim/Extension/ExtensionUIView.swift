//
//  ExtensionUIView.swift
//  damoim
//
//  Created by 원동진 on 2023/03/05.
//

import Foundation
import UIKit
extension UIView {
    func setChangeFont(changeLabel: UILabel,fontName : String,fontSize:CGFloat,targetStriong : String){
        let fullText = changeLabel.text ?? ""
        let attFont = UIFont(name: fontName, size: fontSize)
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetStriong)
        attributedString.addAttribute(.font, value: attFont!, range: range)
        changeLabel.attributedText = attributedString
        
    }
    enum VerticalLocation {
        case bottom
        case top
        case left
        case right
    }
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
    func addShadow(location: VerticalLocation, color: UIColor = .black, opacity: Float = 0.8, radius: CGFloat = 5.0) {
        switch location {
        case .bottom:
             addShadow(offset: CGSize(width: 0, height: 10), color: color, opacity: opacity, radius: radius)
        case .top:
            addShadow(offset: CGSize(width: 0, height: -10), color: color, opacity: opacity, radius: radius)
        case .left:
            addShadow(offset: CGSize(width: -10, height: 0), color: color, opacity: opacity, radius: radius)
        case .right:
            addShadow(offset: CGSize(width: 10, height: 0), color: color, opacity: opacity, radius: radius)
        }
    }

    func addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.1, radius: CGFloat = 3.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
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
    
}
#endif
