//
//  PostsBySong.swift
//  Bring
//
//  Created by 오예진 on 2022/11/24.
//

import Foundation
import Alamofire

func getPostsBySong(_ idx: Int) {
    
    var token: String{
        let userDefaultManager = UserDefaultsManager()
        return userDefaultManager.accessToken
    }
    
    let url = "http://3.34.31.255:8081/bring/emotion/searchTrack"
    
    let parameters = ["musicIdx": idx]

    AF.request(
            url,
            method: .get,
            parameters: parameters,
            encoding: URLEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json", "X-ACCESS-TOKEN": "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4IjozLCJpYXQiOjE2NjkxMTM5NzQsImV4cCI6MTY3MDU4NTIwMn0.gNzVE9d-w5buLVtJyV-m7rUyUERt-GpWbebf1pMAMVY"]
            // 나중에 header 부분 token으로 바꿔 넣기
        )
    .validate(statusCode: 200..<500)
        .response { response in
            switch response.result{
            case .success:
                guard let result = response.data else {return}
                do {
                    let decoder = JSONDecoder()
                    print(result)
                    let json = try decoder.decode(PostsBySong.self, from: result)
                    print(json)
                } catch {
                    print("error!\(error)")
                }
            default:
                return
            }
        }
    
}

