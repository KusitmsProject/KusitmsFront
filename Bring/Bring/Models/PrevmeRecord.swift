//
//  PrevmeRecord.swift
//  Bring
//
//  Created by 오예진 on 2022/11/12.
//

import Foundation

// MARK: - Welcome
struct PrevmeData: Codable {
    // userIdx 필수
    // date, options 필수
    // options : 그때의 나 = 0, 오늘의 나 = 1
    let userIdx: Int
    let date, emotion, season: String
    let weather: [String]
    let lyrics, placeNickname, place: String
    let imageURL: String
    let record, track, artist: String
    let friendList: [String]
    let options: Int

    enum CodingKeys: String, CodingKey {
        case userIdx, date, emotion, season, weather, lyrics, placeNickname, place
        case imageURL = "imageUrl"
        case record, track, artist, friendList, options
    }
}

