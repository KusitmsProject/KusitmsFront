//
//  CalenderDetailBean.swift
//  CustomCalender
//
//  Created by dddddddd9 on 2022/11/20.
//

import Foundation

class CalenderDetailBean {
    
    private static var imageURL_key = "imageURL"
    private static var record_key = "record"
    private static var emotion_key = "emotion"
    private static var season_key = "season"
    private static var track_key = "track"
    private static var date_key = "date"
    private static var weather_key = "weather"
    private static var friendList_key = "friendList"
    private static var placeNickname_key = "placeNickname"
    private static var place_key = "place"
    private static var artist_key = "artist"
    private static var lyrics_key = "lyrics"
    private static var video_key = "videoId"

    var imageURL = ""
    var record = ""
    var emotion = ""
    var season = ""
    var track = ""
    var date = ""
    var weather = Array<Any>()
    var friendList = Array<Any>()
    var placeNickname = ""
    var place = ""
    var artist = ""
    var lyrics = ""
    var videoId = ""

    func parsing(jsonObject: [String : Any]) {
        
        imageURL = JSONUtil.parsingString(jsonObject: jsonObject, key: CalenderDetailBean.imageURL_key)
        record = JSONUtil.parsingString(jsonObject: jsonObject, key: CalenderDetailBean.record_key)
        emotion = JSONUtil.parsingString(jsonObject: jsonObject, key: CalenderDetailBean.emotion_key)
        season = JSONUtil.parsingString(jsonObject: jsonObject, key: CalenderDetailBean.season_key)
        track = JSONUtil.parsingString(jsonObject: jsonObject, key: CalenderDetailBean.track_key)
        date = JSONUtil.parsingString(jsonObject: jsonObject, key: CalenderDetailBean.date_key)
        weather = JSONUtil.parsingArray(jsonObject: jsonObject, key: CalenderDetailBean.weather_key)
        friendList = JSONUtil.parsingArray(jsonObject: jsonObject, key: CalenderDetailBean.friendList_key)
        placeNickname = JSONUtil.parsingString(jsonObject: jsonObject, key: CalenderDetailBean.placeNickname_key)
        place = JSONUtil.parsingString(jsonObject: jsonObject, key: CalenderDetailBean.place_key)
        artist = JSONUtil.parsingString(jsonObject: jsonObject, key: CalenderDetailBean.artist_key)
        lyrics = JSONUtil.parsingString(jsonObject: jsonObject, key: CalenderDetailBean.lyrics_key)
        videoId = JSONUtil.parsingString(jsonObject: jsonObject, key: CalenderDetailBean.video_key)

    }
}
