//
//  EmotionSlider.swift
//  Bring
//
//  Created by 오예진 on 2022/11/18.
//

import Foundation

struct EmotionSlider: Codable {
    let title: String
    let emotion: String
    let card: String
    let s_card: String
    let lyrics: String
    let storageBtn: String
    let playBtn: String
}


extension EmotionSlider {
    static let emotionCards: [EmotionSlider] = [
        EmotionSlider(title: "Happy", emotion: "Happiness", card: "Happy", s_card: "smile-card", lyrics: "null'Cause I, I, I'm in the stars tonight\nSo, watch me bring the fire, and set the night alight\nYour shoes on, get up in the morn'\nCup of milk, let's rock 'n' roll\n", storageBtn: "playHappy", playBtn: "storageHappy"),
        EmotionSlider(title: "Fall in love", emotion: "Love", card: "Lovely", s_card: "love-card", lyrics: "If one day you lose your way \n Just remember that I’m here to stay \n Don’t you give up, keep your chin up \n And be happy!", storageBtn: "storageLove", playBtn: "playLove"),
        EmotionSlider(title: "Burning", emotion: "Anger", card: "Angry", s_card: "angry-card", lyrics: "여긴 내가 놀기엔 너무 좁아 \n 너무 좁아 큰 물에서 놀기 BABY \n 그게 내 특기 저기 선은 넘지마 \n 바로 노란 선 긋기 모터 달어 느긋하게 가다간", storageBtn: "storageAngry", playBtn: "playAngry"),
        EmotionSlider(title: "Feel mopey", emotion: "Sadness", card: "Sad", s_card: "sad-card", lyrics: "널 사랑하지 않아 \n 다른 이유는 없어 \n 미안하다는 말도 용서해달란 말도 하고 싶지 않아", storageBtn: "storageSad", playBtn: "playSad"),
        EmotionSlider(title: "All jumbled", emotion: "Confusion", card: "Explode", s_card: "explode-card", lyrics: "시간아 멈춰 \n 딱 거기에 멈춰봐 \n 너는 왜 멀어져 가기만 하는 걸까 \n 시간아 멈춰", storageBtn: "storageExplode", playBtn: "playExplode"),
        EmotionSlider(title: "Feel gloomy", emotion: "Moodiness", card: "Tired", s_card: "tired-card", lyrics: "걱정은 잠시 내려놓고 \n 대신 가볍게 짐을 챙기자 \n 실컷 웃고 다시 돌아오자 \n 거기서는 우리 아무 생각 말자", storageBtn: "storageTired", playBtn: "storageTired")
    ]
}
