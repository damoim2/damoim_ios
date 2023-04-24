//
//  ScheduleTVH.swift
//  damoim
//
//  Created by 원동진 on 2023/04/24.
//

import UIKit

class ScheduleTVH: UITableViewHeaderFooterView {
    static let identi = "ScheduleTVHid"
    let dateSample = [ExampleDate(date: "월", day: "11"),ExampleDate(date: "화", day: "12"),ExampleDate(date: "수", day: "13"),ExampleDate(date: "목", day: "14"),ExampleDate(date: "금", day: "15")]
    private var buttons : [UIButton]!
    var selectedIndex : Int = 0
    private lazy var scheduleView  : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "grey06")
        return view
    }()
    private lazy var damoimLogo : UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "damoimLogo")
        return logoImageView
    }()
    private lazy var scheduleLabel : UILabel = {
        let textLabel = UILabel()
        textLabel.text = "다가오는 일정"
        textLabel.textAlignment = .left
        textLabel.font = UIFont(name: CustomFont.SemiBold.rawValue, size: 13)
        return textLabel
    }()
    
    private lazy var schduleStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.backgroundColor = UIColor(named: "grey06")
        return stackView
    }()
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        createSCButton()
        addSubView()
        autoLayout()
        
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
extension ScheduleTVH {
    private func addSubView(){
        addSubview(scheduleView)
        scheduleView.addSubview(damoimLogo)
        scheduleView.addSubview(scheduleLabel)
        scheduleView.addSubview(schduleStackView)
        for btn in buttons {
            schduleStackView.addArrangedSubview(btn)
        }
    }
    private func autoLayout(){
        
        scheduleView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        damoimLogo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(16)
        }
        scheduleLabel.snp.makeConstraints { make in
            make.top.equalTo(damoimLogo.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        schduleStackView.snp.makeConstraints { make in
            make.top.equalTo(scheduleLabel.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(18)
            make.right.equalToSuperview().offset(-18)
            make.bottom.equalToSuperview()
        }
        
    }
    private func createSCButton(){
        buttons = [UIButton]()
        buttons.removeAll()
        for button in dateSample {
            var config = UIButton.Configuration.plain()
            config.attributedTitle = AttributedString(button.day, attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Medium.rawValue, size: 13)!]))
            config.attributedSubtitle = AttributedString(button.date, attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 17)!]))
            config.baseForegroundColor = UIColor(named: "grey03")
            let scheduleButton = UIButton(configuration: config)
            scheduleButton.addTarget(self, action: #selector(scBtnAction(sender:)), for: .touchUpInside)
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
    
    @objc func scBtnAction(sender: UIButton){
        for (buttonIndex, btn) in buttons.enumerated() {
            if btn == sender {
                selectedIndex = buttonIndex
                //                delegate?.change(to: selectedIndex)
                var config = btn.configuration
                config?.baseForegroundColor = UIColor(named: "grey06")
                btn.configuration = config
                btn.backgroundColor = UIColor(named: "purple01")
                
            }else {
                var config = btn.configuration
                config?.baseForegroundColor = UIColor(named: "grey03")
                btn.configuration = config
                btn.backgroundColor = UIColor(named: "grey06")
            }
        }
        
    }
    
}

