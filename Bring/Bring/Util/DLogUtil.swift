//
//  DLogUtil.swift
//  Bring
//
//  Created by 오예진 on 2022/11/23.
//

import Foundation

class DLogUtil {
    
    public static func debug(tag: String, content: Any) {
        
        var name = tag
        
        if tag.contains("/") {
            let arraySubstrings: [Substring] = tag.split(separator: "/")
            
            let arrayStrings: [String] = arraySubstrings.compactMap {
                (item) -> String in
                        
               return "\(item)"
            }
            
            name = arrayStrings.last!
        }
        
        print("ILog ======> \(name): \(content)")
    }
    
}
