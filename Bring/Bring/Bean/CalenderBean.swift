//
//  CalenderBean.swift
//  Bring
//
//  Created by 오예진 on 2022/11/23.
//
import Foundation

class CalenderBean {
    
    private static var imageURL_key = "imageURL";
    private static var day_key = "day";
    private static var dayOfWeek_key = "dayOfWeek";

    var imageURL = "";
    var day = "";
    var dayOfWeek = "";
    
    func parsing(jsonObject: [String : Any]) {
        
        imageURL = JSONUtil.parsingString(jsonObject: jsonObject, key: CalenderBean.imageURL_key)
        day = JSONUtil.parsingString(jsonObject: jsonObject, key: CalenderBean.day_key)
        dayOfWeek = JSONUtil.parsingString(jsonObject: jsonObject, key: CalenderBean.dayOfWeek_key)

    }
}
