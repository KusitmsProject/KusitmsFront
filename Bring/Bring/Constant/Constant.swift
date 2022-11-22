//
//  Constant.swift
//  CustomCalender
//
//  Created by dddddddd9 on 2022/11/18.
//

import Foundation

class WebConstant {
    
    static func getResponseJSONObject(responseData: Data) -> [String : Any] {
        return JSONUtil.createJSONObject(data: responseData)
    }

    static func isSuccess(responseJSONObject: [String : Any]) -> Bool {
        return JSONUtil.parsingBool(jsonObject: responseJSONObject, key: "success")
    }

    static func getCode(responseJSONObject: [String : Any]) -> Int {
        return JSONUtil.parsingInt(jsonObject: responseJSONObject, key: "code")
    }

    static func getMessage(responseJSONObject: [String : Any]) -> String {
        return JSONUtil.parsingString(jsonObject: responseJSONObject, key: "msg")
    }

    static func getListJSONArray(responseJSONObject: [String : Any]) -> [Any] {
        return JSONUtil.parsingJSONArray(jsonObject: responseJSONObject, key: "list")
    }

    static func getListString(responseJSONObject: [String : Any]) -> String {
        return JSONUtil.parsingString(jsonObject: responseJSONObject, key: "list")
    }

    static func getDataJSONObject(responseJSONObject: [String : Any]) -> [String : Any] {
        return JSONUtil.parsingJSONObject(jsonObject: responseJSONObject, key: "data")
    }

    static func getDataString(responseJSONObject: [String : Any]) -> String {
        return JSONUtil.parsingString(jsonObject: responseJSONObject, key: "data")
    }

    static func getDataInt(responseJSONObject: [String : Any]) -> Int {
        return JSONUtil.parsingInt(jsonObject: responseJSONObject, key: "data")
    }

    
    /**
     * 오늘의 나 캘린더
     */
    static func getTodayCalendar(year : String, month : String) -> String {
        return "http://3.34.31.255:8081/bring/calendar/today?year=\(year)&month=\(month)"
    }
    
    /**
     * 그때의 나 캘린더
     */
    static func getMomentCalendar(year : String, month : String) -> String {
        return "http://3.34.31.255:8081/bring/calendar/moment?year=\(year)&month=\(month)"
    }
    
    /**
     * 오늘의 나 디테일
     */
    static func getTodayDetail(year : String, month : String, day : String) -> String {
        return "http://3.34.31.255:8081/bring/calendar/today/detail?year=\(year)&month=\(month)&day=\(day)"

    }
    
    /**
     * 그때의 나 디테일
     */
    static func getMomentDetail(year : String, month : String, day : String) -> String {
        return "http://3.34.31.255:8081/bring/calendar/moment/detail?year=\(year)&month=\(month)&day=\(day)"
    }
    
    /**
     * 유튜브 ID 조회하기
     */
    static func getYouTubeId(track : String, artist : String) -> String {
        return "http://3.34.31.255:8081/bring/youtube?track=\(track)&artist=\(artist)"
    }
    
    /**
     * Detail 질문 조회하기
     */
    static func getQuestion(year : String, month : String, day : String) -> String {
        return "http://3.34.31.255:8081/bring/question?year=\(year)&month=\(month)&day=\(day)"
    }
    
}
