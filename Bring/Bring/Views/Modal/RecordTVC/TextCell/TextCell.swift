//
//  TextCell.swift
//  Bring
//
//  Created by 오예진 on 2022/11/12.
//

import UIKit

class TextCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var checkMark: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setField()
        self.textField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func setField() {
        textField.layer.borderColor = UIColor(named: "LyricsBoxBorder")!.cgColor
        textField.layer.borderWidth = 0.8
        textField.layer.cornerRadius = 10

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
