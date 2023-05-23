//
//  CommentTVH.swift
//  damoim
//
//  Created by 원동진 on 2023/04/03.
//

import UIKit
protocol tapTestSettingAction : AnyObject{
    func tapTextSettingAction()
}
class CommentTVH: UITableViewHeaderFooterView {
    static let identi = "CommentTVH"
    weak var taptTestSetDelegate : tapTestSettingAction?
    private lazy var textDetailView : UIView = {
        let textDetailView = UIView()
        textDetailView.backgroundColor = UIColor(named: "grey06")
        return textDetailView
    }()
    //MARK: - 사용자 이미지,이름,
    private lazy var writeInfoView : UIView = {
        let infoView = UIView()
        return infoView
    }()
    private lazy var userStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 6
        return stackView
    }()
    private lazy var userImageView : UIImageView = {
        let userImage = UIImageView()
        userImage.image = UIImage(named: "testImg")
        userImage.layer.cornerRadius = 10
        userImage.clipsToBounds = true
        return userImage
    }()
    private lazy var userNameLabel : UILabel = {
        let userName = UILabel()
        userName.text = "작성자"
        userName.font = UIFont(name: CustomFont.SemiBold.rawValue, size: 13)
        userName.textColor = UIColor(named: "grey02")
        
        return userName
    }()
    private lazy var writeDateLabel : UILabel = {
        let dateLabel = UILabel()
        dateLabel.text = "12월 12일"
        dateLabel.font = UIFont(name: CustomFont.Regular.rawValue, size: 10)
        dateLabel.textColor = UIColor(named: "grey03")
        return dateLabel
    }()
    //MARK: - 글
    private lazy var textStackView : UIStackView = {
        let textStackView = UIStackView()
        textStackView.axis = .horizontal
        textStackView.distribution = .fillProportionally
        textStackView.alignment = .fill
        return textStackView
    }()
    private lazy var userTextLabel : UILabel = {
        let textLabel = UILabel()
        textLabel.text = """
        모든 국민은 근로의 권리를 가진다. 국가는 사회적·경제적 방법으로 근로자의 고용의 증진과 적정임금의 보장에 노력하여야 하며, 법률이 정하는 바에 의하여 최저임금제를 시행하여야 한다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 국가는 과학기술의 혁신과 정보 및 인력의 개발을 통하여 국민경제의 발전에 노력하여야 한다.
        
        헌법재판소는 법률에 저촉되지 아니하는 범위안에서 심판에 관한 절차, 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회의원과 정부는 법률안을 제출할 수 있다. 누구든지 체포 또는 구속의 이유와 변호인의 조력을 받을 권리가 있음을 고지받지 아니하고는 체포 또는 구속을 당하지 아니한다. 체포 또는 구속을 당한 자의 가족등 법률이 정하는 자에게는 그 이유와 일시·장소가 지체없이 통지되어야 한다.
        
        국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 국가의 세입·세출의 결산, 국가 및 법률이 정한 단체의 회계검사와 행정기관 및 공무원의 직무에 관한 감찰을 하기 위하여 대통령 소속하에 감사원을 둔다.
        """
        textLabel.numberOfLines = 0
        textLabel.font = UIFont(name: CustomFont.Regular.rawValue, size: 13)
        textLabel.textColor = UIColor(named: "grey01")
        return textLabel
    }()
    //MARK: - 이미지
    var upperImgView: UIView = {
        let upperImgView = UIView()
        return upperImgView
    }()
    private lazy var imgStackViewMain : UIStackView = {
        let textImageStackView = UIStackView()
        textImageStackView.axis = .horizontal
        textImageStackView.distribution = .fillEqually
        textImageStackView.alignment = .fill
        textImageStackView.spacing = 2
        return textImageStackView
        
    }()
    private lazy var imgStackViewSub : UIStackView = {
        let textImageStackView = UIStackView()
        textImageStackView.axis = .vertical
        textImageStackView.distribution = .fillEqually
        textImageStackView.alignment = .fill
        textImageStackView.spacing = 2
        return textImageStackView
        
    }()
    private lazy var firstTextImgView : UIImageView = {
        let textImgView = UIImageView()
        textImgView.image = UIImage(named: "testImg4")
        textImgView.contentMode = .scaleToFill
        return textImgView
    }()
    private lazy var secondTextImgView : UIImageView = {
        let textImgView = UIImageView()
        textImgView.image = UIImage(named: "testImg2")
        textImgView.contentMode = .scaleToFill
        return textImgView
    }()
    private lazy var ThirdTextImgView : UIImageView = {
        let textImgView = UIImageView()
        textImgView.image = UIImage(named: "testImg3")
        textImgView.contentMode = .scaleToFill
        return textImgView
    }()
    private lazy var cntImgLabel : UILabel = {
        let cntImgLabel = UILabel()
        cntImgLabel.text = "+2"
        cntImgLabel.textColor = UIColor(named: "grey06")
        cntImgLabel.font = UIFont(name: CustomFont.SemiBold.rawValue, size: 15)
        return cntImgLabel
    }()
    //MARK: - 좋아요
    private lazy var likeStackView : UIStackView = {
        let likeStackView = UIStackView()
        likeStackView.axis = .horizontal
        likeStackView.alignment = .fill
        likeStackView.distribution = .fillProportionally
        likeStackView.spacing = 2
        return likeStackView
    }()
    private lazy var likeImgView : UIImageView = {
        let likeImgView = UIImageView()
        likeImgView.image = UIImage(named: "likeImg")
        return likeImgView
    }()
    private lazy var likeCntLabel : UILabel = {
        let likeCntLabel = UILabel()
        likeCntLabel.textColor = UIColor(named: "grey04")
        likeCntLabel.text = "좋아요 10개"
        likeCntLabel.font = UIFont(name: CustomFont.Regular.rawValue, size: 13)
        return likeCntLabel
    }()
    //MARK: - 글 수정 삭제 Btn
    private lazy var textSettingBtn : UIButton = {
        let settingBtn = UIButton()
        settingBtn.setImage(UIImage(named: "setCircleImg"), for: .normal)
        settingBtn.addTarget(self, action: #selector(tapTextSettingAction), for: .touchUpInside)
        return settingBtn
    }()
    private lazy var borderLine : UIView = {
        let borderLine = UIView()
        borderLine.backgroundColor = UIColor(named: "grey05")
        return borderLine
    }()
    //MARK: - 댓글
    private lazy var commentStackView : UIStackView = {
        let commentStackView = UIStackView()
        commentStackView.axis = .horizontal
        commentStackView.alignment = .fill
        commentStackView.distribution = .fillProportionally
        commentStackView.spacing = 2
        return commentStackView
    }()
    private lazy var commentImg : UIImageView = {
        let commentImg = UIImageView()
        commentImg.image = UIImage(named: "commentImg")
        return commentImg
    }()
    private lazy var commentCntLabel : UILabel = {
        let commentCntLabel = UILabel()
        commentCntLabel.font = UIFont(name: CustomFont.Regular.rawValue, size: 13)
        commentCntLabel.textColor = UIColor(named: "grey04")
        commentCntLabel.text = "댓글 3개"
        return commentCntLabel
    }()
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubView()
        setAutoLayout()
        
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
extension CommentTVH {
    private func addSubView(){
        addSubview(textDetailView)
        textDetailView.addSubview(writeInfoView)
        writeInfoView.addSubview(userStackView)
        writeInfoView.addSubview(writeDateLabel)
        userStackView.addArrangedSubview(userImageView)
        userStackView.addArrangedSubview(userNameLabel)
        //MARK: - 글
        textDetailView.addSubview(textStackView)
        textStackView.addArrangedSubview(userTextLabel)
        //MARK: - 이미지
        textDetailView.addSubview(upperImgView)
        upperImgView.addSubview(imgStackViewMain)
        imgStackViewMain.addArrangedSubview(firstTextImgView)
        imgStackViewMain.addArrangedSubview(imgStackViewSub)
        imgStackViewSub.addArrangedSubview(secondTextImgView)
        imgStackViewSub.addArrangedSubview(ThirdTextImgView)
        ThirdTextImgView.addSubview(cntImgLabel)
        //MARK: - 좋아요
        textDetailView.addSubview(likeStackView)
        likeStackView.addArrangedSubview(likeImgView)
        likeStackView.addArrangedSubview(likeCntLabel)
        //MARK: - 글 삭제 수정버튼
        textDetailView.addSubview(textSettingBtn)
        //MARK: - 경계선
        textDetailView.addSubview(borderLine)
        //MARK: - 댓글
        textDetailView.addSubview(commentStackView)
        commentStackView.addArrangedSubview(commentImg)
        commentStackView.addArrangedSubview(commentCntLabel)
        
    }
    private func setAutoLayout(){
        textDetailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        writeInfoView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        userStackView.snp.makeConstraints { make in
            make.top.equalTo(writeInfoView.snp.top).offset(10)
            make.left.equalTo(writeInfoView.snp.left).offset(16)
            make.bottom.equalTo(writeInfoView.snp.bottom)
        }
        writeDateLabel.snp.makeConstraints { make in
            make.top.equalTo(writeInfoView.snp.top).offset(13)
            make.right.equalTo(writeInfoView.snp.right).offset(-16)
            make.bottom.equalTo(writeInfoView.snp.bottom)
        }
        //MARK: - 글 내용
        textStackView.snp.makeConstraints { make in
            make.top.equalTo(writeInfoView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            
        }
        userTextLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        //MARK: - 이미지
        upperImgView.snp.makeConstraints { make in
            make.top.equalTo(textStackView.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        imgStackViewMain.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        cntImgLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        //MARK: - 좋아요 StackView
        likeStackView.snp.makeConstraints { make in
            make.top.equalTo(upperImgView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
        }
        //MARK: - 글 수정 삭제
        textSettingBtn.snp.makeConstraints { make in
            make.top.equalTo(upperImgView.snp.bottom).offset(16)
            make.right.equalToSuperview().offset(-10)
        }
        
        borderLine.snp.makeConstraints { make in
            make.top.equalTo(likeStackView.snp.bottom).offset(12)
            make.left.right.equalToSuperview()
            make.height.equalTo(4)
        }
        //MARK: - 댓글
        commentStackView.snp.makeConstraints { make in
            make.top.equalTo(borderLine.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview()
        }
    }
    @objc func tapTextSettingAction(){
        self.taptTestSetDelegate?.tapTextSettingAction()
    }
    
    
}
