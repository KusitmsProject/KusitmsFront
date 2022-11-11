//
//  LyricsModalController.swift
//  Bring
//
//  Created by 오예진 on 2022/11/07.
//

import UIKit
import PanModal

class LyricsModalController: UIViewController{
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
    }
    
    func setUpTable() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "TitleCell", bundle: nil), forCellReuseIdentifier: "TitleCell")
        tableView.register(UINib(nibName: "LyricsCell", bundle: nil), forCellReuseIdentifier: "LyricsCell")
        tableView.register(UINib(nibName: "SaveCell", bundle: nil), forCellReuseIdentifier: "SaveCell")

    }
    

}

extension LyricsModalController: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return tableView
    }
}

extension LyricsModalController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as? TitleCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LyricsCell", for: indexPath) as? LyricsCell else { return UITableViewCell() }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SaveCell", for: indexPath) as? SaveCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
        
    }
}
