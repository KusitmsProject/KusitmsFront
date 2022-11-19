//
//  MainTabBarController.swift
//  Bring
//
//  Created by 오예진 on 2022/11/05.
//

import UIKit
import Foundation

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self

    }
    
    // TabBarContoller가 보여지기 시작하는 시점에
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateNavigationItem(vc: self.selectedViewController!)
    }
    
    // viewController에 따라서 navigation 업데이트
    private func updateNavigationItem(vc: UIViewController) {
        
        switch vc {
        case is HomeViewController:
            
            let titleItem = UIBarButtonItem(title: "Home")
            
            
            navigationItem.leftBarButtonItem = titleItem
            
        case is CalendarViewController:
            
            let titleItem = UIBarButtonItem(title: "Calendar")
            
            
            navigationItem.leftBarButtonItem = titleItem
            
        case is StorageViewController:
            
            let titleItem = UIBarButtonItem(title: "Storage")
            
            
            navigationItem.leftBarButtonItem = titleItem
            
        case is MypageViewController:
            
            let titleItem = UIBarButtonItem(title: "Mypage")
            
            
            navigationItem.leftBarButtonItem = titleItem
        
        default:
            
            let titleItem = UIBarButtonItem(title: "Home")
            
            
            navigationItem.leftBarButtonItem = titleItem
            
        }
        
        
    }
}
    
// 어떤 Controller가 탭 되었는지 알 수 있음
extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        updateNavigationItem(vc: viewController)
    }
}

