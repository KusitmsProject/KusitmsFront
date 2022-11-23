//
//  PostsBySong.swift
//  Bring
//
//  Created by 오예진 on 2022/11/24.
//

import Foundation

// MARK: - Welcome
struct PostsBySong: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [ResultBySong]
}

// MARK: - Result
struct ResultBySong: Decodable {
    let date: String
    let postIdx, musicIdx: Int
    let videoID, artist, track, lyrics: String
    let emotion: String
    let options: Int

    enum CodingKeys: String, CodingKey {
        case date, postIdx, musicIdx
        case videoID = "videoId"
        case artist, track, lyrics, emotion, options
    }
}

