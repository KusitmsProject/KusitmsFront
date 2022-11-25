//
//  PostsBySong.swift
//  Bring
//
//  Created by 오예진 on 2022/11/24.
//

import Foundation

// MARK: - PostsBySong : 노래별 게시글 조회
struct PostsBySong: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [[ResultBySong]]
}

// MARK: - PostsBySong -> Result
struct ResultBySong: Decodable, Hashable {
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

extension ResultBySong {
    
    static var samepostings : [ResultBySong] = [
    ResultBySong(date: "2022-11-03", postIdx: 9, musicIdx: 5, videoID: "x3sFsHrUyLQ", artist: "Day6", track: "Congratulations", lyrics: "null이제는 연락조차 받질 않아\n너 대신 들리는 무미건조한 목소리\n힘든 날들도 있는 건데\n잠깐을 못 이겨 또 다른 대안을 찾아가\n", emotion: "HAPPY", options: 1),
    ResultBySong(date: "2022-11-19", postIdx: 9, musicIdx: 5, videoID: "x3sFsHrUyLQ", artist: "Day6", track: "Congratulations", lyrics: "null이제는 연락조차 받질 않아\n너 대신 들리는 무미건조한 목소리\n힘든 날들도 있는 건데\n잠깐을 못 이겨 또 다른 대안을 찾아가\n", emotion: "HAPPY", options: 1)]
    
    static var diffpostings: [ResultBySong] = [ResultBySong(date: "2022-11-05", postIdx: 13, musicIdx: 5, videoID: "x3sFsHrUyLQ", artist: "Day6", track: "Congratulations", lyrics: "null이제는 연락조차 받질 않아\n너 대신 들리는 무미건조한 목소리\n힘든 날들도 있는 건데\n잠깐을 못 이겨 또 다른 대안을 찾아가\n", emotion: "SAD", options: 1),
    ResultBySong(date: "2022-11-02", postIdx: 13, musicIdx: 5, videoID: "x3sFsHrUyLQ", artist: "Day6", track: "Congratulations", lyrics: "null이제는 연락조차 받질 않아\n너 대신 들리는 무미건조한 목소리\n힘든 날들도 있는 건데\n잠깐을 못 이겨 또 다른 대안을 찾아가\n", emotion: "SAD", options: 1),
    ResultBySong(date: "2022-11-05", postIdx: 12, musicIdx: 5, videoID: "x3sFsHrUyLQ", artist: "Day6", track: "Congratulations", lyrics: "null이제는 연락조차 받질 않아\n너 대신 들리는 무미건조한 목소리\n힘든 날들도 있는 건데\n잠깐을 못 이겨 또 다른 대안을 찾아가\n", emotion: "SAD", options: 1),
    
    ]
}
