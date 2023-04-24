//
//  ScheduleView.swift
//  damoim
//
//  Created by 원동진 on 2023/03/02.
//

import UIKit
import SnapKit

class ScheduleView: UIView {
    private lazy var containerView : UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        return containerView
    }()
    var damoimLogo : UIButton = {
        let damoimLogo = UIButton()
        damoimLogo.setImage(UIImage(named: "damoimLogo"), for: .normal)
        return damoimLogo
    }()
    private lazy var scheduleLabel : UILabel = {
        let textLabel = UILabel()
        textLabel.text = "다가오는 일정"
        textLabel.font = UIFont(name: CustomFont.SemiBold.rawValue, size: 13)
        return textLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setScheduleView()
   
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setScheduleView()
    }

    
    private func setScheduleView(){
        addSubview(containerView)
        addSubview(damoimLogo)
        addSubview(scheduleLabel)
        containerView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        damoimLogo.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(16)
        }
        scheduleLabel.snp.makeConstraints { make in
            make.top.equalTo(damoimLogo.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
  
}

