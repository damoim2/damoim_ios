//
//  ViewController.swift
//  damoim
//
//  Created by 원동진 on 2023/02/10.
//

import UIKit
import SnapKit
class HomeVC: UIViewController {
    var testView : UIView = {
        let test  = UIView()
        return test
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAddView()
        setAutoLayout()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    private func setAddView(){
        view.addSubview(testView)
    }
    private func setAutoLayout(){
        testView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(view.safeAreaLayoutGuide)
            
            
        }
    }

}

