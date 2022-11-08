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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()

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
        tableView.register(UINib(nibName: "EmotionCell", bundle: nil), forCellReuseIdentifier: "EmotionCell")
        tableView.register(UINib(nibName: "SaveCell", bundle: nil), forCellReuseIdentifier: "SaveCell")
    }
}

extension RecordModalController: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return tableView
    }
}

extension RecordModalController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as? TitleCell else { return UITableViewCell() }
            cell.titleLabel.text = "오늘의 추억 기록하기"
            cell.titleIcon.image = UIImage(named: "pen_blue")
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SeasonCell", for: indexPath) as? SeasonCell else { return UITableViewCell() }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DateCell", for: indexPath) as? DateCell else { return UITableViewCell() }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell else { return UITableViewCell() }
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell else { return UITableViewCell() }
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath) as? PlaceCell else { return UITableViewCell() }
            return cell
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "EmotionCell", for: indexPath) as? EmotionCell else { return UITableViewCell() }
            return cell
        case 7:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SaveCell", for: indexPath) as? SaveCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}
