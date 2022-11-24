//
//  SliderCell.swift
//  Bring
//
//  Created by 오예진 on 2022/11/18.
//

import UIKit

protocol SliderCellDelegate: AnyObject {
    func nextView()
}

class SliderCell: UICollectionViewCell {
    
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var emotionLabel: UILabel!
    @IBOutlet var emotionCard: UIImageView!
    @IBOutlet var lyrics: UILabel!
    
    @IBOutlet var storageBtn: UIButton!
    @IBOutlet var playBtn: UIButton!
    
    var emotion: String?
    var track: String?
    var artist: String?
    var videoId: String?
    
    public weak var delegate: SliderCellDelegate?
    
    
    
    // 데이터 연결
    func configure(_ emotions: byEmoResult) {
        
        emotion = emotions.emotion
        track = emotions.track
        artist = emotions.artist
        videoId = "x3sFsHrUyLQ"
//        videoId = emotions.videoId
        
        var cardImg: UIImage?
        var storageBtnImg: UIImage?
        var playBtnImg: UIImage?
        
        switch emotion {
        case "HAPPY":
            emotionLabel.text = "Happy"
            cardImg = UIImage(named: "Happy")
            storageBtnImg = UIImage(named: "storageHappy")
            playBtnImg = UIImage(named: "playHappy")
            titleLabel.textColor = UIColor(hexString: "8667C9")
            artistLabel.textColor = UIColor(hexString: "8667C9")
        case "LOVELY":
            emotionLabel.text = "Fall in love"
            cardImg = UIImage(named: "Lovely")
            storageBtnImg = UIImage(named: "storageLove")
            playBtnImg = UIImage(named: "playLove")
            titleLabel.textColor = UIColor(hexString: "ED50C2")
            artistLabel.textColor = UIColor(hexString: "ED50C2")
        case "ANGRY":
            emotionLabel.text = "Burning"
            cardImg = UIImage(named: "Angry")
            storageBtnImg = UIImage(named: "storageAngry")
            playBtnImg = UIImage(named: "playAngry")
            titleLabel.textColor = UIColor(hexString: "EF8233")
            artistLabel.textColor = UIColor(hexString: "EF8233")
        case "SAD":
            emotionLabel.text = "Feel mopey"
            cardImg = UIImage(named: "Sad")
            storageBtnImg = UIImage(named: "storageSad")
            playBtnImg = UIImage(named: "playSad")
            titleLabel.textColor = UIColor(hexString: "5279B4")
            artistLabel.textColor = UIColor(hexString: "5279B4")
        case "EXPLODE":
            emotionLabel.text = "All jumbled"
            cardImg = UIImage(named: "Explode")
            storageBtnImg = UIImage(named: "storageExplode")
            playBtnImg = UIImage(named: "playExplode")
            titleLabel.textColor = UIColor(hexString: "6A5377")
            artistLabel.textColor = UIColor(hexString: "6A5377")
        case "TIRED":
            emotionLabel.text = "Feel gloomy"
            cardImg = UIImage(named: "Tired")
            storageBtnImg = UIImage(named: "storageTired")
            playBtnImg = UIImage(named: "playTired")
            titleLabel.textColor = UIColor(hexString: "9D5FB2")
            artistLabel.textColor = UIColor(hexString: "9D5FB2")
        default:
            emotionLabel.text = "Happy"
            cardImg = UIImage(named: "Happy")
            storageBtnImg = UIImage(named: "storageHappy")
            playBtnImg = UIImage(named: "playHappy")
            titleLabel.textColor = UIColor(hexString: "8667C9")
            artistLabel.textColor = UIColor(hexString: "8667C9")
        }
    
        emotionCard.image = cardImg
        lyrics.text = emotions.lyrics
        
        storageBtn.setImage(storageBtnImg, for: .normal)
        playBtn.setImage(playBtnImg, for: .normal)
        
        
        titleLabel.text = emotions.track
        artistLabel.text = emotions.artist
        track = emotions.track
        artist = emotions.artist
    }
    
    @IBAction func ByEmojiTapped(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Emoji", bundle: nil)
//        guard let Emoji = storyboard.instantiateViewController(withIdentifier: "EmojiViewController") as? EmojiViewController else {return}
//
        delegate?.nextView()
        
//        if let vc = self.next(ofType: UIViewController.self) {
//
//            vc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
//            Emoji.modalPresentationStyle = .fullScreen

//            Emoji.emotion = emotion
//            vc.present(Emoji, animated: true, completion: nil)
        
    }
    
    @IBAction func GoPlayTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Music", bundle: nil)
        guard let Music = storyboard.instantiateViewController(withIdentifier: "MusicViewController") as? MusicViewController else {return}
        if let vc = self.next(ofType: UIViewController.self) {
            vc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            Music.modalPresentationStyle = .fullScreen
            Music.track = track
            Music.artist = artist
            Music.emotion = emotion
            Music.videoId = videoId
            vc.present(Music, animated: true, completion: nil)
        }
    }
    
}

