//
//  PostsByEmoji.swift
//  Bring
//
//  Created by 오예진 on 2022/11/24.
//

import Foundation

// MARK: - PostsByEmoji : 감정별 게시글 조회
struct PostsByEmoji: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [ResultByEmoji]
}

// MARK: - Result
struct ResultByEmoji: Decodable, Hashable {
    let date: String
    let postIdx, musicIdx: Int
    let artist, track, lyrics, emotion: String
    let options: Int
}

extension ResultByEmoji {
    
    static var postings : [ResultByEmoji] = [ResultByEmoji(date: "2022-11-12", postIdx: 2, musicIdx: 3, artist: "BTS", track: "Dynamite", lyrics: "null'Cause I, I, I'm in the stars tonight\nSo, watch me bring the fire, and set the night alight\nYour shoes on, get up in the morn'\nCup of milk, let's rock 'n' roll\n", emotion: "HAPPY", options: 1)]
}
