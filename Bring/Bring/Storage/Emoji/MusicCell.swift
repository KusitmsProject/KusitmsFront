//
//  MusicCell.swift
//  Bring
//
//  Created by 오예진 on 2022/11/22.
//

import UIKit

class MusicCell: UICollectionViewCell {
    
    @IBOutlet var cell: UIView!
    @IBOutlet var headIcon: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var optionLabel: UILabel!
    @IBOutlet var trackArtist: UILabel!
    @IBOutlet var arrowIcon: UIImageView!
    
    var track: String = ""
    var artist: String = ""
    
    func configure(_ song: ByEmotion) {
        cell.layer.cornerRadius = 20
        cell.frame.size.height = 46
        cell.layer.shadowOffset = CGSize(width: 0, height: 3)
        cell.layer.shadowOpacity = 0.1
        
        dateLabel.text = song.date
        
        
        trackArtist.text = String(song.track + "-" + song.artist)
        track = song.track
        artist = song.artist
        
        let option: String
        if song.options == 0 {
            option = "그때의 나"
            optionLabel.text = option
            headIcon.image = UIImage(named: "head-pupple")
            arrowIcon.image = UIImage(named: "arrow-ic-pupple")
            trackArtist.textColor = UIColor(named: "prevText")
        } else {
            option = "오늘의 나"
            optionLabel.text = option
            headIcon.image = UIImage(named: "head-blue")
            arrowIcon.image = UIImage(named: "arrow-ic-blue")
            trackArtist.textColor = UIColor(named: "todayText")
        }
    }

    override var isSelected: Bool{
        didSet {
           if isSelected {
               let storyboard = UIStoryboard(name: "Music", bundle: nil)
               guard let Music = storyboard.instantiateViewController(withIdentifier: "MusicViewController") as? MusicViewController else {return}
               if let vc = self.next(ofType: UIViewController.self) {
                   vc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                   Music.modalPresentationStyle = .fullScreen
                   Music.track = track
                   Music.artist = artist
//                   Music.emojiCard = 
                   vc.present(Music, animated: true, completion: nil)
               }
           } else {
              
           }
         }
    }
}
