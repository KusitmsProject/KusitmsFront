//
//  EmojiViewController.swift
//  Bring
//
//  Created by 오예진 on 2022/11/22.
//

import UIKit
import KakaoSDKUser

class EmojiViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var emotion: String?
    
    @IBOutlet var emotionCard: UIImageView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var searchEmoji: UIButton!
    @IBOutlet var searchView: UIView!
    @IBOutlet var emojiBtns: UIView!


    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    // 감정별 게시글 조회 데이터
    var postings: [ResultByEmoji] = ResultByEmoji.postings
    
    var tappedBtn = 0

    
    @IBOutlet var userEmotion: UILabel!
    @IBOutlet var userLabel: UILabel!
    typealias Item = ResultByEmoji
    
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserInfo()
        setUI()
        collectionView.delegate = self
    }
    
    public func setDataBind(emotion: String) {
        self.emotion = emotion
    }
    
    // user 정보 가져오기
    func getUserInfo() {
        UserApi.shared.me { user, error in
            if let error = error {
                print(error)
            } else {
                let name = user?.kakaoAccount?.profile?.nickname
                guard let name = name else {return}
                self.userLabel.text = name + "님은 지금"
            }
        }
    }
    
    private func setUI() {
        
        userEmotion.text = "\(emotion ?? "")!"
        searchView.layer.cornerRadius = 10
        emojiBtns.alpha = 0
        searchBar.searchTextField.font = .systemFont(ofSize: 11)
        
        // 카드 세팅
        switch emotion {
        case "HAPPY":
            emotionCard.image = UIImage(named: "smile-card")
            userEmotion.textColor = UIColor(hexString: "8667C9")
            userLabel.textColor = UIColor(hexString: "8667C9")
            searchEmoji.setTitle("😆", for: .normal)
        case "ANGRY":
            emotionCard.image = UIImage(named: "angry-card")
            userEmotion.textColor = UIColor(hexString: "EF8233")
            userLabel.textColor = UIColor(hexString: "EF8233")
            searchEmoji.setTitle("😡", for: .normal)
        case "LOVELY":
            emotionCard.image = UIImage(named: "love-card")
            userEmotion.textColor = UIColor(hexString: "ED50C2")
            userLabel.textColor = UIColor(hexString: "ED50C2")
            searchEmoji.setTitle("🥰", for: .normal)
        case "SAD":
            emotionCard.image = UIImage(named: "sad-card")
            userEmotion.textColor = UIColor(hexString: "5279B4")
            userLabel.textColor = UIColor(hexString: "5279B4")
            searchEmoji.setTitle("😭", for: .normal)
        case "TIRED":
            emotionCard.image = UIImage(named: "tired-card")
            userEmotion.textColor = UIColor(hexString: "9D5FB2")
            userLabel.textColor = UIColor(hexString: "9D5FB2")
            searchEmoji.setTitle("😮", for: .normal)
        case "EXPLODE":
            emotionCard.image = UIImage(named: "explode-card")
            userEmotion.textColor = UIColor(hexString: "6A5377")
            userLabel.textColor = UIColor(hexString: "6A5377")
            searchEmoji.setTitle("🤯", for: .normal)
        default:
            emotionCard.image = UIImage(named: "smile-card")
            userEmotion.textColor = UIColor(hexString: "8667C9")
            userLabel.textColor = UIColor(hexString: "8667C9")
        }
        
        // (1) Presentation : Diffable Datasource
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MusicCell", for: indexPath) as? MusicCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // (2) Data : snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        GetPostsByEmoji(emotion ?? "HAPPY") { json in
            self.postings = json.result
            snapshot.appendItems(self.postings, toSection: .main)
            self.dataSource.apply(snapshot)
        }
        
        // (3) Layout : compositional layout
        self.collectionView.collectionViewLayout = self.layout()

    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
       let item = NSCollectionLayoutItem(layoutSize: itemSize)
       
       let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.33))
       let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
       
       let section = NSCollectionLayoutSection(group: group)
       section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
       
       let layout = UICollectionViewCompositionalLayout(section: section)
       return layout
   }
    
}

//extension EmojiViewController: UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return postings.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MusicCell", for: indexPath) as? MusicCell else {
//            return UICollectionViewCell()
//        }
//        GetPostsByEmoji(emotion ?? "HAPPY") { json in
//            self.postings = json.result
//            print("@@@@@@@@@@@@")
//            print(self.postings)
//            print("@@@@@@@@@@@@")
//        }
//
//        let song = postings[indexPath.item]
//        cell.configure(song)
//        return cell
//    }
//}

//extension EmojiViewController: UICollectionViewDelegateFlowLayout {
//
//    // cell 사이즈 조정
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = collectionView.bounds.width
//        return CGSize(width: width, height: 60)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return .zero
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return .zero
//    }
//}
