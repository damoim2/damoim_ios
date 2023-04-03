//
//  ScheduleSegmentControl.swift
//  damoim
//
//  Created by 원동진 on 2023/03/03.
//

import Foundation
import UIKit
struct ScheduleData {
    let day : String // 요일
    let date : String //날짜
    
}
protocol CustomSegmentedControlDelegate : AnyObject {
    func change(to index:Int)
}

class CustomSegmentedControl: UIView {
    private var buttonTitles:[ScheduleData]!
    private var buttons: [UIButton]!
    private var selectorView: UIView!
    
    var textColor:UIColor = .black
    var selectorViewColor: UIColor = .gray
    var selectorTextColor: UIColor = .gray
    
    weak var delegate:CustomSegmentedControlDelegate?
    
    public private(set) var selectedIndex : Int = 0
    
    convenience init(frame:CGRect,buttonTitle:[ScheduleData]) {
        self.init(frame: frame)
        self.buttonTitles = buttonTitle
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.backgroundColor = UIColor.white
        updateView()
    }
    
    func setButtonTitles(buttonTitles:[ScheduleData]) {
        self.buttonTitles = buttonTitles
        self.updateView()
    }
    
    func setIndex(index:Int) {
        buttons.forEach({ $0.setTitleColor(textColor, for: .normal) })
        selectedIndex = index

        
    }
    
    @objc func buttonAction(sender:UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() {
            if btn == sender {
                selectedIndex = buttonIndex
                delegate?.change(to: selectedIndex)
                var config = btn.configuration
                config?.baseForegroundColor = UIColor(named: "grey06")
                btn.configuration = config
                btn.backgroundColor = selectorViewColor
                
            }else {
                var config = btn.configuration
                config?.baseForegroundColor = UIColor(named: "grey03")
                btn.configuration = config
                btn.backgroundColor = UIColor(named: "grey06")
            }
        }
    }
}

//Configuration View
extension CustomSegmentedControl {
    private func updateView() {
        createButton()
//        configSelectorView()
        configStackView()
    }
    
    private func configStackView() {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 6
        addSubview(stack)
        stack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }

    }
    
    private func configSelectorView() {
        let selectorWidth = frame.width / CGFloat(self.buttonTitles.count)
        selectorView = UIView(frame: CGRect(x: 0, y: self.frame.height, width: selectorWidth, height: 2))
        selectorView.backgroundColor = selectorViewColor
        addSubview(selectorView)
    }
    
    private func createButton() {
        buttons = [UIButton]()
        buttons.removeAll()
        subviews.forEach({$0.removeFromSuperview()})
        for buttonTitle in buttonTitles {
            var config = UIButton.Configuration.plain()
            config.attributedTitle = AttributedString(buttonTitle.day, attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Medium.rawValue, size: 13)!]))
            config.attributedSubtitle = AttributedString(buttonTitle.date, attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 17)!]))
            config.baseForegroundColor = UIColor(named: "grey03")
            let scheduleButton = UIButton(configuration: config)
            scheduleButton.addTarget(self, action: #selector(CustomSegmentedControl.buttonAction(sender:)), for: .touchUpInside)
            scheduleButton.layer.cornerRadius = 8
            scheduleButton.backgroundColor = UIColor(named: "grey06")
            scheduleButton.layer.borderWidth = 1
            scheduleButton.layer.borderColor = UIColor(named: "grey05")?.cgColor
            buttons.append(scheduleButton)
        }
        var config = buttons[0].configuration
        config?.baseForegroundColor = UIColor(named: "grey06")
        buttons[0].configuration = config
        buttons[0].backgroundColor = UIColor(named: "purple01")
    }
    
    
}
