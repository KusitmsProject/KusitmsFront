//
//  EmojiViewController.swift
//  Bring
//
//  Created by 오예진 on 2022/11/22.
//

import UIKit

class EmojiViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var emotion: String?
    
    @IBOutlet var emotionCard: UIImageView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var searchEmoji: UIButton!
    @IBOutlet var searchView: UIView!
    @IBOutlet var emojiBtns: UIView!
    
    // 같은 감정 collectionView
    let songsByEmotion: [ByEmotion] = ByEmotion.list
    
    var tappedBtn = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setUI()
        
    }
    
    func setUI() {
        searchView.layer.cornerRadius = 10
        emojiBtns.alpha = 0
        searchBar.searchTextField.font = .systemFont(ofSize: 11)
        
        // 카드 세팅
        switch emotion {
        case "Happiness":
            emotionCard.image = UIImage(named: "smile-card")
        case "Anger":
            emotionCard.image = UIImage(named: "angry-card")
        case "Love":
            emotionCard.image = UIImage(named: "love-card")
        case "Sadness":
            emotionCard.image = UIImage(named: "sad-card")
        case "Moodiness":
            emotionCard.image = UIImage(named: "tired-card")
        case "Confusion":
            emotionCard.image = UIImage(named: "explode-card")
        default:
            emotionCard.image = UIImage(named: "smile-card")
        }

    }
}

extension EmojiViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MusicCell", for: indexPath) as? MusicCell else {
            return UICollectionViewCell()
        }
        
        let song = songsByEmotion[indexPath.item]
        cell.configure(song)
        return cell
    }
}

extension EmojiViewController: UICollectionViewDelegateFlowLayout {
     
    // cell 사이즈 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        return CGSize(width: width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}
