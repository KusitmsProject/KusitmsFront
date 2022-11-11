//
//  TodayMeViewController.swift
//  Bring
//
//  Created by 오예진 on 2022/11/06.
//

import UIKit
import Foundation
import PanModal

class TodayMeViewController: UIViewController {
    
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var selectImage: UIImageView!
    @IBOutlet weak var imagePlusLabel: UILabel!
    
    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var textInput: UITextField!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        imagePicker.delegate = self
        //이미지 클릭 가능하도록 설정
        self.selectImage.isUserInteractionEnabled = true
        self.selectImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.imageOrCamera)))
    }
    
    // 가사 모달 띄우기
    @IBAction func LyricsButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Lyrics", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LyricsModalController") as! LyricsModalController
        presentPanModal(vc)
    }
    
    
    @IBAction func recordBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Record", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RecordModalController") as! RecordModalController
        presentPanModal(vc)
    }
    
    
    @objc func imageOrCamera(){
        selectImage.backgroundColor = UIColor(named: "bluehover")
        selectImage.layer.borderColor = UIColor(named: "bluehoverBorder")?.cgColor
        
        let alert =  UIAlertController(title: "이미지 업로드 방식을 선택하세요.", message: nil, preferredStyle: .actionSheet)
        let library =  UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary() }
        let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in self.openCamera() }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    func openLibrary(){
      imagePicker.sourceType = .photoLibrary
      present(imagePicker, animated: false, completion: nil)
    }

    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            imagePicker.sourceType = .camera
            present(imagePicker, animated: false, completion: nil)
        }
        else{
            print("Camera not available")
        }
    }
    
    
    func setUI() {
        photoView.layer.shadowOffset = CGSize(width: 0, height: 3)
        photoView.layer.shadowOpacity = 0.15
        photoView.layer.borderColor = UIColor(named: "boxLightGray")?.cgColor
        selectImage.layer.cornerRadius = 10
        
        textInput.layer.borderColor = UIColor(named: "boxLightGray")?.cgColor
        textInput.layer.borderWidth = 1
        textInput.layer.cornerRadius = 10
        
        recordBtn.layer.borderColor = UIColor(named: "boxLightGray")?.cgColor
        recordBtn.layer.borderWidth = 1
        recordBtn.layer.cornerRadius = 10

    }

}

extension TodayMeViewController : UIImagePickerControllerDelegate,
UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var newImage: UIImage? = nil // update 할 이미지
        
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
                       newImage = possibleImage // 수정된 이미지가 있을 경우
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                       newImage = possibleImage // 원본 이미지가 있을 경우
        }
        self.selectImage.image = newImage // 받아온 이미지를 update
        if newImage != nil {
            self.imagePlusLabel.alpha = 0
        }
        imagePicker.dismiss(animated: true, completion: nil) // picker를 닫아줌
    }
}
