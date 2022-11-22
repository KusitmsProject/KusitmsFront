//
//  WebService.swift
//  CustomCalender
//
//  Created by dddddddd9 on 2022/11/18.
//

import Foundation

class WebService {
    
    static func requestTodayCalender(year : String, month : String) async -> Any {
        
        let url = WebConstant.getTodayCalendar(year: year, month: month)
        DLogUtil.debug(tag: #file, content: url)
        
        do {
            let data = try await HttpWrapper.requestGet(withUrl: url)
            return JSONUtil.createJSONObject(data: data)
        } catch {
            return error
        }
    }
    
    static func requestMomentCalender(year : String, month : String) async -> Any {
        
        let url = WebConstant.getMomentCalendar(year: year, month: month)
        DLogUtil.debug(tag: #file, content: url)
        
        do {
            let data = try await HttpWrapper.requestGet(withUrl: url)
            return JSONUtil.createJSONObject(data: data)
        } catch {
            return error
        }
    }
    
    static func requestTodayDetail(year : String, month : String, day : String) async -> Any {
        
        let url = WebConstant.getTodayDetail(year: year, month: month, day: day)
        DLogUtil.debug(tag: #file, content: url)
        
        do {
            let data = try await HttpWrapper.requestGet(withUrl: url)
            return JSONUtil.createJSONObject(data: data)
        } catch {
            return error
        }
    }
    
    static func requestMomentDetail(year : String, month : String, day : String) async -> Any {
        
        let url = WebConstant.getMomentDetail(year: year, month: month, day: day)
        DLogUtil.debug(tag: #file, content: url)
        
        do {
            let data = try await HttpWrapper.requestGet(withUrl: url)
            return JSONUtil.createJSONObject(data: data)
        } catch {
            return error
        }
    }
    
    static func requestYoutubeId(track : String, artist : String) async -> Any {
        
        let urlString = WebConstant.getYouTubeId(track: track, artist: artist)
        let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: encodedString)!
        
        DLogUtil.debug(tag: #file, content: url)
        
        do {
            let data = try await HttpWrapper.requestGet(withUrl: encodedString)
            return JSONUtil.createJSONObject(data: data)
        } catch {
            return error
        }
    }
    
    static func requestQuestion(year : String, month : String, day : String) async -> Any {
        
        let url = WebConstant.getQuestion(year: year, month: month, day: day)
        DLogUtil.debug(tag: #file, content: url)
        
        do {
            let data = try await HttpWrapper.requestGet(withUrl: url)
            return JSONUtil.createJSONObject(data: data)
        } catch {
            return error
        }
    }
}

