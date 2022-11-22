//
//  DateCell.swift
//  Bring
//
//  Created by 오예진 on 2022/11/08.
//

import UIKit

class DateCell: UITableViewCell {
    
    var record: Record?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    @IBAction func datePick(_ sender: Any) {
        let swiftDatePickerView = sender
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        
        let date = dateFormat.string(from: (swiftDatePickerView as AnyObject).date)
        
        record?.date = date
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
