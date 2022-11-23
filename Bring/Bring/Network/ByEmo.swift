//
//  ByEmo.swift
//  Bring
//
//  Created by 오예진 on 2022/11/23.
//

import Foundation
import Alamofire
import SwiftyJSON


func getSlider(){

    var token: String{
        let userDefaultManager = UserDefaultsManager()
        return userDefaultManager.accessToken
    }
    
    let url = "http://3.34.31.255:8081/bring/emotion/randomEmotion"
    AF.request(
            url,
            method: .get,
            parameters: nil,
            encoding: URLEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json", "X-ACCESS-TOKEN": token]
            // 나중에 header 부분 token으로 바꿔 넣기
        )
    .validate(statusCode: 200..<500)
        .response { response in
            switch response.result{
            case .success:
                guard let result = response.data else {return}
                do {
                    let decoder = JSONDecoder()
                    let json = try decoder.decode(ByEmo.self, from: result)
                    print(json)
                } catch {
                    print("error!\(error)")
                }
            default:
                return
            }
        }
}
