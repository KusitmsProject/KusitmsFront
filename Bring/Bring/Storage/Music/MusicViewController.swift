//
//  ByEmojiViewController.swift
//  Bring
//
//  Created by 오예진 on 2022/11/19.
//

import UIKit
import youtube_ios_player_helper

class MusicViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet var trackLabel: UILabel!
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var emojiCard: UIImageView!
    
    @IBOutlet var emojiBtns: UIView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var searchEmoji: UIButton!
    @IBOutlet var searchView: UIView!
    
    @IBOutlet var youtubeView: YTPlayerView!
    
    @IBOutlet var smileBtn: UIButton!
    @IBOutlet var tiredBtn: UIButton!
    @IBOutlet var explodeBtn: UIButton!
    @IBOutlet var sadBtn: UIButton!
    @IBOutlet var angryBtn: UIButton!
    @IBOutlet var loveBtn: UIButton!
    
    @IBOutlet var sameCollectionView: UICollectionView!
    @IBOutlet var diffCollectionView: UICollectionView!
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    var diffDataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    // 첫 뷰 : 카드 데이터 모델 가져오기
    let emotionCards: [EmotionSlider] = EmotionSlider.emotionCards
    
    // 같은 감정 collectionView
    let songsByEmotion: [ByEmotion] = ByEmotion.list
    
    // 다른 감정 collectionView
    let songsBySong: [BySong] = BySong.list
    
    // 노래별 게시글 조회 데이터
    let samepostings: [ResultBySong] = ResultBySong.samepostings
    let diffpostings: [ResultBySong] = ResultBySong.diffpostings
    
    typealias Item = ResultBySong
    
    enum Section {
        case main
    }
    
    var tappedBtn = 0
    
    // 이전 화면을 통해 받아올 데이터
    var track: String?
    var artist: String?
    var emotion: String?
    var videoId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        sameCollectionView.delegate = self
        diffCollectionView.delegate = self

    }
    
    public func setMusicDataBind(emotion: String, track: String, artist: String, videoId: String) {
        self.emotion = emotion
        self.track = track
        self.artist = artist
        self.videoId = videoId
    }
    
    private func setUI() {
        searchView.layer.cornerRadius = 10
        emojiBtns.alpha = 0
        searchBar.searchTextField.font = .systemFont(ofSize: 11)
        youtubeView.load(withVideoId: videoId ?? "")
        youtubeView.layer.cornerRadius = 10
        
        trackLabel.text = track
        artistLabel.text = artist
        
        switch emotion {
        case "HAPPY":
            emojiCard.image  = UIImage(named: "smile-card")
            trackLabel.textColor = UIColor(hexString: "8667C9")
            artistLabel.textColor = UIColor(hexString: "8667C9")
            searchEmoji.setTitle("😆", for: .normal)
        case "ANGRY":
            emojiCard.image  = UIImage(named: "angry-card")
            trackLabel.textColor = UIColor(hexString: "EF8233")
            artistLabel.textColor = UIColor(hexString: "EF8233")
            searchEmoji.setTitle("😡", for: .normal)
        case "LOVELY":
            emojiCard.image  = UIImage(named: "love-card")
            trackLabel.textColor = UIColor(hexString: "ED50C2")
            artistLabel.textColor = UIColor(hexString: "ED50C2")
            searchEmoji.setTitle("🥰", for: .normal)
        case "SAD":
            emojiCard.image  = UIImage(named: "sad-card")
            trackLabel.textColor = UIColor(hexString: "5279B4")
            artistLabel.textColor = UIColor(hexString: "5279B4")
            searchEmoji.setTitle("😭", for: .normal)
        case "TIRED":
            emojiCard.image  = UIImage(named: "tired-card")
            trackLabel.textColor = UIColor(hexString: "9D5FB2")
            artistLabel.textColor = UIColor(hexString: "9D5FB2")
            searchEmoji.setTitle("😮", for: .normal)
        case "EXPLODE":
            emojiCard.image  = UIImage(named: "explode-card")
            trackLabel.textColor = UIColor(hexString: "6A5377")
            artistLabel.textColor = UIColor(hexString: "6A5377")
            searchEmoji.setTitle("🤯", for: .normal)
        default:
            emojiCard.image  = UIImage(named: "explode-card")
            trackLabel.textColor = UIColor(hexString: "6A5377")
            artistLabel.textColor = UIColor(hexString: "6A5377")
            searchEmoji.setTitle("🤯", for: .normal)
        }
        
        // (1) Presentation : Diffable Datasource
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: sameCollectionView, cellProvider: {
            sameCollectionView, indexPath, item in
            guard let cell = sameCollectionView.dequeueReusableCell(withReuseIdentifier: "sameCell", for: indexPath) as? sameCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        diffDataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: diffCollectionView, cellProvider: {
            sameCollectionView, indexPath, item in
            guard let cell = sameCollectionView.dequeueReusableCell(withReuseIdentifier: "diffCell", for: indexPath) as? diffCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        
        // (2) Data : snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
//        GetPostsByEmoji(emotion ?? "HAPPY") { json in
//            self.postings = json.result
//            snapshot.appendItems(self.postings, toSection: .main)
//            self.dataSource.apply(snapshot)
//        }
        snapshot.appendItems(self.samepostings,toSection: .main)
        self.dataSource.apply(snapshot)
        
        var diffSnapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        diffSnapshot.appendSections([.main])
        diffSnapshot.appendItems(self.diffpostings,toSection: .main)
        self.diffDataSource.apply(diffSnapshot)
        
        
        // (3) Layout : compositional layout
        self.sameCollectionView.collectionViewLayout = self.layout()
        self.diffCollectionView.collectionViewLayout = self.layout()
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
    
    
    @IBAction func smileTapped(_ sender: Any) {
        setTapped(smileBtn)
        reset(loveBtn)
        reset(angryBtn)
        reset(sadBtn)
        reset(explodeBtn)
        reset(tiredBtn)
        tappedBtn = 0
    }
    @IBAction func loveTapped(_ sender: Any) {
        setTapped(loveBtn)
        reset(smileBtn)
        reset(sadBtn)
        reset(explodeBtn)
        reset(angryBtn)
        reset(tiredBtn)
        tappedBtn = 1
    }
    @IBAction func angryTapped(_ sender: Any) {
        setTapped(angryBtn)
        reset(smileBtn)
        reset(loveBtn)
        reset(tiredBtn)
        reset(explodeBtn)
        reset(sadBtn)
        tappedBtn = 2
    }
    @IBAction func sadTapped(_ sender: Any) {
        setTapped(sadBtn)
        reset(tiredBtn)
        reset(loveBtn)
        reset(smileBtn)
        reset(explodeBtn)
        reset(angryBtn)
        tappedBtn = 3
    }
    @IBAction func explodeTapped(_ sender: Any) {
        setTapped(explodeBtn)
        reset(smileBtn)
        reset(angryBtn)
        reset(loveBtn)
        reset(tiredBtn)
        reset(sadBtn)
        tappedBtn = 4
    }
    @IBAction func tiredTapped(_ sender: Any) {
        setTapped(tiredBtn)
        reset(explodeBtn)
        reset(smileBtn)
        reset(loveBtn)
        reset(angryBtn)
        reset(sadBtn)
        tappedBtn = 5
    }
    
    func reset(_ btn: UIButton) {
        btn.backgroundColor = UIColor.white
        btn.layer.borderWidth = 0
        UIView.animate(withDuration: 0.5, animations: {
            let scale = CGAffineTransform(scaleX: 1, y: 1)
           let translation = CGAffineTransform(translationX: 0, y: 0)
            
            let combine = scale.concatenating(translation)
            self.searchView.transform = combine
        })
        searchBar.alpha = 1
        emojiBtns.alpha = 0
        searchView.layer.cornerRadius = 10
    }
    
    func setButton(_ btn: UIButton) {
        btn.layer.borderColor = UIColor(named: "LyricsBoxBorder")?.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 10
    }
    
    func setTapped(_ btn: UIButton) {
        btn.layer.borderColor = UIColor(named: "prevMain")?.cgColor
        btn.backgroundColor = UIColor(named: "prevMainSoft")
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 10
        switch btn {
        case self.smileBtn:
            self.searchEmoji.setImage(UIImage(named: "smile-ic"), for: .normal)
        case self.angryBtn:
            self.searchEmoji.setImage(UIImage(named: "angry-ic"), for: .normal)
        case self.sadBtn:
            self.searchEmoji.setImage(UIImage(named: "sad-ic"), for: .normal)
        case self.explodeBtn:
            self.searchEmoji.setImage(UIImage(named: "explode-ic"), for: .normal)
        case self.loveBtn:
            self.searchEmoji.setImage(UIImage(named: "love-ic"), for: .normal)
        case self.tiredBtn:
            self.searchEmoji.setImage(UIImage(named: "tired-ic"), for: .normal)
        default:
            self.searchEmoji.setImage(UIImage(named: "emoji"), for: .normal)
        }
    }
    
    
    var turn = 0
    @IBAction func searchEmojiTap(_ sender: Any) {
        if turn == 0 {
            turn = 1
            if searchEmoji.transform == .identity {
                searchView.layer.cornerRadius = 0
                UIView.animate(withDuration: 0.5, animations: {
                    let scale = CGAffineTransform(scaleX: 7.2, y: 1)
                   let translation = CGAffineTransform(translationX: 140, y: 0)
                    
                    let combine = scale.concatenating(translation)
                    self.searchView.transform = combine
                    self.searchEmoji.setImage(UIImage(named: "x"), for: .normal)
                })
                searchBar.alpha = 0
                emojiBtns.alpha = 1
            }
        } else {
            turn = 0
            UIView.animate(withDuration: 0.5, animations: {
                let scale = CGAffineTransform(scaleX: 1, y: 1)
               let translation = CGAffineTransform(translationX: 0, y: 0)
                
                let combine = scale.concatenating(translation)
                self.searchView.transform = combine
            })
            searchBar.alpha = 1
            emojiBtns.alpha = 0
            searchView.layer.cornerRadius = 10
        }
    }
    
}

extension MusicViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == sameCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sameCell", for: indexPath) as? sameCell else{
                return UICollectionViewCell()
            }
            
            let song = samepostings[indexPath.item]
        
            cell.configure(song)
            return cell
            
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "diffCell", for: indexPath) as? diffCell else{
                return UICollectionViewCell()
            }

            let song = diffpostings[indexPath.item]
            
            cell.configure(song)
            return cell
        }
    }
}

extension MusicViewController: UICollectionViewDelegateFlowLayout {
     
    // cell 사이즈 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width
        return CGSize(width: width, height: 50)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}
