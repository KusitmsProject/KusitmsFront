//
//  QuestionBean.swift
//  CustomCalender
//
//  Created by dddddddd9 on 2022/11/20.
//

import Foundation

class QuestionBean {
    
    private static var imageURL_key = "imageUrl";
    private static var questionIdx_key = "questionIdx";
    private static var videoIdx_key = "videoIdx";
    private static var questionText_key = "questionText";

    var imageURL = "";
    var questionIdx = "";
    var videoIdx = "";
    var questionText = "";
    
    func parsing(jsonObject: [String : Any]) {
        
        imageURL = JSONUtil.parsingString(jsonObject: jsonObject, key: QuestionBean.imageURL_key)
        questionIdx = JSONUtil.parsingString(jsonObject: jsonObject, key: QuestionBean.questionIdx_key)
        videoIdx = JSONUtil.parsingString(jsonObject: jsonObject, key: QuestionBean.videoIdx_key)
        questionText = JSONUtil.parsingString(jsonObject: jsonObject, key: QuestionBean.questionText_key)

    }
}
