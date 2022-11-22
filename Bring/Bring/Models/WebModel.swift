//
//  WebModel.swift
//  CustomCalender
//
//  Created by dddddddd9 on 2022/11/18.
//

import Foundation

class WebModel {
    
        static var instance = WebModel()
    
        private init() {}
    
    private var exceptionState: String = "" {
        didSet {
            onException?(exceptionState)
        }
    }
    
    private var todayCalenderState: [[String : Any]] = [[:]] {
        didSet {
            onTodayCalender?(todayCalenderState)
        }
    }
    
    private var momentCalenderState: [[String : Any]] = [[:]] {
        didSet {
            onMomentCalender?(momentCalenderState)
        }
    }
    
    private var momentDetailState: [String : Any] = [:] {
        didSet {
            onMomentDetail?(momentDetailState)
        }
    }
    
    private var todayDetailState: [String : Any] = [:] {
        didSet {
            onTodayDetail?(todayDetailState)
        }
    }
    
    private var youtubeIdState: [[String : Any]] = [[:]] {
        didSet {
            onYoutubeIdDetail?(youtubeIdState)
        }
    }
    
    private var questionState: [String : Any] = [:] {
        didSet {
            onQuestion?(questionState)
        }
    }
    
    var onException: ((_ stringResult: String) -> Void)? = nil
    var onTodayCalender: ((_ dictResult: [[String : Any]]?) -> Void)? = nil
    var onMomentCalender: ((_ dictResult: [[String : Any]]?) -> Void)? = nil
    var onTodayDetail: ((_ dictResult: [String : Any]?) -> Void)? = nil
    var onMomentDetail: ((_ dictResult: [String : Any]?) -> Void)? = nil
    var onYoutubeIdDetail: ((_ dictResult: [[String : Any]]?) -> Void)? = nil
    var onQuestion: ((_ dictResult: [String : Any]?) -> Void)? = nil
    
    func requestTodayCalender(year: String, month: String) {
        
        Task {
            
            let result = await WebService.requestTodayCalender(year: year, month: month)
            DLogUtil.debug(tag: #file, content: String(describing: result))
            
            DispatchQueue.main.async {
                                
                if result is Error {
                    DLogUtil.debug(tag: #file, content: "onError")
                    self.exceptionState = (result as! Error).localizedDescription
                } else {
                    DLogUtil.debug(tag: #file, content: "onSuccess")
                    let response = result as! [String : Any]
                    DLogUtil.debug(tag: #file, content: response)
                    
                    let stateSuccess = JSONUtil.parsingJSONArray(jsonObject: response, key: "result")
                    DLogUtil.debug(tag: #file, content: stateSuccess)
                    self.todayCalenderState = stateSuccess

                }
                
            }
        }
    }
    
    func requestMomentCalender(year: String, month: String) {
        
        Task {
            
            let result = await WebService.requestMomentCalender(year: year, month: month)
            DLogUtil.debug(tag: #file, content: String(describing: result))
            
            DispatchQueue.main.async {
                                
                if result is Error {
                    DLogUtil.debug(tag: #file, content: "onError")
                    self.exceptionState = (result as! Error).localizedDescription
                } else {
                    DLogUtil.debug(tag: #file, content: "onSuccess")
                    let response = result as! [String : Any]
                    DLogUtil.debug(tag: #file, content: response)
                    
                    let stateSuccess = JSONUtil.parsingJSONArray(jsonObject: response, key: "result")
                    DLogUtil.debug(tag: #file, content: stateSuccess)
                    self.momentCalenderState = stateSuccess

                }
                
            }
        }
    }
    
    func requestTodayDetail(year: String, month: String, day: String) {
        
        Task {
            
            let result = await WebService.requestTodayDetail(year: year, month: month, day: day)
            DLogUtil.debug(tag: #file, content: String(describing: result))
            
            DispatchQueue.main.async {
                                
                if result is Error {
                    DLogUtil.debug(tag: #file, content: "onError")
                    self.exceptionState = (result as! Error).localizedDescription
                } else {
                    DLogUtil.debug(tag: #file, content: "onSuccess")
                    let response = result as! [String : Any]
                    DLogUtil.debug(tag: #file, content: response)
                    
                    let stateSuccess = JSONUtil.parsingJSONObject(jsonObject: response, key: "result")
                    DLogUtil.debug(tag: #file, content: stateSuccess)
                    self.todayDetailState = stateSuccess

                }
                
            }
        }
    }
    
    func requestMomentDetail(year: String, month: String, day: String) {
        
        Task {
            
            let result = await WebService.requestMomentDetail(year: year, month: month, day: day)
            DLogUtil.debug(tag: #file, content: String(describing: result))
            
            DispatchQueue.main.async {
                                
                if result is Error {
                    DLogUtil.debug(tag: #file, content: "onError")
                    self.exceptionState = (result as! Error).localizedDescription
                } else {
                    DLogUtil.debug(tag: #file, content: "onSuccess")
                    let response = result as! [String : Any]
                    DLogUtil.debug(tag: #file, content: response)
                    
                    let stateSuccess = JSONUtil.parsingJSONObject(jsonObject: response, key: "result")
                    DLogUtil.debug(tag: #file, content: stateSuccess)
                    self.momentDetailState = stateSuccess

                }
                
            }
        }
    }
    
    func requestYoutubeId(track: String, artist: String) {
        
        Task {
            
            let result = await WebService.requestYoutubeId(track: track, artist: artist)
            DLogUtil.debug(tag: #file, content: String(describing: result))
            
            DispatchQueue.main.async {
                                
                if result is Error {
                    DLogUtil.debug(tag: #file, content: "onError")
                    self.exceptionState = (result as! Error).localizedDescription
                } else {
                    DLogUtil.debug(tag: #file, content: "onSuccess")
                    let response = result as! [String : Any]
                    DLogUtil.debug(tag: #file, content: response)
                    
                    let stateSuccess = JSONUtil.parsingJSONArray(jsonObject: response, key: "result")
                    DLogUtil.debug(tag: #file, content: stateSuccess)
                    self.youtubeIdState = stateSuccess

                }
                
            }
        }
    }
    
    func requestQuestion(year: String, month: String, day: String) {
        
        Task {
            
            let result = await WebService.requestQuestion(year: year, month: month, day: day)
            DLogUtil.debug(tag: #file, content: String(describing: result))
            
            DispatchQueue.main.async {
                                
                if result is Error {
                    DLogUtil.debug(tag: #file, content: "onError")
                    self.exceptionState = (result as! Error).localizedDescription
                } else {
                    DLogUtil.debug(tag: #file, content: "onSuccess")
                    let response = result as! [String : Any]
                    DLogUtil.debug(tag: #file, content: response)
                    
                    let stateSuccess = JSONUtil.parsingJSONObject(jsonObject: response, key: "result")
                    DLogUtil.debug(tag: #file, content: stateSuccess)
                    self.questionState = stateSuccess

                }
                
            }
        }
    }
}
