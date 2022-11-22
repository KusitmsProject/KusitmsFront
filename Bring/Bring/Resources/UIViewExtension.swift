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
    
    func setGradient(color1:UIColor,color2:UIColor){
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [color1.cgColor,color2.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
    
}
