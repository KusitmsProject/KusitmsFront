//
//  TitleCell.swift
//  Bring
//
//  Created by 오예진 on 2022/11/08.
//

import UIKit

class TitleCell: UITableViewCell {

    @IBOutlet weak var titleBox: UIView!
    @IBOutlet weak var titleIcon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
