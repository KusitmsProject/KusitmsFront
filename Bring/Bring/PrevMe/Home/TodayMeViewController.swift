//
//  TodayMeViewController.swift
//  Bring
//
//  Created by 오예진 on 2022/11/06.
//

import UIKit
import Foundation
import PanModal

class TodayMeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var selectImage: UIImageView!
    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var recordView: UIView!
    
    let data = ["All I Want for Christmas Is You", "All I Want for Christmas Is You - rock ver.", "All I Want for Christmas Is You - (This year ver.) "]
    
    var filteredData: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        filteredData = []
        
        tableView.register(UINib(nibName: "SearchCell", bundle: nil), forCellReuseIdentifier: "SearchCell")
        
//        searchBar.delegate = self
        searchBar.text = PrevmeData.data.music

    }
    
    // 가사 모달 띄우기
    @IBAction func LyricsButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Lyrics", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LyricsModalController") as! LyricsModalController
        presentPanModal(vc)
    }
    
    
    @IBAction func recordBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Record", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RecordModalController") as! RecordModalController
        presentPanModal(vc)
    }

    
    func setUI() {
        photoView.layer.shadowOffset = CGSize(width: 0, height: 3)
        photoView.layer.shadowOpacity = 0.15
        photoView.layer.borderColor = UIColor(named: "boxLightGray")?.cgColor
        selectImage.layer.cornerRadius = 10
        
        
        recordBtn.layer.borderColor = UIColor(named: "boxLightGray")?.cgColor
        recordBtn.layer.borderWidth = 1
        recordBtn.layer.cornerRadius = 10
        
        searchBar.searchTextField.backgroundColor = UIColor.white
        searchBar.searchTextField.font = UIFont.systemFont(ofSize: 11)


    }

}

extension TodayMeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as? SearchCell else { return UITableViewCell() }
        cell.exLabel.text = filteredData[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let title = filteredData[indexPath.row]
        searchBar.text = title
        filteredData = []
        tableView.reloadData()
        tableView.layer.borderColor = UIColor.clear.cgColor
        return nil
    }
    
    
}
//
//extension TodayMeViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filteredData = []
//
//        if searchText == "" {
//            filteredData = []
//            tableView.layer.borderColor = UIColor.clear.cgColor
//        }
//
//        for word in data {
//            if word.contains(searchText) {
//                filteredData.append(word)
//                tableView.layer.borderColor = UIColor(named: "boxLightGray")?.cgColor
//                tableView.layer.borderWidth = 1
//                tableView.layer.cornerRadius = 10
//
//            }
//        }
//
//        self.tableView.reloadData()
//    }
//}
