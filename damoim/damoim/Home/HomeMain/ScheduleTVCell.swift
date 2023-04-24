//
//  ScheduleTVCell.swift
//  damoim
//
//  Created by 원동진 on 2023/04/24.
//

import UIKit

class ScheduleTVCell: UITableViewCell {
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
    private lazy var groupImgView : UIImageView = {
       let imgView = UIImageView()
        return imgView
    }()
    private lazy var groupNameLabel : UILabel = {
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
    private lazy var dateLabel : UILabel = {
       let label = UILabel()
        label.textColor = UIColor(named: "grey02")
        label.font = UIFont(name: CustomFont.Regular.rawValue, size: 13)
        return label
    }()
    private lazy var timeLabel : UILabel = {
       let label = UILabel()
        label.textColor = UIColor(named: "grey02")
        label.font = UIFont(name: CustomFont.Regular.rawValue, size: 13)
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
        setAutoLayou()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension ScheduleTVCell {
    private func addSubView(){
        contentView.addSubview(containerView)
        containerView.addSubview(leftStackView)
        leftStackView.addArrangedSubview(groupImgView)
        leftStackView.addArrangedSubview(groupNameLabel)
        containerView.addSubview(rightStackView)
        rightStackView.addArrangedSubview(dateLabel)
        rightStackView.addArrangedSubview(timeLabel)
    }
    private func setAutoLayou(){
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
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
    func setCell(model: ExampleScData ){
        groupImgView.image = model.groupImg
        groupNameLabel.text = model.groupName
        dateLabel.text = model.date
        timeLabel.text = model.time
    }
}
