
import Foundation

// MARK: - Kakao (Request)
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
    let message: String
    let isSuccess: Bool
    let result: userResult
    let code: Int
}

// MARK: - Result
struct userResult: Codable {
    let kakaoNickname: String
    let userIdx: Int
    let jwt: String

    enum CodingKeys: String, CodingKey {
        case kakaoNickname = "kakao_nickname"
        case userIdx, jwt
    }
}


class UserDefaultsManager: ObservableObject {
    
    @Published var accessToken: String = UserDefaults.standard.string(forKey: "AccessToken") ?? ""{
        didSet { UserDefaults.standard.set(self.accessToken, forKey: "AccessToken")}
    }
}


struct UserName {
    var name: String = ""
}
