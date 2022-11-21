//
//  WeatherCell.swift
//  Bring
//
//  Created by 오예진 on 2022/11/08.
//

import UIKit

protocol SeasonCellDelegate: AnyObject {
    func didTapSpringBtn()
    func didTapSummerBtn()
    func didTapFallBtn()
    func didTapWinterBtn()
}
class SeasonCell: UITableViewCell {
    
    public weak var delegate: SeasonCellDelegate?

    @IBOutlet weak var springBtn: UIButton!
    @IBOutlet weak var summerBtn: UIButton!
    @IBOutlet weak var fallBtn: UIButton!
    @IBOutlet weak var winterBtn: UIButton!
    
    @IBOutlet weak var checkMark: UIImageView!
    
    var record: Record?
    
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
        self.delegate?.didTapSpringBtn()
        setTapped(springBtn)
        reset(summerBtn)
        reset(fallBtn)
        reset(winterBtn)
    }
    @IBAction func summerTapped(_ sender: Any) {
        self.delegate?.didTapSummerBtn()
        setTapped(summerBtn)
        reset(springBtn)
        reset(fallBtn)
        reset(winterBtn)
    }
    @IBAction func fallTapped(_ sender: Any) {
        self.delegate?.didTapFallBtn()
        setTapped(fallBtn)
        reset(springBtn)
        reset(summerBtn)
        reset(winterBtn)
    }
    @IBAction func winterTapped(_ sender: Any) {
        self.delegate?.didTapWinterBtn()
        setTapped(winterBtn)
        reset(springBtn)
        reset(summerBtn)
        reset(fallBtn)
    }
    
    
    func setTapped(_ btn: UIButton) {
        btn.layer.borderColor = UIColor(named: "prevMain")?.cgColor
        btn.backgroundColor = UIColor(named: "prevMainSoft")
        checkMark.tintColor = UIColor(named: "prevMain")
    }
    
    func reset(_ btn: UIButton) {
        btn.layer.borderColor = UIColor(named: "LyricsBoxBorder")?.cgColor
        btn.backgroundColor = UIColor.white
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
