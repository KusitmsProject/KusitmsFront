//
//  sameCell.swift
//  Bring
//
//  Created by 오예진 on 2022/11/21.
//

import UIKit

class sameCell: UICollectionViewCell {
    
    @IBOutlet var cell: UIView!
    
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var calendarIcon: UIImageView!
    @IBOutlet var optionLabel: UILabel!
    @IBOutlet var arrowIcon: UIImageView!
    
    func configure(_ song: ResultBySong) {
        cell.layer.cornerRadius = 20
        cell.frame.size.height = 46
        cell.layer.shadowOffset = CGSize(width: 0, height: 3)
        cell.layer.shadowOpacity = 0.1
        
        dayLabel.text = song.date
        
        let option: String
        if song.options == 0 {
            option = "그때의 나"
        } else {
            option = "오늘의 나"
        }
        optionLabel.text = option
        
    }
    
}
