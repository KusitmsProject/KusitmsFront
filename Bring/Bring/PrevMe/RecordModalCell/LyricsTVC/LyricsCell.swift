//
//  LyricsCell.swift
//  Bring
//
//  Created by 오예진 on 2022/11/08.
//

import UIKit

class LyricsCell: UITableViewCell {

    @IBOutlet weak var lyricsBox: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        lyricsBox.layer.borderWidth = 1.0
        lyricsBox.layer.borderColor = UIColor(named: "LyricsBoxBorder")?.cgColor
        lyricsBox.layer.cornerRadius = 10
    }
    
}
