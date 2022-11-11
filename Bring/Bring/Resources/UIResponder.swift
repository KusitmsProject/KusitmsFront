//
//  Responder.swift
//  Bring
//
//  Created by 오예진 on 2022/11/11.
//
import Foundation
import UIKit

extension UIResponder {
    func next<T:UIResponder>(ofType: T.Type) -> T? {
        let r = self.next
        if let r = r as? T ?? r?.next(ofType: T.self) {
            return r
        } else {
            return nil
        }
    }
}
