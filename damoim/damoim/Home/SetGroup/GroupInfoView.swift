//
//  GroupInfoView.swift
//  damoim
//
//  Created by 원동진 on 2023/03/05.
//

import UIKit
import SnapKit
protocol dismissActionDelegate {
    func dissmissAction()
}
class GroupInfoView: UIView {
    var delegate : dismissActionDelegate?
    private lazy var groupNameLabel : UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "계모임 이름"
        nameLabel.font = UIFont(name: CustomFont.Bold.rawValue, size: 17)
        nameLabel.textColor = UIColor(named: "grey01")
        return nameLabel
    }()
    private lazy var dissmisButton : UIButton = {
        let dissmisButton = UIButton()
        dissmisButton.setImage(UIImage(named: "closeImg"), for: .normal)
        dissmisButton.addTarget(self, action: #selector(tapDismiss), for: .touchUpInside)
        return dissmisButton
    }()
    
    private lazy var groupHeadLabel : UILabel = {
        let headLabel = UILabel()
        headLabel.font = UIFont(name: CustomFont.Regular.rawValue, size: 13)
        headLabel.textColor = UIColor(named: "grey02")
        headLabel.text = "모임장 이아리"
        return headLabel
    }()
    private lazy var  memberInfoStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    private lazy var memberCntLabel = customLabel("멤버 8")
    
    private lazy var duringGroupCntLabel = customLabel("D+123")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addsubView()
        setAutoLayout()
        setGroupHeadLabel()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
   
}
extension GroupInfoView {
    @objc func tapDismiss(){
        self.delegate?.dissmissAction()
    }
}
extension GroupInfoView {
    private func addsubView(){
        addSubview(groupNameLabel)
        addSubview(dissmisButton)
        addSubview(groupHeadLabel)
        addSubview(memberInfoStackView)
        memberInfoStackView.addArrangedSubview(memberCntLabel)
        memberInfoStackView.addArrangedSubview(duringGroupCntLabel)
        
    }
    private func setAutoLayout(){
        groupNameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview()
        }
        dissmisButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview().offset(-16)
        }
        groupHeadLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview()
            make.top.equalTo(groupNameLabel.snp.bottom).offset(9)
        }
        memberInfoStackView.snp.makeConstraints { make in
            make.top.equalTo(dissmisButton.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
        }
    }
    private func setGroupHeadLabel(){
        let fullText = groupHeadLabel.text ?? ""
        let attFont = UIFont(name: CustomFont.SemiBold.rawValue, size: 13)
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: "이아리")
        attributedString.addAttribute(.font, value: attFont!, range: range)
        groupHeadLabel.attributedText = attributedString
    }
    func customLabel(_ text : String)-> BasePaddingLabel{
        let customLabel : BasePaddingLabel = {
            let customLabel = BasePaddingLabel(padding: UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6))
            customLabel.text = text
            customLabel.font = UIFont(name: CustomFont.SemiBold.rawValue, size: 13)
            customLabel.textColor = UIColor(named: "purple01")
            customLabel.backgroundColor = UIColor(named: "purple04")
            customLabel.layer.cornerRadius = 8
            customLabel.clipsToBounds = true
            customLabel.textAlignment = .center
            return customLabel
        }()
        return customLabel
    }
}
#if DEBUG
import SwiftUI

struct GroupInfoViewPreview: PreviewProvider {
    static var previews: some View {
        return GroupInfoView().showPreview()
    }
}
#endif
