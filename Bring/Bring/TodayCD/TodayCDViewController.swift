//
//  HomeViewController.swift
//  Bring
//
//  Created by 오예진 on 2022/11/05.
//

import UIKit

class TodayCDViewController: UIViewController {
    
    // MARK: - Property
    
    @IBOutlet weak var topBackgroundView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var smallCDImageView: UIImageView!
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var monthDayLabel: UILabel!
    
    @IBOutlet weak var addImoticonButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var musicListView: UIView!
    
    @IBOutlet var musicTextField: UITextField!
    @IBOutlet var lyricsTextField: UITextField!
    @IBOutlet var lyricsButton: UIButton!
    
    @IBOutlet var searchIcon: UIImageView!
    
    private var gradient = CAGradientLayer()
    private let imagePicker = UIImagePickerController()
    
    private var photoImage: UIImage? {
        didSet { update() }
    }
    private var imoticonImageNmae: String? {
        didSet { update() }
    }
    private var musicName: String? {
        didSet { update() }
    }
    private var lyricsName: String? {
        didSet { update() }
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        configureConstraints()
    }
    
    // MARK: - UI
    
    private func configureViews() {
        view.layoutIfNeeded()
        
        bottomView.layer.cornerRadius = 16
        
        saveButton.layer.cornerRadius = 10
        saveButton.layer.masksToBounds = true
        
        gradient.frame = topBackgroundView.bounds
        gradient.colors = [UIColor(hexString: "BAABDB").cgColor, UIColor(hexString: "ABC3DB").cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        if gradient.superlayer == nil {
            topBackgroundView.layer.insertSublayer(self.gradient, at: 0)
        }
        photoImageView.layer.cornerRadius = 166.5
        photoImageView.layer.masksToBounds = true
        imagePicker.delegate = self
        
        musicListView.layer.cornerRadius = 10
        musicListView.layer.masksToBounds = true
        musicListView.layer.borderWidth = 1
        musicListView.layer.borderColor = UIColor(hexString: "808080").cgColor
        
        lyricsButton.setTitleColor(UIColor(hexString: "5984AF"), for: .normal)
        lyricsButton.setTitleColor(UIColor(hexString: "5984AF"), for: .selected)
        lyricsButton.setTitleColor(UIColor(hexString: "5984AF"), for: .highlighted)
        lyricsButton.titleLabel?.font = UIFont(name: "Regular", size: 13)
        
        musicTextField.layer.borderColor = UIColor(hexString: "555555").cgColor
        musicTextField.layer.borderWidth = 1
        musicTextField.layer.cornerRadius = 10
        musicTextField.addLeftPadding(inset: 10)
        lyricsTextField.layer.borderColor = UIColor(hexString: "555555").cgColor
        lyricsTextField.layer.borderWidth = 1
        lyricsTextField.layer.cornerRadius = 8
        
        initDateLabels()
    }
    
    private func configureConstraints() {
        addImoticonButton.addTarget(self, action: #selector(didTapImoticonButton), for: .touchUpInside)
    }
    
    @IBAction func didTapPhotoButton(_ sender: Any) {
        imageOrCamera()
    }
    
    @IBAction func didTapLyricsButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "LyricsList", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(
            identifier: "LyricsListViewController"
        ) as? LyricsListViewController else { return }
        viewController.completion = { [weak self] lyrics in
            self?.lyricsName = lyrics
        }
        viewController.modalPresentationStyle = .overCurrentContext
        present(viewController, animated: true)
    }
    
    private func initDateLabels() {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "kr")
        dateFormatter.dateFormat = "yyyy"
        let year = dateFormatter.string(from: Date())
    
        dateFormatter.dateFormat = "MM월 dd일"
        let monthDay = dateFormatter.string(from: Date())
        
        yearLabel.text = year
        monthDayLabel.text = monthDay
    }
    
    @objc
    private func didTapImoticonButton() {
        let storyboard = UIStoryboard(name: "Imoticon", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(
            identifier: "ImoticonViewController"
        ) as? ImoticonViewController else { return }
        
        viewController.attachView = addImoticonButton
        viewController.modalPresentationStyle = .overFullScreen
        viewController.completion = { [weak self] type in
            self?.imoticonImageNmae = type.bigImageName
        }
        
        present(viewController, animated: false)
    }
    
    private func update() {
        if let imoticonImageNmae { addImoticonButton.setImage(UIImage(named: imoticonImageNmae), for: .normal) }
        if let photoImage {
            photoImageView.image = photoImage
            smallCDImageView.isHidden = false
        }
        if let musicName {
            musicTextField.layer.borderColor = UIColor(hexString: "ABC3DB").cgColor
            musicTextField.text = musicName
            searchIcon.tintColor = UIColor(hexString: "ABC3DB")
        }
        
        if let lyricsName {
            lyricsTextField.layer.borderColor = UIColor(hexString: "ABC3DB").cgColor
            lyricsButton.setTitle(lyricsName, for: .normal)
        }
        
        if imoticonImageNmae != nil,
           photoImage != nil,
           musicName != nil,
           lyricsName != nil {
            saveButton.backgroundColor = UIColor(hexString: "5984AF")
        } else {
            saveButton.backgroundColor = UIColor(hexString: "E1E1E1")
        }
    }
}

// MARK: - Photo 관련
extension TodayCDViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var newImage: UIImage? = nil // update 할 이미지
        
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage // 수정된 이미지가 있을 경우
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage // 원본 이미지가 있을 경우
        }
        
        if newImage != nil { photoImage = newImage }
        imagePicker.dismiss(animated: true, completion: nil) // picker를 닫아줌
    }
}

extension UIResponder {
    func next<T:UIResponder>(ofType: T.Type) -> T? {
        let r = self.next
        if let r = r as? T ?? r?.next(ofType: T.self) {
            return r
        } else {
            return nil
        }
    }
}

extension TodayCDViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "MusicNameCell"
        ) else { return UITableViewCell() }

        cell.textLabel?.text = "All I Want for Christmas Is You"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        guard let text = cell.textLabel?.text else { return }
        
        musicName = text
        musicListView.isHidden = true
    }
}

extension TodayCDViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        musicListView.isHidden = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        musicListView.isHidden = true
    }
}
