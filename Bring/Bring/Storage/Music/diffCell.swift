//
//  diffCell.swift
//  Bring
//
//  Created by 오예진 on 2022/11/21.
//

import UIKit

class diffCell: UICollectionViewCell {
    
    @IBOutlet var optionLabel: UILabel!
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var cell: UIView!
    
    @IBOutlet var calendarIcon: UIImageView!
    @IBOutlet var arrowIcon: UIImageView!
    
    @IBOutlet var noLabel: UILabel!
    
    func configure(_ song: ResultBySong) {
        cell.layer.cornerRadius = 30
        cell.frame.size.height = 46
        cell.layer.shadowOffset = CGSize(width: 0, height: 3)
        cell.layer.shadowOpacity = 0.2
    
        dayLabel.text = song.date
    
        let option: String
        if song.options == 0 {
            option = "그때의 나"
        } else {
            option = "오늘의 나"
        }
        optionLabel.text = option
        noLabel.alpha = 0
    }
    
    func noCell(_ song: ResultBySong) {
        
        cell.layer.cornerRadius = 20
        cell.frame.size.height = 46
        cell.layer.shadowOffset = CGSize(width: 0, height: 3)
        cell.layer.shadowOpacity = 0.2
        
        dayLabel.alpha = 0
        optionLabel.alpha = 0
        calendarIcon.alpha = 0
        arrowIcon.alpha = 0
        noLabel.alpha = 1
        
    }
}

