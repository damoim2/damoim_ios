//
//  ExtensionCATransition.swift
//  damoim
//
//  Created by 원동진 on 2023/04/18.
//

import Foundation
import UIKit
extension CATransition {
    func segueFromBottom() -> CATransition {
        duration = 0.375 //set the duration to whatever you'd like.
        timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut) //Ease-in-ease-out 페이싱은 애니메이션이 느리게 시작되고 지속 시간 중간까지 가속화된 다음 완료되기 전에 다시 느려지게 합니다.
        type = .moveIn // 기촌 콘텐츠 위에 새로운 콘텐츠가 덮이는 형태
        subtype = .fromTop// 시작되는 위치
        return self
    }
    
    func segueFromTop() -> CATransition {
        duration = 0.375 //set the duration to whatever you'd like.
        timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        //easeInEaseOut
        type = .moveIn
        subtype = .fromBottom
        return self
    }
    
    func segueFromLeft() -> CATransition {
        duration = 0.8 //set the duration to whatever you'd like.
        timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        type = .moveIn
        subtype = .fromLeft
        return self
    }
    func segueFromRight() -> CATransition {
        duration = 0.8 //set the duration to whatever you'd like.
        timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        type = .moveIn
        subtype = .fromRight
        return self
    }
    
    func popFromRight() -> CATransition {
        duration = 0.1 //set the duration to whatever you'd like.
        timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        type = .reveal
        subtype = .fromRight
        return self
    }
    
    func popFromLeft() -> CATransition {
        duration = 0.1 //set the duration to whatever you'd like.
        timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        type = .reveal
        subtype = .fromLeft
        return self
    }
}
