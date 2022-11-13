//
//  PictureCell.swift
//  Bring
//
//  Created by 오예진 on 2022/11/11.
//

import UIKit
import Foundation

class PictureCell: UITableViewCell {
    
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var imgBtn: UIButton!
    @IBOutlet weak var imgIcon: UIImageView!
    
    @IBOutlet weak var checkMark: UIImageView!
    @IBOutlet weak var confirmLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imagePicker.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        imgIcon.alpha = 0
        confirmLabel.alpha = 0
        
        // Configure the view for the selected state
    }
    
    @IBAction func btnTapped(_ sender: Any) {
        imageOrCamera()
        
    }
    
    
    @objc func imageOrCamera(){

        let alert =  UIAlertController(title: "이미지 업로드 방식을 선택하세요.", message: nil, preferredStyle: .actionSheet)
        let library =  UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary() }
        let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in self.openCamera() }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        if let vc = self.next(ofType: UIViewController.self) {
            vc.present(alert, animated: true, completion: nil)
        }
    }
    
    func openLibrary(){
      imagePicker.sourceType = .photoLibrary
        if let vc = self.next(ofType: UIViewController.self) {
            vc.present(imagePicker, animated: false, completion: nil)
        }
    }

    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            imagePicker.sourceType = .camera
            if let vc = self.next(ofType: UIViewController.self) {
                vc.present(imagePicker, animated: false, completion: nil)
            }
        }
        else{
            print("Camera not available")
        }
    }
    
}

extension PictureCell: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
   func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       
       var newImage: UIImage? = nil // update 할 이미지
       
       if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
                      newImage = possibleImage // 수정된 이미지가 있을 경우
       } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                      newImage = possibleImage // 원본 이미지가 있을 경우
       }
//                               self.selectImage.image = newImage // 받아온 이미지를 update
       if newImage != nil {
           imgBtn.setTitle("", for: .normal)
           imgBtn.setTitleColor(UIColor.black, for: .normal)
           imgIcon.alpha = 1
           confirmLabel.alpha = 1
           checkMark.tintColor = UIColor(named: "prevMain")
           imgBtn.layer.borderColor = UIColor(named: "prevMain")!.cgColor
       }
       imagePicker.dismiss(animated: true, completion: nil) // picker를 닫아줌
   }
}

