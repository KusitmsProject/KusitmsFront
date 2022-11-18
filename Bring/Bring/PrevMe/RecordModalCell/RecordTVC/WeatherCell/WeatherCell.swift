//
//  WeatherCell.swift
//  Bring
//
//  Created by 오예진 on 2022/11/08.
//

import UIKit

class WeatherCell: UITableViewCell {
    

    @IBOutlet weak var checkMark: UIImageView!
    @IBOutlet weak var sunnyBtn: UIButton!
    @IBOutlet weak var snowBtn: UIButton!
    @IBOutlet weak var windyBtn: UIButton!
    @IBOutlet weak var rainyBtn: UIButton!
    @IBOutlet weak var hotBtn: UIButton!
    @IBOutlet weak var coldBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setButton(sunnyBtn)
        setButton(snowBtn)
        setButton(windyBtn)
        setButton(rainyBtn)
        setButton(coldBtn)
        setButton(hotBtn)
    }
    
    var weather: String = ""
    
    @IBAction func sunnyTapped(_ sender: Any) {
        setTapped(sunnyBtn)
        weather = "SUN"
    }
    @IBAction func snowTapped(_ sender: Any) {
        setTapped(snowBtn)
    }
    @IBAction func windyTapped(_ sender: Any) {
        setTapped(windyBtn)
    }
    @IBAction func rainyTapped(_ sender: Any) {
        setTapped(rainyBtn)
    }
    @IBAction func coldTapped(_ sender: Any) {
        setTapped(coldBtn)
    }
    @IBAction func hotTapped(_ sender: Any) {
        setTapped(hotBtn)
    }
    
    func setTapped(_ btn: UIButton) {
        btn.layer.borderColor = UIColor(named: "prevMain")?.cgColor
        btn.backgroundColor = UIColor(named: "prevMainSoft")
        checkMark.tintColor = UIColor(named: "prevMain")
    }

    func setButton(_ btn: UIButton) {
        btn.layer.borderColor = UIColor(named: "LyricsBoxBorder")?.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 10
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func savedWeather(_ a: String) {
        let storyboard = UIStoryboard(name:"Record", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "RecordModalController") as? RecordModalController else { return }
        
        vc.data = a
        print(vc)
    }
    
}
