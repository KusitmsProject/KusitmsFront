//
//  TodayMeViewController.swift
//  Bring
//
//  Created by 오예진 on 2022/11/06.
//

import UIKit
import Foundation

class TodayMeViewController: UIViewController {
    @IBOutlet weak var photoView: UIView!
    
    @IBOutlet weak var selectImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        //이미지 클릭 가능하도록 설정
        self.selectImage.isUserInteractionEnabled = true
        self.selectImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.pickImage)))

    }
    
    @objc func pickImage(){
        selectImage.backgroundColor = UIColor(named: "bluehover")
        selectImage.layer.borderColor = UIColor(named: "bluehoverBorder")?.cgColor
    }
    
    func setUI() {
        photoView.layer.shadowOffset = CGSize(width: 0, height: 3)
        photoView.layer.shadowOpacity = 0.15
        photoView.layer.borderWidth = 0.5
        photoView.layer.borderColor = UIColor(named: "boxLightGray")?.cgColor
        
        selectImage.layer.cornerRadius = 10
    }

}
