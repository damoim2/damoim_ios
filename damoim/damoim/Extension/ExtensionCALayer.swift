//
//  ExtensionCALayer.swift
//  damoim
//
//  Created by 원동진 on 2023/04/27.
//

import Foundation
import UIKit
extension CALayer{
    func addBorder(_ arr_edge:[UIRectEdge],color: UIColor,width:CGFloat){
        for edge in arr_edge {
                    let border = CALayer()
                    switch edge {
                    case UIRectEdge.top:
                        border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                        break
                    case UIRectEdge.bottom:
                        border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                        break
                    case UIRectEdge.left:
                        border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                        break
                    case UIRectEdge.right:
                        border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                        break
                    default:
                        break
                    }
                    border.backgroundColor = color.cgColor;
                    self.addSublayer(border)
                }
    }
}
/*
your_view.layer.addBorder([.top, .bottom], color: UIColor.white, width: 1.0)
UIRectEdge.all, 전체
UIRectEdge.top, 상단
UIRectEdge.bottom, 하단
UIRectEdge.left, 왼쪽
UIRectEdge.right, 오른쪽
*/
