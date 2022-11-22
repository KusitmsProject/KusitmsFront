//
//  DetailViewController.swift
//  CustomCalender
//
//  Created by dddddddd9 on 2022/11/19.
//

import UIKit
import youtube_ios_player_helper

class DetailViewController: UIViewController, YTPlayerViewDelegate {
    
    @IBOutlet var labelTabTitle: UILabel!
    @IBOutlet var labelYear: UILabel!
    @IBOutlet var labelMonthDay: UILabel!
    @IBOutlet var imageViewBack: UIImageView!
    @IBOutlet var imageViewPrev: UIImageView!
    @IBOutlet var imageViewNext: UIImageView!
    @IBOutlet var uiViewUnder: UIView!
    @IBOutlet var viewEmbed: UIView!
    @IBOutlet var viewSong: UIView!
    @IBOutlet var viewSeason: UIView!
    @IBOutlet var viewWeather: UIView!
    @IBOutlet var viewDate: UIView!
    @IBOutlet var viewPeople: UIView!
    @IBOutlet var viewLocation: UIView!
    @IBOutlet var labelLocationNickname: UILabel!
    @IBOutlet var viewSongText: UIView!
    @IBOutlet var viewImotion: UIView!
    @IBOutlet var viewPhoto: UIView!
    @IBOutlet var viewRecord: UIView!
    @IBOutlet var viewPast: UIView!
    @IBOutlet var playerView: YTPlayerView!
    @IBOutlet var imageViewQuestion: UIImageView!
    @IBOutlet var viewFuture: UIView!
    @IBOutlet var labelSong: UILabel!
    @IBOutlet var labelArtist: UILabel!
    @IBOutlet var labelSeason: UILabel!
    @IBOutlet var labelWeather: UILabel!
    @IBOutlet var labelDate: UILabel!
    @IBOutlet var labelPeople: UILabel!
    @IBOutlet var labelLocation: UILabel!
    @IBOutlet var labelSongText: UILabel!
    @IBOutlet var labelEmotion: UILabel!
    @IBOutlet var imageViewPhoto: UIImageView!
    @IBOutlet var textFieldRecord: UITextView!
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var textFieldQuestion: UITextView!
    @IBOutlet var labelPast: UILabel!
    @IBOutlet var labelSongTitle: UILabel!
    @IBOutlet var labelEmotionTitle: UILabel!
    @IBOutlet var labelPhotoTitle: UILabel!
    
    @IBOutlet var constSongtextToImotion: NSLayoutConstraint!
    @IBOutlet var constLocationToSongtext: NSLayoutConstraint!
    @IBOutlet var constRecordToView: NSLayoutConstraint!
    
    var calenderDetailBean = CalenderDetailBean()
    var questionBean = QuestionBean()
    var videoBean = VideoBean()
    
    var formatter = DateFormatter()
    
    var year = ""
    var month = ""
    var day = ""
    
