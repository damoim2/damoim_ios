//
//  ExtensionUIViewController.swift
//  damoim
//
//  Created by 원동진 on 2023/03/13.
//

import Foundation
import UIKit
extension UIViewController {
//    func changeStatusBarBgColor(bgColor: UIColor?) {
//            if #available(iOS 13.0, *) {
//                let window = UIApplication.shared.windows.first
//                let statusBarManager = window?.windowScene?.statusBarManager
//                
//                let statusBarView = UIView(frame: statusBarManager?.statusBarFrame ?? .zero)
//                statusBarView.backgroundColor = bgColor
//                
//                window?.addSubview(statusBarView)
//            } else {
//                let statusBarView = UIApplication.shared.value(forKey: "statusBar") as? UIView
//                statusBarView?.backgroundColor = bgColor
//            }
//        }
}
enum DeviceType {
    case iPhoneSE2
    case iPhone8
    case iPhone12Pro
    case iPhone12ProMax
    case iPhone14Pro

    func name() -> String {
        switch self {
        case .iPhoneSE2:
            return "iPhone SE"
        case .iPhone8:
            return "iPhone 8"
        case .iPhone12Pro:
            return "iPhone 12 Pro"
        case .iPhone12ProMax:
            return "iPhone 12 Pro Max"
        case .iPhone14Pro:
            return "iPhone 14 Pro"
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
extension UIViewController {

    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }

    func showPreview(_ deviceType: DeviceType = .iPhone12Pro) -> some View {
        Preview(viewController: self).previewDevice(PreviewDevice(rawValue: deviceType.name()))
    }
}
#endif
extension UIViewController {
    @objc func backVC(){
        self.navigationController?.popViewController(animated: true)
    }
    @objc func tapDismiss(){
        self.presentingViewController?.dismiss(animated: true)
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

