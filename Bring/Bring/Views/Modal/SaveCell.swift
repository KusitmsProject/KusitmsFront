//
//  SaveCell.swift
//  Bring
//
//  Created by 오예진 on 2022/11/08.
//

import UIKit

class SaveCell: UITableViewCell {

    @IBOutlet weak var saveBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func setUI() {
        saveBtn.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
