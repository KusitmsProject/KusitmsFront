//
//  WeatherCell.swift
//  Bring
//
//  Created by 오예진 on 2022/11/08.
//

import UIKit

protocol WeatherCellDelegate: AnyObject{
    func didTapSunnyButton()
    func didTapSnowButton()
    func didTapWindyButton()
    func didTapRainyButton()
    func didTapHotButton()
    func didTapColdButton()
}
class WeatherCell: UITableViewCell {
    
    public weak var delegate: WeatherCellDelegate?

    @IBOutlet weak var checkMark: UIImageView!
    @IBOutlet weak var sunnyBtn: UIButton!
    @IBOutlet weak var snowBtn: UIButton!
    @IBOutlet weak var windyBtn: UIButton!
    @IBOutlet weak var rainyBtn: UIButton!
    @IBOutlet weak var hotBtn: UIButton!
    @IBOutlet weak var coldBtn: UIButton!
    
    var record: Record?
    
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
        self.delegate?.didTapSunnyButton()
        setTapped(sunnyBtn)
    }
    @IBAction func snowTapped(_ sender: Any) {
        self.delegate?.didTapSnowButton()
        setTapped(snowBtn)
    }
    @IBAction func windyTapped(_ sender: Any) {
        self.delegate?.didTapWindyButton()
        setTapped(windyBtn)
    }
    @IBAction func rainyTapped(_ sender: Any) {
        self.delegate?.didTapRainyButton()
        setTapped(rainyBtn)
    }
    @IBAction func coldTapped(_ sender: Any) {
        self.delegate?.didTapColdButton()
        setTapped(coldBtn)
    }
    @IBAction func hotTapped(_ sender: Any) {
        self.delegate?.didTapHotButton()
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
    
}
