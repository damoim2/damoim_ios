//
//  WriteTextVC.swift
//  damoim
//
//  Created by 원동진 on 2023/05/23.
//
//startDev
//정리한번 ㅎ하자..
import UIKit
import PhotosUI
class WriteTextVC: UIViewController {
    let placeHolder = "내용을 입력하세요."
    private var selections = [String : PHPickerResult]()
    private var selectedAssetIdentifiers = [String]()
    private var selectedImages : [UIImage] = []
    
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
        inputTextView.inputAccessoryView = bottomOptionAccessoryView
        return inputTextView
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
    private lazy var bottomOptionAccessoryView : UIView = {
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
        btn.addTarget(self, action: #selector(tapAddImg), for: .touchUpInside)
        return btn
    }()
    
    private lazy var keyboardDownBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "keyBoardDownBtn"), for: .normal)
        btn.addTarget(self, action: #selector(tapKeyboadDown), for: .touchUpInside)
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "grey06")
        setImgCV()
        configure()
        setAutoLayout()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addKeyBoardListener()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bottomOptionAccessoryView.layer.addBorder([.top], color: UIColor(named: "grey04") ?? UIColor.gray, width: 1)
    }
}
extension WriteTextVC : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cvcell = collectionView.dequeueReusableCell(withReuseIdentifier: WriteTextImgCVC.identi, for: indexPath) as? WriteTextImgCVC else { return UICollectionViewCell()}
        cvcell.setImg(model: selectedImages[indexPath.row] )
        cvcell.setIndex(model: indexPath.row)
        cvcell.cacnelButtonAction = {
            let index = cvcell.imgCancelBtn.index
            self.selectedImages.remove(at: index)
            let identifiers = self.selectedAssetIdentifiers.remove(at: index)
            self.selections.removeValue(forKey: identifiers)
            if self.selectedImages.count == 0{
                self.imgCollectionView.snp.updateConstraints { make in
                    make.height.equalTo(0)
                }
            }
            DispatchQueue.main.async {
                self.imgCollectionView.reloadData()
            }
        }
        return cvcell
    }
}
extension WriteTextVC {
    private func configure(){
        self.view.addSubViews([navigationView,imgCollectionView,inputTextView,bottomOptionAccessoryView])
        navigationView.addSubViews([cancelBtn,titleLabel,completedBtn])
        bottomOptionAccessoryView.addSubViews([addImgBtn,keyboardDownBtn])
        keyboardDownBtn.isHidden = true
        
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
            make.height.equalTo(0)
        }
        inputTextView.snp.makeConstraints { make in
            make.top.equalTo(imgCollectionView.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
        }
        bottomOptionAccessoryView.snp.makeConstraints { make in
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
    private func setImgCV(){
        imgCollectionView.delegate = self
        imgCollectionView.dataSource = self
    }
//MARK: - 동작관련
    @objc func keyboardWillShow(_ notification: Notification) {
        keyboardDownBtn.isHidden = false
        print("keyBoard Show")
        
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        keyboardDownBtn.isHidden = true
        print("keyBoard Hide")
    }
    
    func addKeyBoardListener(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
 
    @objc func tapKeyboadDown(){
        inputTextView.resignFirstResponder()
    }
    @objc func tapAddImg(){
        var configuration = PHPickerConfiguration(photoLibrary: .shared())
        configuration.selectionLimit = 10
        configuration.filter = .images
        configuration.selection = .ordered
        configuration.preselectedAssetIdentifiers = selectedAssetIdentifiers
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    private func displayImage() {
        let dispatchGroup = DispatchGroup()
        // identifier와 이미지로 dictionary를 만듬 (selectedAssetIdentifiers의 순서에 따라 이미지를 받을 예정입니다.)
        var imagesDict = [String: UIImage]()
        for (identifier, result) in selections {
            dispatchGroup.enter()
            let itemProvider = result.itemProvider
            // 만약 itemProvider에서 UIImage로 로드가 가능하다면?
            if itemProvider.canLoadObject(ofClass: UIImage.self) {
                // 로드 핸들러를 통해 UIImage를 처리해 줍시다. (비동기적으로 동작)
                itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                    guard let image = image as? UIImage else { return }
                    imagesDict[identifier] = image
                    dispatchGroup.leave()
                }
            }
        }
        dispatchGroup.notify(queue: DispatchQueue.main) { [weak self] in
            guard let self = self else { return }
            for identifier in self.selectedAssetIdentifiers {
                guard let image = imagesDict[identifier] else { return }
                selectedImages.append(image)
            }
            imgCollectionView.reloadData()
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
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
}
extension WriteTextVC : PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        selectedImages.removeAll()
        var newSelections = [String: PHPickerResult]()
        for result in results {
            let identifier = result.assetIdentifier!
            newSelections[identifier] = selections[identifier] ?? result
        }
        selections = newSelections
        selectedAssetIdentifiers = results.compactMap{$0.assetIdentifier}
        if selections.isEmpty {
            selectedImages.removeAll()
        }else {
            imgCollectionView.snp.updateConstraints { make in
                make.height.equalTo(100)
            }
            displayImage()
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
