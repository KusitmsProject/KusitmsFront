//
//  Kakao.swift
//  Bring
//
//  Created by 오예진 on 2022/11/22.
//

import Foundation
import Alamofire
import SwiftyJSON



func postKakao(_ nickName: String, _ email: String) {
    
    let param = [
        "kakao_nickname": nickName,
        "email": email
    ]
    
    let url = "http://3.34.31.255:8081/bring/login"
    let header : HTTPHeaders = ["Content-Type": "application/json"]
    AF.request(
        url,
        method: .post,
        parameters: param,
        encoding: JSONEncoding.default,
        headers: header
    )
    .validate(contentType: ["application/json"])
    .response { response in
        print(response)
//        print(response.value!)
        switch response.result{
        case .success:
            guard let result = response.data else {return}
            do {
                let decoder = JSONDecoder()
                print("#######################")
                let json = JSON(result)
                print("+++++++++++SUCCESS+++++++++")
                print(json)
            } catch {
                print("error!\(error)")
            }
        case .failure:
            print("FAILLLLLLLLLLLLLL")
        default:
            return
        }
    }

    
    
}
