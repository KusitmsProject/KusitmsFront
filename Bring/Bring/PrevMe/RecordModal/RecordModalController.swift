//
//  RecordViewController.swift
//  Bring
//
//  Created by 오예진 on 2022/11/08.
//

import UIKit
import PanModal

class RecordModalController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    
    var record: Record?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        if let vc = self.presentingViewController as? TodayMeViewController {
            vc.record = record
        }
        super.dismiss(animated: flag, completion: completion)
    }
     
    func setUpTable() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "TitleCell", bundle: nil), forCellReuseIdentifier: "TitleCell")
        tableView.register(UINib(nibName: "SeasonCell", bundle: nil), forCellReuseIdentifier: "SeasonCell")
        tableView.register(UINib(nibName: "DateCell", bundle: nil), forCellReuseIdentifier: "DateCell")
        tableView.register(UINib(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: "WeatherCell")
        tableView.register(UINib(nibName: "FriendCell", bundle: nil), forCellReuseIdentifier: "FriendCell")
        tableView.register(UINib(nibName: "PlaceCell", bundle: nil), forCellReuseIdentifier: "PlaceCell")
        tableView.register(UINib(nibName: "PictureCell", bundle: nil), forCellReuseIdentifier: "PictureCell")
        tableView.register(UINib(nibName: "SaveCell", bundle: nil), forCellReuseIdentifier: "SaveCell")
        tableView.register(UINib(nibName: "TextCell", bundle: nil), forCellReuseIdentifier: "TextCell")
    }
}

extension RecordModalController: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return tableView
    }
}

extension RecordModalController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as? TitleCell else { return UITableViewCell() }
            cell.titleLabel.text = "그때의 추억 기록하기"
            cell.titleLabel.textColor = UIColor(named: "prevMain")
            cell.titleIcon.image = UIImage(named: "pen")
            cell.selectionStyle = .none
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DateCell", for: indexPath) as? DateCell else { return UITableViewCell() }
            cell.record = record
            cell.selectionStyle = .none
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell else { return UITableViewCell() }
            cell.record = record
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SeasonCell", for: indexPath) as? SeasonCell else { return UITableViewCell() }
            cell.record = record
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell else { return UITableViewCell() }
            cell.record = record
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath) as? PlaceCell else { return UITableViewCell() }
            cell.record = record
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell", for: indexPath) as? PictureCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        case 7:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as? TextCell else { return UITableViewCell() }
            cell.record = record
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
}

extension RecordModalController: WeatherCellDelegate{
    func didTapSunnyButton() {
        let weather = "SUNNY"
        record?.weather = [weather]
    }
    
    func didTapSnowButton() {
        let weather = "SNOW"
        record?.weather = [weather]
    }
    
    func didTapWindyButton() {
        let weather = "CLOUD"
        record?.weather = [weather]
    }
    
    func didTapRainyButton() {
        let weather = "RAIN"
        record?.weather = [weather]
    }
    
    func didTapHotButton() {
        let weather = "HOT"
        record?.weather = [weather]
    }
    
    func didTapColdButton() {
        let weather = "COLD"
        record?.weather = [weather]
    }
}

extension RecordModalController: SeasonCellDelegate{
    func didTapSpringBtn() {
        record?.season = "SPRING"
    }
    func didTapSummerBtn() {
        record?.season = "SUMMER"
    }
    func didTapFallBtn() {
        record?.season = "FALL"
    }
    func didTapWinterBtn() {
        record?.season = "WINTER"
    }
}

extension RecordModalController: FriendCellDelegate{
    func didInsertText(_ inText: String) {
        record?.friendList = [inText]
    }
}

extension RecordModalController: PlaceCellDelegate{
    
    func insertPlace(_ text: String) {
        record?.place = text
    }
    
    func insertPlaceNickname(_ text: String) {
        record?.placeNickname = text
    }
}

extension RecordModalController: TextCellDelegate{
    func didInsertRecords(_ inText: String) {
        record?.record = inText
        
        print("------>", record)
    }
}
