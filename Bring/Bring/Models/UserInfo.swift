//
//  UserInfo.swift
//  Bring
//
//  Created by 오예진 on 2022/11/22.
//

import Foundation

// MARK: - Kakao
struct Kakao: Encodable {
    var kakaoNickname: String
    var email: String

//    enum CodingKeys: String, CodingKey {
//        case kakaoNickname = "kakao_nickname"
//        case email
//    }
}



// MARK: - User
struct User: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: Result
}

// MARK: - Result
struct Result: Codable {
    var kakaoNickname: String
    var userIdx: Int
    var jwt: String

//    enum CodingKeys: String, CodingKey {
//        case kakaoNickname = "kakao_nickname"
//        case userIdx, jwt
//    }
}


