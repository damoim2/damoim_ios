//
//  ImgDetailModalVC.swift
//  damoim
//
//  Created by 원동진 on 2023/03/31.
//

import UIKit
import SnapKit
class ImgDetailModalVC: UIViewController {
    let images = ["testImg4","testImg2","testImg3"]
    
    private lazy var closeButton : UIButton = {
        let closeButton = UIButton()
        closeButton.setImage(UIImage(named: "closeImgW"), for: .normal)
        closeButton.addTarget(self, action: #selector(tapDismiss), for: .touchUpInside)
        return closeButton
    }()
    private lazy var imgScrollView : UIScrollView = {
        let imgScrollView = UIScrollView()
        imgScrollView.frame = UIScreen.main.bounds
        imgScrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * CGFloat(images.count), height: UIScreen.main.bounds.height * 1/2)
        imgScrollView.delegate = self // scroll범위에 따라 pageControl의 값을 바꾸어주기 위한 delegate
        imgScrollView.alwaysBounceVertical = false
        imgScrollView.showsHorizontalScrollIndicator = false
        imgScrollView.showsVerticalScrollIndicator = false
        imgScrollView.isScrollEnabled = true
        imgScrollView.isPagingEnabled = true
        imgScrollView.bounces = false // 경계지점에서 bounce될건지 체크 (첫 or 마지막 페이지에서 바운스 스크롤 효과 여부)
        return imgScrollView
    }()
    private lazy var pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = images.count
        pageControl.pageIndicatorTintColor = UIColor(named: "grey02")
        pageControl.currentPageIndicatorTintColor = UIColor(named: "grey06")
        return pageControl
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "grey01")
        addSubView()
        setAutoLayout()
        addImgArr()
    }
    
    
}
extension ImgDetailModalVC {
    private func addSubView(){
        self.view.addSubview(imgScrollView)
        self.view.addSubview(closeButton)
        self.view.addSubview(pageControl)
    }
    private func setAutoLayout(){
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
    
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-44)
        }

    }
    private func addImgArr(){
        for (index, image) in images.enumerated() {
            let image = UIImage(named: image)
            let imageView = UIImageView(image: image)
            imageView.frame = UIScreen.main.bounds
            imageView.frame.origin.x = UIScreen.main.bounds.width * CGFloat(index)
            imageView.contentMode = .scaleAspectFit
            imgScrollView.addSubview(imageView)
        }
    }
   
}
extension ImgDetailModalVC : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
    }
}
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ImgDetailModalVCPreview: PreviewProvider {
    static var previews: some View {
        ImgDetailModalVC().showPreview(.iPhone14Pro)
    }
}
#endif
