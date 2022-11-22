//
//  SelectEmoji.swift
//  Bring
//
//  Created by 오예진 on 2022/11/20.
//

import Foundation
//
//struct ByEmoji: Decodable {
//    var song: [Song]
//}

// [감정보관함] 감정별 게시글 조회
struct ByEmotion: Decodable, Hashable {
    let _id: Int
    let date: String
    let postIdx: Int
    let musicIdx: Int
    let artist: String
    let track: String
    let lyrics: String
    let options: Int
}

extension ByEmotion {
    static var list: [ByEmotion] = [
        ByEmotion(_id: 0,
                 date: "2022-11-12",
                 postIdx: 2,
                 musicIdx: 3,
                 artist: "BTS",
                 track: "Dynamite",
                 lyrics: "null'Cause I, I, I'm in the stars tonight\nSo, watch me bring the fire, and set the night alight\nYour shoes on, get up in the morn'\nCup of milk, let's rock 'n' roll\n",
                 options: 1),
        ByEmotion(_id: 1,
                 date: "2022-11-12",
                 postIdx: 3,
                 musicIdx: 4,
                 artist: "BTS",
                 track: "Dynamite",
                 lyrics: "null'Cause I, I, I'm in the stars tonight\nSo, watch me bring the fire, and set the night alight\nYour shoes on, get up in the morn'\nCup of milk, let's rock 'n' roll\n",
                 options: 0),
        ByEmotion(_id: 2,
                 date: "2022-11-12",
                 postIdx: 5,
                 musicIdx: 6,
                 artist: "BTS",
                 track: "Dynamite",
                 lyrics: "null'Cause I, I, I'm in the stars tonight\nSo, watch me bring the fire, and set the night alight\nYour shoes on, get up in the morn'\nCup of milk, let's rock 'n' roll\n",
                 options: 0),
        ByEmotion(_id: 3,
                 date: "2022-11-12",
                 postIdx: 7,
                 musicIdx: 8,
                 artist: "BTS",
                 track: "Dynamite",
                 lyrics: "null'Cause I, I, I'm in the stars tonight\nSo, watch me bring the fire, and set the night alight\nYour shoes on, get up in the morn'\nCup of milk, let's rock 'n' roll\n",
                 options: 1),
        ByEmotion(_id: 4,
                 date: "2022-11-12",
                 postIdx: 7,
                 musicIdx: 8,
                 artist: "BTS",
                 track: "Dynamite",
                 lyrics: "null'Cause I, I, I'm in the stars tonight\nSo, watch me bring the fire, and set the night alight\nYour shoes on, get up in the morn'\nCup of milk, let's rock 'n' roll\n",
                 options: 1),
        ByEmotion(_id: 5,
                 date: "2022-11-12",
                 postIdx: 7,
                 musicIdx: 8,
                 artist: "BTS",
                 track: "Dynamite",
                 lyrics: "null'Cause I, I, I'm in the stars tonight\nSo, watch me bring the fire, and set the night alight\nYour shoes on, get up in the morn'\nCup of milk, let's rock 'n' roll\n",
                 options: 1)
        
    ]
}

// [감정보관함] 노래별 게시글 조회
struct BySong: Decodable, Hashable {
    let _id: Int
    let date: String
    let postIdx, musicIdx: Int
    let artist, track, lyrics, emotion: String
    let options: Int
}

extension BySong {
    static var list = [
        BySong(_id: 0,
                 date: "2022-11-12",
                 postIdx: 2,
                 musicIdx: 3,
                 artist: "BTS",
                 track: "Dynamite",
                 lyrics: "null'Cause I, I, I'm in the stars tonight\nSo, watch me bring the fire, and set the night alight\nYour shoes on, get up in the morn'\nCup of milk, let's rock 'n' roll\n",
                emotion: "Happy",
                options: 1)
    ]
}
