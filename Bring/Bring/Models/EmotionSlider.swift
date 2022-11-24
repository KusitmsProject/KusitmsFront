//
//  EmotionSlider.swift
//  Bring
//
//  Created by 오예진 on 2022/11/18.
//

import Foundation



// MARK: - ByEmo : 감정별 랜덤 게시물 리스트 조회
struct ByEmo: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [byEmoResult]
}

// MARK: - ByEmo -> Result
struct byEmoResult: Decodable {
    let date: String
    let postIdx, musicIdx: Int
    let artist, track, lyrics, emotion, videoId: String
    let options: Int
}

extension byEmoResult {
    static var emotions: [byEmoResult] = [
        byEmoResult(date: "2022-11-12", postIdx: 18, musicIdx: 4, artist: "Day6", track: "예뻤어", lyrics: "null지금 이 말이\n우리가 다시\n시작하자는 건 아냐\n그저 너의\n", emotion: "HAPPY", videoId: "BS7tz2rAOSA", options: 0),
        byEmoResult(date: "2022-11-12", postIdx: 2, musicIdx: 3, artist: "BTS", track: "Dynamite", lyrics: "null\'Cause I, I, I\'m in the stars tonight\nSo, watch me bring the fire, and set the night alight\nYour shoes on, get up in the morn\'\nCup of milk, let\'s rock \'n\' roll\n", emotion: "LOVELY", videoId: "gdZLi9oWNZg", options: 1),
        byEmoResult(date: "2022-11-12", postIdx: 36, musicIdx: 4, artist: "Day6", track: "예뻤어", lyrics: "null지금 이 말이\n우리가 다시\n시작하자는 건 아냐\n그저 너의\n", emotion: "ANGRY", videoId: "BS7tz2rAOSA", options: 0),
        byEmoResult(date: "2022-11-12", postIdx: 13, musicIdx: 5, artist: "Day6", track: "Congratulations", lyrics: "null이제는 연락조차 받질 않아\n너 대신 들리는 무미건조한 목소리\n힘든 날들도 있는 건데\n잠깐을 못 이겨 또 다른 대안을 찾아가\n", emotion: "SAD", videoId: "BS7tz2rAOSA", options: 1),
        byEmoResult(date: "2022-11-12", postIdx: 37, musicIdx: 4, artist: "Day6", track: "예뻤어", lyrics: "null지금 이 말이\n우리가 다시\n시작하자는 건 아냐\n그저 너의\n", emotion: "EXPLODE", videoId: "BS7tz2rAOSA", options: 1),
        byEmoResult(date: "2022-11-11", postIdx: 6, musicIdx: 1, artist: "blackpink", track: "붐바야", lyrics: "nullBLACKPINK in your area\nBLACKPINK in your area\nBeen a bad girl, I know I am\nAnd I\'m so hot, I need a fan\n", emotion: "TIRED", videoId: "3ERtNZqh1XA", options: 0)
        
    ]
}


struct EmotionSlider {
    let title: String
    let emotion: String
    let card: String
    let s_card: String
    let lyrics: String
    let storageBtn: String
    let playBtn: String
    let videoID: String
    let track: String
    let artist: String
    let color: String
}


extension EmotionSlider {
    static var emotionCards: [EmotionSlider] = [
        EmotionSlider(title: "Happy", emotion: "Happiness", card: "Happy", s_card: "smile-card", lyrics: "null'Cause I, I, I'm in the stars tonight\nSo, watch me bring the fire, and set the night alight\nYour shoes on, get up in the morn'\nCup of milk, let's rock 'n' roll\n", storageBtn: "playHappy", playBtn: "storageHappy", videoID: "js1CtxSY38I", track: "Happier", artist: "Ed Sheeran", color: "8667C9"),
        EmotionSlider(title: "Fall in love", emotion: "Love", card: "Lovely", s_card: "love-card", lyrics: "If one day you lose your way \n Just remember that I’m here to stay \n Don’t you give up, keep your chin up \n And be happy!", storageBtn: "storageLove", playBtn: "playLove", videoID: "js1CtxSY38I", track: "안아줘", artist: "정준일", color: "ED50C2"),
        EmotionSlider(title: "Burning", emotion: "Anger", card: "Angry", s_card: "angry-card", lyrics: "여긴 내가 놀기엔 너무 좁아 \n 너무 좁아 큰 물에서 놀기 BABY \n 그게 내 특기 저기 선은 넘지마 \n 바로 노란 선 긋기 모터 달어 느긋하게 가다간", storageBtn: "storageAngry", playBtn: "playAngry", videoID: "js1CtxSY38I", track: "Autobahn", artist: "몬스타엑스", color: "EF8233"),
        EmotionSlider(title: "Feel mopey", emotion: "Sadness", card: "Sad", s_card: "sad-card", lyrics: "널 사랑하지 않아 \n 다른 이유는 없어 \n 미안하다는 말도 용서해달란 말도 하고 싶지 않아", storageBtn: "storageSad", playBtn: "playSad", videoID: "js1CtxSY38I", track: "널 사랑하지 않아", artist: "어반자카파", color: "5279B4"),
        EmotionSlider(title: "All jumbled", emotion: "Confusion", card: "Explode", s_card: "explode-card", lyrics: "시간아 멈춰 \n 딱 거기에 멈춰봐 \n 너는 왜 멀어져 가기만 하는 걸까 \n 시간아 멈춰", storageBtn: "storageExplode", playBtn: "playExplode", videoID: "js1CtxSY38I", track: "시간아 멈춰", artist: "다이나믹 듀오", color: "6A5377"),
        EmotionSlider(title: "Feel gloomy", emotion: "Moodiness", card: "Tired", s_card: "tired-card", lyrics: "걱정은 잠시 내려놓고 \n 대신 가볍게 짐을 챙기자 \n 실컷 웃고 다시 돌아오자 \n 거기서는 우리 아무 생각 말자", storageBtn: "storageTired", playBtn: "storageTired", videoID: "js1CtxSY38I", track: "도망가자", artist: "선우정아", color: "9D5FB2")
    ]
}
