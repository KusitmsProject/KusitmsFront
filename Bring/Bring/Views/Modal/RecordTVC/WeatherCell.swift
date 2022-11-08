//
//  WeatherCell.swift
//  Bring
//
//  Created by 오예진 on 2022/11/08.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var sunnyBtn: UIButton!
    @IBOutlet weak var snowBtn: UIButton!
    @IBOutlet weak var windyBtn: UIButton!
    @IBOutlet weak var rainyBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setButton(sunnyBtn)
        setButton(snowBtn)
        setButton(windyBtn)
        setButton(rainyBtn)
        
    }

    func setButton(_ btn: UIButton) {
        btn.layer.borderColor = UIColor(named: "LyricsBoxBorder")?.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 10
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
