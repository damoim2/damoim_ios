//
//  MainTabBarVC.swift
//  damoim
//
//  Created by 원동진 on 2023/02/15.
//

import UIKit
class MainTabBarVC : UITabBarController {
    let firstNC = UINavigationController.init(rootViewController: HomeVC())
    let secondNC = UINavigationController.init(rootViewController: CalendarVC())
    let thirdNC = UINavigationController.init(rootViewController: ChatVC())
    let fourthNC = UINavigationController.init(rootViewController: MyProfileVC())
    let firstTabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "home"), tag: 0)
    let secondTabBarItem = UITabBarItem(title: "달력", image: UIImage(named: "calendar"), tag: 1)
    let thirdTabBarItem = UITabBarItem(title: "채팅", image: UIImage(named: "chat"), tag: 2)
    let fourthTabBarItem = UITabBarItem(title: "내 프로필", image: UIImage(named: "Myprofile"), tag: 3)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setNCinit()
        self.tabBar.tintColor = UIColor(named: "purple01")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
}
extension MainTabBarVC {
    func setNCinit(){
        self.viewControllers = [firstNC,secondNC,thirdNC,fourthNC]
        firstTabBarItem.selectedImage = UIImage(named: "fillhome")
        firstNC.tabBarItem = firstTabBarItem
        secondTabBarItem.selectedImage = UIImage(named: "fillcalendar")
        secondNC.tabBarItem = secondTabBarItem
        thirdTabBarItem.selectedImage = UIImage(named: "fillchat")
        thirdNC.tabBarItem = thirdTabBarItem
        fourthTabBarItem.selectedImage = UIImage(named: "fillMyprofile")
        fourthNC.tabBarItem = fourthTabBarItem
    }
}
