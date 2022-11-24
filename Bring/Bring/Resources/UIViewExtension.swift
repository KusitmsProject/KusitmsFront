//
//  UIViewExtension.swift
//  CustomCalender
//
//  Created by KGY on 2022/11/18.
//

import UIKit

extension UIView {
    
    public func setOnTouchListener(_ target: Any?, action: Selector) {

        self.isUserInteractionEnabled = true
        let guestureRecognizer = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(guestureRecognizer)
    }
    
}
