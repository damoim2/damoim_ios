//
//  ScheduleListView.swift
//  damoim
//
//  Created by 원동진 on 2023/04/27.
//

import Foundation
import UIKit

class ScheduleList: UIView {
    static let identi = "ScheduleTVCellid"
    private lazy var containerView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor(named: "purple04")?.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    private lazy var leftStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    var groupImgView : UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()
    var groupNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "grey01")
        label.font = UIFont(name: CustomFont.SemiBold.rawValue, size: 15)
        return label
    }()
    private lazy var rightStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 4
        return stackView
    }()
    var dateLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "grey02")
        label.font = UIFont(name: CustomFont.Regular.rawValue, size: 13)
        return label
    }()
    var timeLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "grey02")
        label.font = UIFont(name: CustomFont.Regular.rawValue, size: 13)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        setAutoLayou()
        
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setAutoLayou()
    }
}
extension ScheduleList {
    private func addSubView(){
        addSubview(containerView)
        containerView.addSubview(leftStackView)
        leftStackView.addArrangedSubview(groupImgView)
        leftStackView.addArrangedSubview(groupNameLabel)
        containerView.addSubview(rightStackView)
        rightStackView.addArrangedSubview(dateLabel)
        rightStackView.addArrangedSubview(timeLabel)
    }
    private func setAutoLayou(){
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
        leftStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
        rightStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-14)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
//    func setList(model: ExampleScData ){
//        groupImgView.image = model.groupImg
//        groupNameLabel.text = model.groupName
//        dateLabel.text = model.date
//        timeLabel.text = model.time
//    }
}
