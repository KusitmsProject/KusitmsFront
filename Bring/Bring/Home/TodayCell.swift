//
//  TodayCell.swift
//  Bring
//
//  Created by 오예진 on 2022/11/25.
//

import UIKit

protocol TodayMeDelegate: AnyObject {
    func moveTodayCD()
}

class TodayCell: UITableViewCell {

    @IBOutlet var moveToday: UIImageView!
    
    public weak var delegateToday: TodayMeDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
            
        self.moveToday.isUserInteractionEnabled = true
        
        self.moveToday.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.viewTapped)))
    }

    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        
        delegateToday?.moveTodayCD()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
