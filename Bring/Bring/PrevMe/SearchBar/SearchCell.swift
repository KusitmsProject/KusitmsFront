//
//  SearchCell.swift
//  Bring
//
//  Created by 오예진 on 2022/11/12.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var exLabel: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        exLabel.font = UIFont.systemFont(ofSize: 11)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        exLabel.textColor = UIColor(named: "boxLightGray")
    }
    
}
