//
//  TextCell.swift
//  Bring
//
//  Created by 오예진 on 2022/11/12.
//

import UIKit

protocol TextCellDelegate: AnyObject{
    func didInsertRecords(_ inText: String)
}

class TextCell: UITableViewCell, UITextFieldDelegate {
    
    public weak var delegate: TextCellDelegate?

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var checkMark: UIImageView!
    
    var record: Record?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.textField.delegate = self
        
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.textField{
            let text: String = textField.text!
            
            self.delegate?.didInsertRecords(text)
        }
        
        return true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
