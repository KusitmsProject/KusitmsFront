//
//  LoginViewController.swift
//  Bring
//
//  Created by 오예진 on 2022/11/22.
//

import UIKit
import KakaoSDKUser

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginTapped(_ sender: Any) {
        // 카카오톡 설치 여부 확인
        if UserApi.isKakaoTalkLoginAvailable() {
            // 카카오톡 로그인. api 호출 결과를 클로저로 전달.
            loginWithApp()
        } else {
            // 만약, 카카오톡이 깔려있지 않을 경우에는 웹 브라우저로 카카오 로그인함.
            loginWithWeb()
        }

    }
    
    // 카카오 앱으로 로그인
        func loginWithApp() {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("loginWithKakaoTalk() success.")
                    
                    UserApi.shared.me {(user, error) in
                        if let error = error {
                            print(error)
                        } else {
                            print("카카오톡으로 로그인 성공")
                            _ = oauthToken
                            self.presentToHome()
                        }
                    }
                }
            }
        }
            
        // 카카오 웹으로 로그인
        func loginWithWeb() {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("loginWithKakaoAccount() success.")
                    
                    UserApi.shared.me {(user, error) in
                        if let error = error {
                            print(error)
                        } else {
                            print("카카오톡으로 로그인 성공")
                            _ = oauthToken
                            self.presentToHome()
                        }
                    }
                }
            }
        }
    
    // 화면 전환 함수
    func presentToHome() {
        
        let homeStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let homeVC = homeStoryboard.instantiateViewController(withIdentifier: "MainTabBarController") as? MainTabBarController else { return }
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: false, completion: nil)

    }
    
}
