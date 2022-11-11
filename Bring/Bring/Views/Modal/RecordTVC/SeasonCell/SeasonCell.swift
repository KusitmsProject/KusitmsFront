//
//  WeatherCell.swift
//  Bring
//
//  Created by 오예진 on 2022/11/08.
//

import UIKit

class SeasonCell: UITableViewCell {

    @IBOutlet weak var springBtn: UIButton!
    @IBOutlet weak var summerBtn: UIButton!
    @IBOutlet weak var fallBtn: UIButton!
    @IBOutlet weak var winterBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setButton(springBtn)
        setButton(summerBtn)
        setButton(fallBtn)
        setButton(winterBtn)
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
