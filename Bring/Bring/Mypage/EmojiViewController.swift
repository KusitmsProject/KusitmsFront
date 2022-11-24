//
//  EmojiViewController.swift
//  Bring
//
//  Created by 오예진 on 2022/11/22.
//

import UIKit

class EmojiViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var emotion: String?
    
    @IBOutlet var emotionCard: UIImageView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var searchEmoji: UIButton!
    @IBOutlet var searchView: UIView!
    @IBOutlet var emojiBtns: UIView!
    
    // 같은 감정 collectionView
//    let songsByEmotion: [ByEmotion] = ByEmotion.list

    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    // 감정별 게시글 조회 데이터
    var postings: [ResultByEmoji] = ResultByEmoji.postings
    
    var tappedBtn = 0
    
    typealias Item = ResultByEmoji
    
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        collectionView.delegate = self
    }
    
    private func setUI() {
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
