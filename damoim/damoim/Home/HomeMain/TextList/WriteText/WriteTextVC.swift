//
//  WriteTextVC.swift
//  damoim
//
//  Created by 원동진 on 2023/05/23.
//
//startDev
import UIKit

class WriteTextVC: UIViewController {
    let placeHolder = "내용을 입력하세요."
    let sample = (1...9).map{_ in return UIImage(named: "testImg5")}
    private let navigationView : UIView = {
        let navigationView = UIView()
        navigationView.backgroundColor = UIColor(named: "grey06")
        navigationView.layer.masksToBounds = false
        navigationView.layer.shadowColor = UIColor.gray.cgColor
        navigationView.layer.shadowOffset = CGSize(width: 0, height: 10)
        navigationView.layer.shadowOpacity = 0.1
        return navigationView
    }()
    private lazy var cancelBtn : UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(named: "closeImg")
        let cancelBtn = UIButton(configuration: config)
        cancelBtn.addTarget(self, action: #selector(tapDismiss), for: .touchUpInside)
        return cancelBtn
    }()
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "게시글 작성"
        label.font = UIFont(name: CustomFont.Bold.rawValue, size: 17)
        label.textColor = UIColor(named: "grey01")
        label.textAlignment = .center
        return label
    }()
    private lazy var completedBtn : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("완료", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Regular.rawValue, size: 13) ?? UIFont()]))
        config.baseForegroundColor = UIColor(named: "grey03")
        let btn = UIButton(configuration: config)
        return btn
    }()
    private lazy var inputTextView : UITextView = {
        let inputTextView = UITextView()
        inputTextView.font = UIFont(name: CustomFont.Regular.rawValue, size: 13)
        inputTextView.text = placeHolder
        inputTextView.textColor = UIColor(named: "grey03")
        inputTextView.textContainerInset = .init(top: 0, left: 16, bottom: 16, right: 16)
        inputTextView.backgroundColor = UIColor(named: "grey06")
        inputTextView.delegate = self
        return inputTextView
    }()
    private lazy var bottomOptionView : UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(named: "grey06")
        return view
    }()
    private lazy var addImgBtn : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("사진", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Medium.rawValue, size: 13)!]))
        config.image = UIImage(named: "addImgBtn")
        config.baseForegroundColor = UIColor(named: "grey02")
        config.imagePlacement = .leading
        config.imagePadding = 4
        let btn = UIButton(configuration: config)
        return btn
    }()
    private lazy var keyboardDownBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "keyBoardDownBtn"), for: .normal)
        return btn
    }()
    private lazy var imgCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 100)
        let imgCV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        imgCV.backgroundColor = UIColor(named: "grey06")
        imgCV.register(WriteTextImgCVC.self, forCellWithReuseIdentifier: WriteTextImgCVC.identi)
        return imgCV
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "grey06")
        setImgCV()
        configure()
        setAutoLayout()
    }
    override func viewDidAppear(_ animated: Bool) {
        self.bottomOptionView.layer.addBorder([.top], color: UIColor(named: "grey04") ?? UIColor.gray, width: 1.0)
    }
}
extension WriteTextVC : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cvcell = collectionView.dequeueReusableCell(withReuseIdentifier: WriteTextImgCVC.identi, for: indexPath) as? WriteTextImgCVC else { return UICollectionViewCell()}
        print(indexPath.row)
        cvcell.setImg(model: sample[indexPath.row] ?? UIImage())
            
        return cvcell
    }
}
extension WriteTextVC {
    private func setImgCV(){
        imgCollectionView.delegate = self
        imgCollectionView.dataSource = self
    }
    @objc override func tapDismiss() {
        self.dismiss(animated: false)
    }
    private func configure(){
        self.view.addSubViews([navigationView,imgCollectionView,inputTextView,bottomOptionView])
        navigationView.addSubViews([cancelBtn,titleLabel,completedBtn])
        bottomOptionView.addSubViews([addImgBtn,keyboardDownBtn])
    }
    private func setAutoLayout(){
        navigationView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
        }
        cancelBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(9)
            make.bottom.equalToSuperview().offset(-9)
            make.centerX.equalToSuperview()
        }
        completedBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-12)
        }
        imgCollectionView.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp.bottom).offset(6)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview()
            make.height.equalTo(100)
        }
        inputTextView.snp.makeConstraints { make in
            make.top.equalTo(imgCollectionView.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
        }
        bottomOptionView.snp.makeConstraints { make in
            make.top.equalTo(inputTextView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        addImgBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-8)
        }
        keyboardDownBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-8)
        }
        
    }
}
extension WriteTextVC : UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeHolder {
            textView.text = nil
            textView.textColor = UIColor(named: "grey01")
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = placeHolder
            textView.textColor = UIColor(named: "grey03")
        }
    }
}
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct WriteTextVCPreview: PreviewProvider {
    static var previews: some View {
        WriteTextVC().showPreview(.iPhone14Pro)
    }
}
#endif
