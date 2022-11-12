//
//  PrevmeRecord.swift
//  Bring
//
//  Created by 오예진 on 2022/11/12.
//

import Foundation

struct PrevmeData: Hashable {
    let _id: String
    var music: String
}

extension PrevmeData {
    static var data = PrevmeData(_id: " ", music: "")
}
