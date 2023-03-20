//
//  ScheduleButton.swift
//  damoim
//
//  Created by 원동진 on 2023/03/03.
//

import Foundation
import UIKit
func scheduleButton(_ day : String, _ date : Int) -> UIButton {
    let scheduleButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString(day, attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Medium.rawValue, size: 13)!]))
        config.attributedSubtitle = AttributedString("\(date)", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 17)!]))
        config.baseForegroundColor = UIColor(named: "grey03")
        let scheduleButton = UIButton(configuration: config)
        scheduleButton.layer.cornerRadius = 8
        scheduleButton.backgroundColor = UIColor(named: "grey06")
        scheduleButton.layer.borderWidth = 1
        scheduleButton.layer.borderColor = UIColor(named: "grey05")?.cgColor
        return scheduleButton
    }()

    return scheduleButton
}
