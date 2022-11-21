//
//  PrevmeRecord.swift
//  Bring
//
//  Created by 오예진 on 2022/11/12.
//

import Foundation


//// MARK: - Welcome
//struct Record: Codable, Hashable {
//    // userIdx 필수
//    // date, options 필수
//    // options : 그때의 나 = 0, 오늘의 나 = 1
//    let userIdx: Int = 0
//    var date: String = "yyyy-mm-dd"
//    var emotion: String = ""
//    var season: String = ""
//    var weather: [String] = [""]
//    var lyrics: String = ""
//    var placeNickname: String = ""
//    var place: String = ""
//    var imageURL: String = ""
//    var record: String = ""
//    var track: String = ""
//    var artist: String = ""
//    var friendList: [String] = [""]
//    var options: Int = 1
//
//    // 구조제에 선언된 프로퍼티를 변경하기 위해서는 함수앞에 mutating 키워드 붙여주기
//    mutating func update(date: String, emotion: String, season: String, weather: [String], lyrics: String, placeNickname: String, place: String, imageURL: String, record: String, track: String, artist: String, friendList: [String], options: Int) {
//        //값타입인 struct는 속성을 인스턴스 메서드 내에서 수정할 수 없음
//        // 수정하려면 mutating 키워드 추가
//        // TODO: update 로직 추가
//        self.date = date
//        self.emotion = emotion
//        self.season = season
//        self.weather = weather
//        self.lyrics = lyrics
//        self.placeNickname = placeNickname
//        self.place = place
//        self.imageURL = imageURL
//        self.record = record
//        self.track = track
//        self.artist = artist
//        self.friendList = friendList
//        self.options = options
//    }
//
//    enum CodingKeys: String, CodingKey {
//        case userIdx, date, emotion, season, weather, lyrics, placeNickname, place
//        case imageURL = "imageUrl"
//        case record, track, artist, friendList, options
//    }
//}
//
//class RecordManager {
//
//    static let shared = RecordManager()
//
//    var records: [Record] = []
//
////    func trackRecord(track: String) {
////        var id: Int = 1
////        return Record(userIdx: id, date: "", emotion: "", season: "", weather: [""],
////    }
//
//}

import Foundation

struct Img: Codable {
    var imageUrls: String
}

struct Ala: Codable {
    var trackid: String
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
