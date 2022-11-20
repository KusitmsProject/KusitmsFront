//
//  TodayMeViewController.swift
//  Bring
//
//  Created by 오예진 on 2022/11/06.
//

import UIKit
//import Foundation
import PanModal

class TodayMeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var selectImage: UIImageView!
    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var recordView: UIView!
    
    
    @IBOutlet var tiredBtn: UIButton!
    @IBOutlet var crazyBtn: UIButton!
    @IBOutlet var sadBtn: UIButton!
    @IBOutlet var angryBtn: UIButton!
    @IBOutlet var loveBtn: UIButton!
    @IBOutlet var smileBtn: UIButton!
    
    let data = ["All I Want for Christmas Is You", "All I Want for Christmas Is You - rock ver.", "All I Want for Christmas Is You - (This year ver.) "]
    
    var filteredData: [String]!

    var record = Record()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        print(record)
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        filteredData = []
        
        tableView.register(UINib(nibName: "SearchCell", bundle: nil), forCellReuseIdentifier: "SearchCell")

        setButton(smileBtn)
        setButton(crazyBtn)
        setButton(sadBtn)
        setButton(angryBtn)
        setButton(loveBtn)
        setButton(tiredBtn)
        
    }
    
    
    @IBAction func smileTapped(_ sender: Any) {
        setTapped(smileBtn)
        reset(loveBtn)
        reset(angryBtn)
        reset(sadBtn)
        reset(crazyBtn)
        reset(tiredBtn)
    }
    @IBAction func loveTapped(_ sender: Any) {
        setTapped(loveBtn)
        reset(smileBtn)
        reset(angryBtn)
        reset(sadBtn)
        reset(crazyBtn)
        reset(tiredBtn)
    }
    @IBAction func angryTapped(_ sender: Any) {
        setTapped(angryBtn)
        reset(smileBtn)
        reset(loveBtn)
        reset(sadBtn)
        reset(crazyBtn)
        reset(tiredBtn)
    }
    @IBAction func sadTapped(_ sender: Any) {
        setTapped(sadBtn)
        reset(smileBtn)
        reset(loveBtn)
        reset(angryBtn)
        reset(crazyBtn)
        reset(tiredBtn)
    }
    @IBAction func crazyTapped(_ sender: Any) {
        setTapped(crazyBtn)
        reset(smileBtn)
        reset(loveBtn)
        reset(sadBtn)
        reset(angryBtn)
        reset(tiredBtn)
    }
    @IBAction func tiredTapped(_ sender: Any) {
        setTapped(tiredBtn)
        reset(smileBtn)
        reset(loveBtn)
        reset(sadBtn)
        reset(angryBtn)
        reset(crazyBtn)
    }
    
    func reset(_ btn: UIButton) {
        btn.layer.borderColor = UIColor(named: "LyricsBoxBorder")?.cgColor
        btn.backgroundColor = UIColor.white
    }
    
    func setButton(_ btn: UIButton) {
        btn.layer.borderColor = UIColor(named: "LyricsBoxBorder")?.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 10
    }
    
    func setTapped(_ btn: UIButton) {
        btn.layer.borderColor = UIColor(named: "prevMain")?.cgColor
        btn.backgroundColor = UIColor(named: "prevMainSoft")
    }
    
    
    @IBAction func recordBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Record", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RecordModalController") as! RecordModalController
        
        vc.record = record
        
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

extension TodayMeViewController: UISearchBarDelegate {
    internal func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard var track = searchBar.text else { return }
        
        record.update(date: "", emotion: "", season: "", weather: [""], lyrics: "", placeNickname: "", place: "", imageURL: "", record: "", track: track, artist: "", friendList: [""], options: 1)
        
        print(record)
    }
}
