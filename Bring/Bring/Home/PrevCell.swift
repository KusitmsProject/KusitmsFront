//
//  PrevCell.swift
//  Bring
//
//  Created by 오예진 on 2022/11/24.
//

import UIKit

protocol PrevMeDelegate: AnyObject {
    func movePrev()
}

class PrevCell: UITableViewCell {

    @IBOutlet var prevMove: UIImageView!
    
    public weak var delegatePrev: PrevMeDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.prevMove.isUserInteractionEnabled = true
        
        self.prevMove.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.viewTapped)))
    }
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        
        // 그때의 나 기록 페이지 이동
        delegatePrev?.movePrev()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
