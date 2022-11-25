//
//  VideoBean.swift
//  CustomCalender
//
//  Created by dddddddd9 on 2022/11/21.
//

import Foundation

class VideoBean {
    
    private static var videoId_key = "videoId";
    private static var videoTitle_key = "videoTitle";
    private static var videoURK_key = "videoURL";

    var videoId = "";
    var videoTitle = "";
    var videoURL = "";
    
    func parsing(jsonObject: [String : Any]) {
        
        videoId = JSONUtil.parsingString(jsonObject: jsonObject, key: VideoBean.videoId_key)
        print("================>VIDEOID", videoId)
        videoTitle = JSONUtil.parsingString(jsonObject: jsonObject, key: VideoBean.videoTitle_key)
        videoURL = JSONUtil.parsingString(jsonObject: jsonObject, key: VideoBean.videoURK_key)

    }
    
}
