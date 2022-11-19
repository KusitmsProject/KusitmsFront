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
    
    @IBOutlet weak var checkMark: UIImageView!
    
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
    
    @IBAction func springTapped(_ sender: Any) {
        setTapped(springBtn)
    }
    @IBAction func summerTapped(_ sender: Any) {
        setTapped(summerBtn)
    }
    @IBAction func fallTapped(_ sender: Any) {
        setTapped(fallBtn)
    }
    @IBAction func winterTapped(_ sender: Any) {
        setTapped(winterBtn)
    }
    
    
    func setTapped(_ btn: UIButton) {
        btn.layer.borderColor = UIColor(named: "prevMain")?.cgColor
        btn.backgroundColor = UIColor(named: "prevMainSoft")
        checkMark.tintColor = UIColor(named: "prevMain")
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
