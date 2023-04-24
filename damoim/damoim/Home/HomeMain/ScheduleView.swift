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
    private lazy var damoimLogo : UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "damoimLogo")
        return logoImageView
    }()
    private lazy var scheduleLabel : UILabel = {
        let textLabel = UILabel()
        textLabel.text = "다가오는 일정"
        textLabel.font = UIFont(name: CustomFont.SemiBold.rawValue, size: 13)
        return textLabel
    }()
  
//    private lazy var scheduleSegmented : CustomSegmentedControl = {
//        let scheduleSegmented = CustomSegmentedControl()
//        scheduleSegmented.setButtonTitles(buttonTitles: [ScheduleData(day: "월", date: "10"),ScheduleData(day: "화", date: "11"),ScheduleData(day: "수", date: "12"),ScheduleData(day: "목", date: "13"),ScheduleData(day: "금", date: "14")])
//        scheduleSegmented.selectorTextColor = UIColor(named: "grey06")!
//        scheduleSegmented.selectorViewColor = UIColor(named: "purple01")!
//        return scheduleSegmented
//    }()
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
//        addSubview(scheduleSegmented)
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

