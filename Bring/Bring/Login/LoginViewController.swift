//
//  LoginViewController.swift
//  Bring
//
//  Created by 오예진 on 2022/11/22.
//

import UIKit
import KakaoSDKUser

class LoginViewController: UIViewController {
    
    var kakao = Kakao(kakaoNickname: "", email: "")
    var userName = UserName()
    
    let homeStoryboard = UIStoryboard(name: "Main", bundle: nil)

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
    
}

extension LoginViewController {
    
    // 카카오 앱으로 로그인
        func loginWithApp() {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("****************loginWithKakaoTalk() success****************")
                    
                    UserApi.shared.me {(user, error) in
                        if let error = error {
                            print(error)
                        } else {
                            print("카카오톡앱으로 로그인 성공")
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
                
                    print("##############ACCESSTOKEN##############", oauthToken!.accessToken)
                    print("****************loginWithKakaoTalk() SUCESS****************")
                    
                    UserApi.shared.me {(user, error) in
                        if let error = error {
                            print(error)
                        } else {
                            print("카카오톡웹으로 로그인 성공")
                            _ = oauthToken
                            self.presentToHome()
                        }
                    }
                    
                    self.getUserInfo()
                    getPostsBySong(5)
                }
            }
        }
    
    // 화면 전환 함수
    func presentToHome() {
        
        guard let homeVC = homeStoryboard.instantiateViewController(withIdentifier: "MainTabBarController") as? MainTabBarController else { return }
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: false, completion: nil)

    }

    
    // user 정보 가져오기
    func getUserInfo() {
        
        UserApi.shared.me() { (user, error) in
            if let error = error {
                print(error)
            } else {
                
                print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
                let name = user?.kakaoAccount?.profile?.nickname
                let email = user?.kakaoAccount?.email
                guard let name = name else {return}
                self.kakao.kakaoNickname = name
                self.kakao.email = email!
                print("KAKAONAME----->", name)
                print("KAKAOEMAIL----->", email!)
                self.userName.name = name
                print("=========>",self.userName.name)
                postKakao(name, email ?? "")
            }
        }
    }
    
}
