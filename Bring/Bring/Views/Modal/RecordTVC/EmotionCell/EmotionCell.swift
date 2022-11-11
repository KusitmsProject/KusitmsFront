//
//  EmotionCell.swift
//  Bring
//
//  Created by 오예진 on 2022/11/08.
//

import UIKit

class EmotionCell: UITableViewCell {

    @IBOutlet weak var tiredBtn: UIButton!
    @IBOutlet weak var crazyBtn: UIButton!
    @IBOutlet weak var sadBtn: UIButton!
    @IBOutlet weak var angryBtn: UIButton!
    @IBOutlet weak var loveBtn: UIButton!
    @IBOutlet weak var smileBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        setButton(smileBtn)
        setButton(crazyBtn)
        setButton(sadBtn)
        setButton(angryBtn)
        setButton(loveBtn)
        setButton(tiredBtn)
        
    }

    func setButton(_ btn: UIButton) {
        btn.layer.borderColor = UIColor(named: "LyricsBoxBorder")?.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 10
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
