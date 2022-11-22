//
//  ByEmojiViewController.swift
//  Bring
//
//  Created by 오예진 on 2022/11/19.
//

import UIKit
import youtube_ios_player_helper

class MusicViewController: UIViewController {

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
    
    // 첫 뷰 : 카드 데이터 모델 가져오기
    let emotionCards: [EmotionSlider] = EmotionSlider.emotionCards
    
    // 같은 감정 collectionView
    let songsByEmotion: [ByEmotion] = ByEmotion.list
    
    // 다른 감정 collectionView
    let songsBySong: [BySong] = BySong.list
    
    var tappedBtn = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
//        youtubeView.load(withVideoId: "WfA47O-Fb_M")
        
        sameCollectionView.dataSource = self
        sameCollectionView.delegate = self
        
        diffCollectionView.dataSource = self
        diffCollectionView.delegate = self


    }
    
    func setUI() {
        searchView.layer.cornerRadius = 10
        emojiBtns.alpha = 0
        searchBar.searchTextField.font = .systemFont(ofSize: 11)
        youtubeView.load(withVideoId: "WfA47O-Fb_M")
        youtubeView.layer.cornerRadius = 10
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
            
            let song = songsByEmotion[indexPath.item]
            cell.configure(song)
            return cell
            
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "diffCell", for: indexPath) as? diffCell else{
                return UICollectionViewCell()
            }
            
            let song = songsBySong[indexPath.item]
            if song.emotion == "Happy" {
                cell.configure(song)
                return cell
            } else {
                cell.noCell(song)
                return cell

            }
        
            
        }
    }
}

extension MusicViewController: UICollectionViewDelegateFlowLayout {
     
    // cell 사이즈 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // cell과 collectionView의 사이즈가 같음
        return collectionView.bounds.size   // size 프로퍼티 안에 width, height 모두 있음.

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}