    var calenderState = ""
    var dayState = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        initDate()
        initView()
        updateView()
        setListener()
        requestQuestionData()
        requestData()
    }
    
    func initpalyer() {
        playerView.delegate = self
        let playVarsDic = ["playsinline": 1]
        playerView.load(withVideoId: videoBean.videoId, playerVars: playVarsDic)
        
    }
    
    // 시간을 비교해서 해당 시간대가 현재인지 과거인지 미래인지 판단
    func initDate() {
        
        let formatter = DateFormatter()

        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "yyyy-MM-dd"
        
        let date = formatter.date(from: "\(year)-\(month)-\(day)")!
        let todayDateString = formatter.string(from: Date())
        let todayDateArray = todayDateString.components(separatedBy: ["-", " "])

        let todayDate = formatter.date(from: "\(todayDateArray[0])-\(todayDateArray[1])-\(todayDateArray[2])")!
        
        DLogUtil.debug(tag: #file, content: todayDate)
        
        DLogUtil.debug(tag: #file, content: "dayState? : \(dayState)")
        if(todayDate.dateCompare(fromDate: date) == "Past") {
            
            if(dayState == "Past") {
                return
            }
            
            if(calenderState == "moment") {
                viewSong.isHidden = true
                viewWeather.isHidden = true
                viewSeason.isHidden = true
                viewDate.isHidden = true
                viewPeople.isHidden = true
                viewLocation.isHidden = true
                viewImotion.isHidden = true
                viewSongText.isHidden = true
                viewPhoto.isHidden = true
                viewRecord.isHidden = true
                //기존값 20에다 칸 당 크기 빼기.
                constRecordToView.constant = 20 - (115 * 10)
                viewPast.isHidden = false


            }
            
            playerView.isHidden = true
            imageViewQuestion.isHidden = false
            viewFuture.isHidden = true
            dayState = todayDate.dateCompare(fromDate: date)

        } else if(todayDate.dateCompare(fromDate: date) == "Today") {
            
            if(dayState == "Today") {
                return
            }
            
            viewSong.isHidden = false
            viewImotion.isHidden = false
            viewPhoto.isHidden = false

            if(calenderState == "moment") {
                viewWeather.isHidden = false
                viewSeason.isHidden = false
                viewDate.isHidden = false
                viewPeople.isHidden = false
                viewLocation.isHidden = false
                viewRecord.isHidden = false
                constRecordToView.constant = 20
            } else {
                viewSongText.isHidden = false
                constRecordToView.constant = 20 - 277
            }
            
            DLogUtil.debug(tag: #file, content: "constant ? \(constRecordToView.constant)")
            viewPast.isHidden = true
            playerView.isHidden = false
            imageViewQuestion.isHidden = true
            viewFuture.isHidden = true
            dayState = todayDate.dateCompare(fromDate: date)
            
        } else {
            
            if(dayState == "Future") {
                return
            }
            
            viewSong.isHidden = true
            viewWeather.isHidden = true
            viewSeason.isHidden = true
            viewDate.isHidden = true
            viewPeople.isHidden = true
            viewLocation.isHidden = true
            viewImotion.isHidden = true
            viewSongText.isHidden = true
            viewPhoto.isHidden = true
            viewRecord.isHidden = true
            viewFuture.isHidden = false
            constRecordToView.constant = 20 - (115 * 10)
            DLogUtil.debug(tag: #file, content: "constant ? \(constRecordToView.constant)")
            viewPast.isHidden = false
            playerView.isHidden = true
            imageViewQuestion.isHidden = false
            dayState = todayDate.dateCompare(fromDate: date)
        }
        
    }
    
    func initView() {
        
        uiViewUnder.setGradient(color1: UIColor(named: "gradient1")!, color2: UIColor(named: "gradient2")!)
        
        viewEmbed.layer.cornerRadius = 10
        viewEmbed.layer.masksToBounds = true
        
        viewSong.layer.borderWidth = 1
        viewSong.layer.borderColor = UIColor(named: "gradient1")?.cgColor
        viewSong.layer.cornerRadius = 10
        viewSong.layer.masksToBounds = true
        
        viewSeason.layer.borderWidth = 1
        viewSeason.layer.borderColor = UIColor(named: "gradient1")?.cgColor
        viewSeason.layer.cornerRadius = 10
        viewSeason.layer.masksToBounds = true
        
        viewWeather.layer.borderWidth = 1
        viewWeather.layer.borderColor = UIColor(named: "gradient1")?.cgColor
        viewWeather.layer.cornerRadius = 10
        viewWeather.layer.masksToBounds = true
        
        viewDate.layer.borderWidth = 1
        viewDate.layer.borderColor = UIColor(named: "gradient1")?.cgColor
        viewDate.layer.cornerRadius = 10
        viewDate.layer.masksToBounds = true
        
        viewPeople.layer.borderWidth = 1
        viewPeople.layer.borderColor = UIColor(named: "gradient1")?.cgColor
        viewPeople.layer.cornerRadius = 10
        viewPeople.layer.masksToBounds = true
        
        viewLocation.layer.borderWidth = 1
        viewLocation.layer.borderColor = UIColor(named: "gradient1")?.cgColor
        viewLocation.layer.cornerRadius = 10
        viewLocation.layer.masksToBounds = true
        
        viewSongText.layer.borderWidth = 1
        viewSongText.layer.borderColor = UIColor(named: "gradient1")?.cgColor
        viewSongText.layer.cornerRadius = 10
        viewSongText.layer.masksToBounds = true
        
        viewImotion.layer.borderWidth = 1
        viewImotion.layer.borderColor = UIColor(named: "gradient1")?.cgColor
        viewImotion.layer.cornerRadius = 10
        viewImotion.layer.masksToBounds = true
        
        viewPhoto.layer.borderWidth = 1
        viewPhoto.layer.borderColor = UIColor(named: "gradient1")?.cgColor
        viewPhoto.layer.cornerRadius = 10
        viewPhoto.layer.masksToBounds = true
        
        viewRecord.layer.borderWidth = 1
        viewRecord.layer.borderColor = UIColor(named: "gradient1")?.cgColor
        viewRecord.layer.cornerRadius = 10
        viewRecord.layer.masksToBounds = true
        
        if(calenderState == "moment") {
            viewSongText.isHidden = true
            constSongtextToImotion.constant = constSongtextToImotion.constant - 115
            labelTitle.text = "그날의 질문"
            labelTabTitle.text = "그때의 나"
            labelSongTitle.text = "그때의 노래"
            labelEmotionTitle.text = "그때의 감정"
            labelPhotoTitle.text = "그때의 사진"
        } else {
            viewWeather.isHidden = true
            viewSeason.isHidden = true
            viewDate.isHidden = true
            viewPeople.isHidden = true
            viewLocation.isHidden = true
            viewRecord.isHidden = true
            constLocationToSongtext.constant = constLocationToSongtext.constant - (115*5)
            constRecordToView.constant = 20 - 277
            labelTitle.text = "오늘의 기록"
            labelTabTitle.text = "오늘의 나"
            labelSongTitle.text = "오늘의 노래"
            labelEmotionTitle.text = "오늘의 감정"
            labelPhotoTitle.text = "오늘의 사진"
        }
    }
    
    
    private func updateView() {
        labelYear.text = year
        labelMonthDay.text = "\(month)월 \(day)일"
        
        // 서버 공통값
        labelSong.text = "\" \(calenderDetailBean.track) \""
        labelArtist.text = "\(calenderDetailBean.artist)"
        labelEmotion.text = "\" \(calenderDetailBean.emotion) \""
        if(calenderDetailBean.imageURL != "") {
            imageViewPhoto.image = getImageFromUrl(urlString: calenderDetailBean.imageURL)
        }
        
        if(calenderState == "moment") {
            if(dayState != "Future") {
                textFieldQuestion.text = questionBean.questionText
                if(questionBean.imageURL != "") {
                    imageViewQuestion.image = getImageFromUrl(urlString: questionBean.imageURL)
                    imageViewQuestion.isHidden = false
                }
                labelPast.text = "지난 질문엔 더이상 기록을 남길 수 없어요"
                
                if(dayState == "Today") {
                    imageViewQuestion.isHidden = true
                    labelSeason.text = "\" \(calenderDetailBean.season) \""
                    var weatherText = ""
                    if(calenderDetailBean.weather.count > 0) {
                        for i in 0 ... calenderDetailBean.weather.count - 1 {
                            weatherText = weatherText + "\(calenderDetailBean.weather[i])"
                            if i != calenderDetailBean.weather.count - 1 {
                                weatherText = weatherText + ", "
                            }
                        }
                    }
                    labelWeather.text = "\" \(weatherText) \""
                    labelDate.text = "\" \(calenderDetailBean.date) \""
                    var friendText = ""
                    if(calenderDetailBean.friendList.count > 0) {
                        for i in 0 ... calenderDetailBean.friendList.count - 1 {
                            friendText = friendText + "\(calenderDetailBean.friendList[i])"
                            if i != calenderDetailBean.friendList.count - 1 {
                                friendText = friendText + ", "
                            }
                        }
                    }
                    labelPeople.text = "\" \(friendText) \""
                    labelLocation.text = "\" \(calenderDetailBean.place) \""
                    labelLocationNickname.text = "\(calenderDetailBean.placeNickname)"
                    textFieldRecord.text = "\(calenderDetailBean.record)"

                }
            } else {
                textFieldQuestion.text = "새로운 질문은 00:00에 공개됩니다!"
                labelPast.text = "새로운 질문은 00:00에 공개됩니다!"
                imageViewQuestion.image = nil
            }
        } else {
            
            textFieldQuestion.text = "\(year)년 \(month)월 \(day)일\n윤아님의 단 하나의 기록"
            
            //데이터 없음
            if(calenderDetailBean.track == "") {
                viewSong.isHidden = true
                viewSongText.isHidden = true
                viewImotion.isHidden = true
                viewPhoto.isHidden = true
                viewPast.isHidden = false
                constRecordToView.constant = 20 - (115*5) - 277
                labelPast.text = "기록이 존재하지 않습니다."
            } else {
                viewSong.isHidden = false
                viewSongText.isHidden = false
                viewImotion.isHidden = false
                viewPhoto.isHidden = false
                viewPast.isHidden = true
                labelSongText.text = "\" \(calenderDetailBean.lyrics) \""
                constRecordToView.constant = 20 - 277
            }
            
        }
        textFieldQuestion.sizeToFit()
        textFieldQuestion.layoutIfNeeded()
        
        
        
    }
    
    //이미지 파싱 매서드
    func getImageFromUrl(urlString : String) -> UIImage {
        let url = URL(string: urlString)
        let data = try! Data(contentsOf: url!)
        
        if(UIImage(data: data) == nil) {
            return UIImage(named: "test_background")!
        } else {
            return UIImage(data: data)!
        }
    }
    
    private func setListener() {
        imageViewBack.setOnTouchListener(self, action: #selector(onBack))
        imageViewPrev.setOnTouchListener(self, action: #selector(onPrev))
        imageViewNext.setOnTouchListener(self, action: #selector(onNext))
    }
    
    private func requestQuestionData() {
        if(calenderState == "moment") {
            
            // 01~09를 1~9로
            let dayInt = Int(day)!
            let dayString : String = String(dayInt)
            
            WebModel.instance.requestQuestion(year: year, month: month, day: dayString)
            WebModel.instance.onQuestion = { dictResult in
                if dictResult != nil {
                    DLogUtil.debug(tag: #file, content: dictResult as Any)
                    if(dictResult?.count == 0) {
                        return
                    }
                    self.questionBean.parsing(jsonObject: dictResult!)
                    DLogUtil.debug(tag: #file, content: self.questionBean.imageURL)
                    self.updateView()
                }

            }
        }
    }
    
    private func requestData() {
        
        // 01~09를 1~9로.
        let dayInt = Int(day)!
        let dayString : String = String(dayInt)
        
        if(calenderState == "today") {
            WebModel.instance.requestTodayDetail(year: year, month: month, day: dayString)
            WebModel.instance.onTodayDetail  = { dictResult in
                if dictResult != nil {
                    DLogUtil.debug(tag: #file, content: dictResult as Any)
                    if(dictResult?.count == 0) {
                        return
                    }
                    self.calenderDetailBean.parsing(jsonObject: dictResult!)
                    self.requestYoutubeId(track: self.calenderDetailBean.track, artist: self.calenderDetailBean.artist)
                    self.updateView()

                }

            }
        } else {
            WebModel.instance.requestMomentDetail(year: year, month: month, day: dayString)
            WebModel.instance.onMomentDetail  = { dictResult in
                if dictResult != nil {
                    DLogUtil.debug(tag: #file, content: dictResult as Any)
                    if(dictResult?.count == 0) {
                        return
                    }
                    self.calenderDetailBean.parsing(jsonObject: dictResult!)
                    self.requestYoutubeId(track: self.calenderDetailBean.track, artist: self.calenderDetailBean.artist)
                    self.updateView()

                }

            }
        }
    }
    
    private func requestYoutubeId(track : String, artist : String) {
        
        WebModel.instance.requestYoutubeId(track: track, artist: artist)
        WebModel.instance.onYoutubeIdDetail  = { dictResult in
            if dictResult != nil {
                DLogUtil.debug(tag: #file, content: dictResult as Any)
                if(dictResult?.count == 0) {
                    return
                }
                
                self.videoBean.parsing(jsonObject: dictResult![0])
                self.initpalyer()
                
            }

        }
        
    }
    
    private func changeDay(plusMinus : Bool) {
        var plusMinusDate = 0
        if(plusMinus) {
            plusMinusDate = 1
        } else {
            plusMinusDate = -1
        }
        
        let formatter = DateFormatter()
        let calendar = Calendar.current

        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "yyyy-MM-dd"
        
        let dayMinus = DateComponents(day: plusMinusDate)

        let date = formatter.date(from: "\(year)-\(month)-\(day)")
        if let dayMinusDate = calendar.date(byAdding: dayMinus, to: date!)
        {
            let minusString = formatter.string(from: dayMinusDate)
            let dateArray = minusString.components(separatedBy: "-")
            year = dateArray[0]
            month = dateArray[1]
            day = dateArray[2]
                        
        }
    }

    @objc private func onBack() {
        dismiss(animated: true)
    }
    
    @objc private func onPrev() {
        changeDay(plusMinus: false)
        initDate()
        updateView()
        if(calenderState == "moment") {
            requestQuestionData()
        }
        requestQuestionData()
        requestData()
    }
    
    @objc private func onNext() {
        changeDay(plusMinus: true)
        initDate()
        updateView()
        if(calenderState == "moment" && dayState != "Future") {
            requestQuestionData()
        }
        requestData()
    }
    
}
