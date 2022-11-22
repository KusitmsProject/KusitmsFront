//
//  CalendarViewController.swift
//  Bring
//
//  Created by 오예진 on 2022/11/05.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {

    @IBOutlet var calenderView: FSCalendar!
    @IBOutlet var imageViewBack: UIImageView!
    @IBOutlet var imageViewNext: UIImageView!
    @IBOutlet var labelYear: UILabel!
    @IBOutlet var labelMonth: UILabel!
    @IBOutlet var viewUnderCalender: UIView!
    @IBOutlet var viewInformation: UIView!
    @IBOutlet var viewBackground: UIView!
    @IBOutlet var stackSelect: UIStackView!
    @IBOutlet var stack1View: UIView!
    @IBOutlet var labelStack1: UILabel!
    @IBOutlet var stack2View: UIView!
    @IBOutlet var labelStack2: UILabel!
    
    var calenderBeanList = Array<CalenderBean>()

    var width = 40
    var height = 40
    
    var currentPageMonth = 0
    var currentPageYear = 0
    
    var calenderState = "moment"
    
    let calendar = Calendar.current
    lazy var currentPage = calenderView.currentPage
    lazy var today: Date = {
        return Date()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initCalender()
        initView()
        setListener()
    }
    
    func initData(year : String, month : String) {
        if(calenderState == "today") {
            WebModel.instance.requestTodayCalender(year: year, month: month)
            WebModel.instance.onTodayCalender  = { dictResult in
                if dictResult != nil {
                    DLogUtil.debug(tag: #file, content: dictResult as Any)
                    if(dictResult?.count == 0) {
                        return
                    }
                    
                    self.calenderBeanList.removeAll()
                    
                    for i in 0 ... dictResult!.count - 1 {
                        let calenderBean = CalenderBean()
                        calenderBean.parsing(jsonObject: dictResult![i])
                        self.calenderBeanList.append(calenderBean)
                    }
                    
                    DLogUtil.debug(tag: #file, content: "reload")
                    self.calenderView.reloadData()
                }
                
            }
        } else {
            WebModel.instance.requestMomentCalender(year: year, month: month)
            WebModel.instance.onMomentCalender  = { dictResult in
                if dictResult != nil {
                    DLogUtil.debug(tag: #file, content: dictResult as Any)
                    if(dictResult?.count == 0) {
                        return
                    }
                    
                    self.calenderBeanList.removeAll()
                    
                    for i in 0 ... dictResult!.count - 1 {
                        let calenderBean = CalenderBean()
                        calenderBean.parsing(jsonObject: dictResult![i])
                        self.calenderBeanList.append(calenderBean)
                    }
                    
                    DLogUtil.debug(tag: #file, content: "reload")
                    self.calenderView.reloadData()
                }
                
            }
        }
    }
    
    func initView() {
        viewUnderCalender.layer.cornerRadius = 10
        viewUnderCalender.layer.masksToBounds = true
        viewInformation.layer.cornerRadius = 10
        viewInformation.layer.borderWidth = 0.5
        viewInformation.layer.borderColor = UIColor(named: "border_color")?.cgColor
        viewInformation.layer.masksToBounds = true
        viewBackground.setGradient(color1: UIColor(named: "gradient1") ?? .white, color2: UIColor(named: "gradient2") ?? .white)
        stackSelect.layer.cornerRadius = 10
        stackSelect.layer.masksToBounds = true
        stack1View.layer.cornerRadius = 10
        stack1View.layer.masksToBounds = true
        stack2View.layer.cornerRadius = 10
        stack2View.layer.masksToBounds = true
        updateView()
    }
    
    func initCalender() {
        calenderView.delegate = self
        calenderView.dataSource = self
        calenderView.locale = Locale(identifier: "en-US")
        calenderView.appearance.caseOptions = FSCalendarCaseOptions.weekdayUsesSingleUpperCase
        
        calenderView.today = nil // 오늘 선택 없애기
        calenderView.scrollEnabled = false // 캘린더 스크롤
        calenderView.headerHeight = 0 // 헤더 없애기
        calenderView.placeholderType = .none
        calenderView.weekdayHeight = 15
        calenderView.scope = .month
        
        calenderView.appearance.weekdayFont = UIFont.systemFont(ofSize: 13)
        calenderView.appearance.titleFont = UIFont.systemFont(ofSize: 10)
        
        updateHeader()

    }
    
    func updateHeader() {
        currentPageMonth = calendar.component(.month, from: calenderView.currentPage)
        currentPageYear = calendar.component(.year, from: calenderView.currentPage)

        DLogUtil.debug(tag: #file, content: currentPageMonth)
        DLogUtil.debug(tag: #file, content: currentPageYear)
        
        labelYear.text = "\(currentPageYear)"
        labelMonth.text = "\(currentPageMonth)월"
        
        initData(year: String(currentPageYear), month: String(currentPageMonth))
    }
    
    func updateView() {
        if(calenderState == "moment") {
            stack1View.backgroundColor = UIColor(named: "stack_select")
            labelStack1.textColor = UIColor(named: "border_color")
            stack2View.backgroundColor = .white
            labelStack2.textColor = UIColor(named: "text_not_select")
        } else {
            stack2View.backgroundColor = UIColor(named: "stack_select")
            labelStack2.textColor = UIColor(named: "border_color")
            stack1View.backgroundColor = .white
            labelStack1.textColor = UIColor(named: "text_not_select")
        }
    }
    
    // 특정 날짜에 이미지 세팅
    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
        let imageDateFormatter = DateFormatter()
        imageDateFormatter.dateFormat = "yyyyMMdd"
        let dateStr = imageDateFormatter.string(from: date)
        var calenderDateList = Array<String>()
        var calenderUrlList = Array<String>()

        //날짜에 인덱싱 url
        var listIndex = 0
        
        if(calenderBeanList.count != 0) {
            for i in 0 ... calenderBeanList.count - 1 {
                let day = "\(currentPageYear)\(currentPageMonth)\(calenderBeanList[i].day)"
                calenderDateList.append(day)
                calenderUrlList.append(calenderBeanList[i].imageURL)
                if(day == dateStr) {
                    listIndex = i
                }
            }
        }
                
        return calenderDateList.contains(dateStr) ? resizeImage(image: getImageFromUrl(urlString: calenderUrlList[listIndex])) : resizeImage(image: UIImage(named: "background_cd_white")!)
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
    
 
    //해당 날짜로 들어가는 이벤트 위치.
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
            print(date)
            moveDetail(date: date)
            return false
        }
    
    //이미지 리사이징이랑 둥글게
    func resizeImage(image : UIImage) -> UIImage?{

        var customImage = image
        var cellWidth = 0
        
        //시디 이미지의 라인컬러.
        let cdLineColor = UIColor.gray
        //시디 크기.
        let scale = 1.15
        
        if(width > height) {
            cellWidth = Int(Double(height)*scale)
        } else {
            cellWidth = Int(Double(width)*scale) - Int(calenderView.appearance.titleFont.pointSize)
        }
        
        customImage = customImage.resizeImage(width: cellWidth, height: cellWidth)!.roundedImageWithBorder(width: CGFloat(1), color: cdLineColor)!
        
        let centerImage = UIImage(named: "background_cd_white")!.roundedImageWithBorder(width: CGFloat(4), color: cdLineColor)!
        
       
        let correctionInt = 4
        let centerRadius = 10
        let redrawImage = customImage.addImage(byDrawingImage: centerImage, inRect: CGRect(x: cellWidth/2-correctionInt, y: cellWidth/2-correctionInt, width: centerRadius, height: centerRadius))
        
        return redrawImage
    }
    
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at position: FSCalendarMonthPosition) {
        
        if(width == 0) {
            width = Int(cell.fs_width)
        }
        
        if(height == 0) {
            height = Int(cell.fs_height)
        }
        
        let fontHeight = calenderView.appearance.titleFont.pointSize
        
        //사진 이미지의 위치
        calenderView.appearance.imageOffset = CGPoint(x: 0, y: ((height)/2) - Int(fontHeight)+1)

    }
    
    func moveMonth(next: Bool) {
        var dateComponents = DateComponents()
        dateComponents.month = next ? 1 : -1
        self.currentPage = calendar.date(byAdding: dateComponents, to: self.currentPage)!
        self.calenderView.setCurrentPage(self.currentPage, animated: true)
        
    }
    
    func moveDetail(date : Date) {
        let storyboard = UIStoryboard.init(name: "Detail", bundle: nil)
        
        guard let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {return}
        
        let dateArray = date.formatted().components(separatedBy: ["/", " "])
        DLogUtil.debug(tag: #file, content: "date year ? \(dateArray[1])")
        
        //format = 11/20/2022
        detailViewController.year = dateArray[2]
        detailViewController.month = dateArray[0]
        
        if(1 <= Int(dateArray[1])! && 9 >= Int(dateArray[1])!) {
            detailViewController.day = "0\(dateArray[1])"
        } else {
            detailViewController.day = dateArray[1]
        }
        
        detailViewController.calenderState = self.calenderState
        detailViewController.modalPresentationStyle = .fullScreen
        self.present(detailViewController, animated: true, completion: nil)
    }
    
    private func setListener() {
        imageViewBack.setOnTouchListener(self, action: #selector(onBack))
        imageViewNext.setOnTouchListener(self, action: #selector(onNext))
        stack1View.setOnTouchListener(self, action: #selector(onStack1Click))
        stack2View.setOnTouchListener(self, action: #selector(onStack2Click))
    }
    
    @objc private func onBack() {
        moveMonth(next: false)
        updateHeader()
    }
    
    @objc private func onNext() {
        moveMonth(next: true)
        updateHeader()
    }
    
    @objc private func onStack1Click() {
        if(calenderState == "moment") {
            return
        } else {
            calenderState = "moment"
            updateView()
            updateHeader()
        }
    }
    
    @objc private func onStack2Click() {
        if(calenderState == "today") {
            return
        } else {
            calenderState = "today"
            updateView()
            updateHeader()
        }
    }
    
}
