//
//  WebService.swift
//  CustomCalender
//
//  Created by dddddddd9 on 2022/11/18.
//

import Foundation
import Alamofire

class WebService {
    
    static func requestTodayCalender(year : String, month : String) async -> Any {
        
        let url = WebConstant.getTodayCalendar(year: year, month: month)
        DLogUtil.debug(tag: #file, content: url)
        
        var header = HTTPHeaders()
              header.add(name: "X-ACCESS-TOKEN", value: "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4IjozLCJpYXQiOjE2NjkxMTM5NzQsImV4cCI6MTY3MDU4NTIwMn0.gNzVE9d-w5buLVtJyV-m7rUyUERt-GpWbebf1pMAMVY")
//              header.add(name: "Content-Type", value: "multipart/form-data")
        
        do {
            let data = try await HttpWrapper.requestGet(withUrl: url, withHeader: header)
            print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$데이터 들어와 제발$$$$$$$$$$$$$$$$$$$4")
            print(data)
            return JSONUtil.createJSONObject(data: data)
        } catch {
            print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$FAIL")
            return error
        }
    }
    
    static func requestMomentCalender(year : String, month : String) async -> Any {
        
        let url = WebConstant.getMomentCalendar(year: year, month: month)
        DLogUtil.debug(tag: #file, content: url)
        
        var header = HTTPHeaders()
              header.add(name: "X-ACCESS-TOKEN", value: "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4IjozLCJpYXQiOjE2NjkxMTM5NzQsImV4cCI6MTY3MDU4NTIwMn0.gNzVE9d-w5buLVtJyV-m7rUyUERt-GpWbebf1pMAMVY")
//              header.add(name: "Content-Type", value: "multipart/form-data")
        
        do {
            let data = try await HttpWrapper.requestGet(withUrl: url, withHeader: header)
            return JSONUtil.createJSONObject(data: data)
        } catch {
            return error
        }
    }
    
    static func requestTodayDetail(year : String, month : String, day : String) async -> Any {
        
        let url = WebConstant.getTodayDetail(year: year, month: month, day: day)
        DLogUtil.debug(tag: #file, content: url)
        
        var header = HTTPHeaders()
              header.add(name: "X-ACCESS-TOKEN", value: "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4IjozLCJpYXQiOjE2NjkxMTM5NzQsImV4cCI6MTY3MDU4NTIwMn0.gNzVE9d-w5buLVtJyV-m7rUyUERt-GpWbebf1pMAMVY")
//              header.add(name: "Content-Type", value: "multipart/form-data")
        
        do {
            let data = try await HttpWrapper.requestGet(withUrl: url, withHeader: header)
            return JSONUtil.createJSONObject(data: data)
        } catch {
            return error
        }
    }
    
    static func requestMomentDetail(year : String, month : String, day : String) async -> Any {
        
        let url = WebConstant.getMomentDetail(year: year, month: month, day: day)
        DLogUtil.debug(tag: #file, content: url)
        
        var header = HTTPHeaders()
              header.add(name: "X-ACCESS-TOKEN", value: "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4IjozLCJpYXQiOjE2NjkxMTM5NzQsImV4cCI6MTY3MDU4NTIwMn0.gNzVE9d-w5buLVtJyV-m7rUyUERt-GpWbebf1pMAMVY")
//              header.add(name: "Content-Type", value: "multipart/form-data")
        
        do {
            let data = try await HttpWrapper.requestGet(withUrl: url, withHeader: header)
            return JSONUtil.createJSONObject(data: data)
        } catch {
            return error
        }
    }
    
    static func requestYoutubeId(track : String, artist : String) async -> Any {
        
        let urlString = WebConstant.getYouTubeId(track: track, artist: artist)
        let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: encodedString)!
        var header = HTTPHeaders()
              header.add(name: "X-ACCESS-TOKEN", value: "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4IjozLCJpYXQiOjE2NjkxMTM5NzQsImV4cCI6MTY3MDU4NTIwMn0.gNzVE9d-w5buLVtJyV-m7rUyUERt-GpWbebf1pMAMVY")
              header.add(name: "Content-Type", value: "multipart/form-data")
        
        DLogUtil.debug(tag: #file, content: url)
        
        do {
            let data = try await HttpWrapper.requestGet(withUrl: encodedString, withHeader: header)
            return JSONUtil.createJSONObject(data: data)
        } catch {
            return error
        }
    }
    
    static func requestQuestion(year : String, month : String, day : String) async -> Any {
        
        let url = WebConstant.getQuestion(year: year, month: month, day: day)
        DLogUtil.debug(tag: #file, content: url)
        var header = HTTPHeaders()
              header.add(name: "X-ACCESS-TOKEN", value: "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4IjozLCJpYXQiOjE2NjkxMTM5NzQsImV4cCI6MTY3MDU4NTIwMn0.gNzVE9d-w5buLVtJyV-m7rUyUERt-GpWbebf1pMAMVY")
              header.add(name: "Content-Type", value: "multipart/form-data")
        
        do {
            let data = try await HttpWrapper.requestGet(withUrl: url, withHeader: header)
            return JSONUtil.createJSONObject(data: data)
        } catch {
            return error
        }
    }
}

