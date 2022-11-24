//
//  SearchTrack.swift
//  Bring
//
//  Created by 오예진 on 2022/11/24.
//

import Foundation

// MARK: - SearchTrack : 유저가 검색한 노래에 대한 노래 제목, 아티스트 이름,track IDX 조회(spotify)
struct SearchTrack: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [TrackResult]
}

// MARK: - TrackResult
struct TrackResult: Codable, Hashable {
    let track, trackIdx, artist: String
}

extension TrackResult {
    static var tracks: [TrackResult] = [
    TrackResult(track: "", trackIdx: "5un6NEq6wEWPsQSaHXj7b3", artist: "Various Artists")
    ]
}
