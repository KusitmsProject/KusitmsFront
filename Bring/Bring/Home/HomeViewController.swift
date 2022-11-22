//
//  HomeViewController.swift
//  Bring
//
//  Created by 오예진 on 2022/11/05.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKUser
import KakaoSDKAuth

class HomeViewController: UIViewController {

    @IBOutlet var userLabel: UILabel!
    
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserInfo()
    }
    
    // user 정보 가져오기
    func getUserInfo() {
        UserApi.shared.me() { (user, error) in
            if let error = error {
                print(error)
            } else {
                let name = user?.kakaoAccount?.profile?.nickname
                guard let name = name else {return}
                self.user.name = name
                self.setUI()
            }
        }
    }
    
    func setUI() {
        userLabel.text = user.name+"님"
    }
    

}
