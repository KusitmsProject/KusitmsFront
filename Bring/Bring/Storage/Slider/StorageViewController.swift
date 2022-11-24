//
//  StorageViewController.swift
//  Bring
//
//  Created by 오예진 on 2022/11/05.
//

import UIKit

class StorageViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var pageControl: UIPageControl!


    var emotions: [byEmoResult] = byEmoResult.emotions
    
    var emoji: String?
    
//    var emotion = emotions.emotion
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        pageControl.numberOfPages = 6
        
    }

}

extension StorageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as? SliderCell else{
            return UICollectionViewCell()
        }
        
        // messages에서 item을 가져와서 cell을 구성
        let emotion = emotions[indexPath.item]
        
        cell.configure(emotion)
        emoji = emotion.emotion
        cell.delegate = self
        return cell
    }
}

extension StorageViewController: UICollectionViewDelegateFlowLayout {
     
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

extension StorageViewController: UIScrollViewDelegate {
    
    // 페이지가 움직이다가 멈췄을 때 실행되는 함수
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        // 위에서 페이지 구하는 식 가져오기
        let index = Int(scrollView.contentOffset.x / self.collectionView.bounds.width)
        
        // 이 index를 currentPage에 업데이트!
        pageControl.currentPage = index
    }
}

extension StorageViewController: SliderCellDelegate {
    func nextView(emotion: String) {
        
        let storyboard = UIStoryboard(name: "Emoji", bundle: nil)
        guard let Emoji = storyboard.instantiateViewController(withIdentifier: "EmojiViewController") as? EmojiViewController else {return}
        
        Emoji.setDataBind(emotion: emotion)
        
        self.navigationController?.pushViewController(Emoji, animated: true)
        
    }
    
    func nextMusicView(emotion: String, track: String, artist: String, videoId: String) {
        let storyboard = UIStoryboard(name: "Music", bundle: nil)
        guard let Music = storyboard.instantiateViewController(withIdentifier: "MusicViewController") as? MusicViewController else {return}
        Music.setMusicDataBind(emotion: emotion, track: track, artist: artist, videoId: videoId)
        
        self.navigationController?.pushViewController(Music, animated: true)
    }
}


