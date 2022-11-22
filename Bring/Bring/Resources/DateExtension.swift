//
//  DateExtension.swift
//  CustomCalender
//
//  Created by KGY on 2022/11/20.
//

import Foundation
extension Date {

    public func dateCompare(fromDate: Date) -> String {
        var strDateMessage:String = ""
        let result:ComparisonResult = self.compare(fromDate)
        DLogUtil.debug(tag: #file, content: self)
        DLogUtil.debug(tag: #file, content: fromDate)

        switch result {
        case .orderedAscending:
            strDateMessage = "Future"
            break
        case .orderedDescending:
            strDateMessage = "Past"
            break
        case .orderedSame:
            strDateMessage = "Today"
            break
        default:
            strDateMessage = "Error"
            break
        }
        return strDateMessage
    }
}
