//
//  PrevmeRecord.swift
//  Bring
//
//  Created by 오예진 on 2022/11/12.
//

import Foundation

struct Img: Codable {
    var imageUrls: String
}

struct Place: Codable {
    var address: String
    var nickName: String
}

// MARK: - Record
struct Record: Codable {
    let userIdx: Int
    var date: String
    var emotion: String
    var season: String
    var weather: [String]
    var lyrics, placeNickname, place: String
    var imageURL: String
    var record, track, artist: String
    var friendList: [String]
    let options: Int

    enum CodingKeys: String, CodingKey {
        case userIdx, date, emotion, season, weather, lyrics, placeNickname, place
        case imageURL = "imageUrl"
        case record, track, artist, friendList, options
    }
}
