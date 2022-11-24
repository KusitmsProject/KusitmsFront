//
//  GetTrack.swift
//  Bring
//
//  Created by 오예진 on 2022/11/24.
//

import Foundation
import Alamofire

func GetTrack(_ track: String, _ completedHandler : @escaping (SearchTrack)->Void){
    
    // jwt token
    var token: String{
        let userDefaultManager = UserDefaultsManager()
        return userDefaultManager.accessToken
    }
    
    let url = "http://3.34.31.255:8081/bring/spotify/track"
    
    let parameters = ["track": track]
    
    AF.request(url,
               method: .get,
               parameters: parameters,
               encoding: URLEncoding.default,
               headers:["Content-Type":"application/json", "Accept":"application/json", "X-ACCESS-TOKEN": "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4IjozLCJpYXQiOjE2NjkxMTM5NzQsImV4cCI6MTY3MDU4NTIwMn0.gNzVE9d-w5buLVtJyV-m7rUyUERt-GpWbebf1pMAMVY"]
    )
    .validate(statusCode: 200..<500)
    .responseJSON(completionHandler: { response in
        switch response.result{
        case .success:
            guard let result = response.data else {return}
            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode(SearchTrack.self, from: result)
                completedHandler(json)
            } catch {
                print("Search Error!\(error)")
            }
        default:
            return
        }
    })
}
