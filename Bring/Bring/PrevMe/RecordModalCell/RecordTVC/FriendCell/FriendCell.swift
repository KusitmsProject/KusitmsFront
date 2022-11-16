//
//  FriendCell.swift
//  Bring
//
//  Created by 오예진 on 2022/11/08.
//

import UIKit

class FriendCell: UITableViewCell {

    @IBOutlet weak var checkMark: UIImageView!
    @IBOutlet weak var textField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setField()
        self.textField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func setField() {
        textField.layer.borderColor = UIColor(named: "LyricsBoxBorder")!.cgColor
        textField.layer.borderWidth = 0.8
        textField.layer.cornerRadius = 10
        textField.attributedPlaceholder = NSAttributedString(string: "+ 함께 한 사람 추가하기", attributes: [.foregroundColor: UIColor.systemGray])
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        if self.textField?.text != "" {
            checkMark.tintColor = UIColor(named: "prevMain")
        } else {
            checkMark.tintColor = UIColor(named: "boxLightGray")
        }
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
