//
//  MapViewController.swift
//  Bring
//
//  Created by 오예진 on 2022/11/16.
//

import UIKit


class MapViewController: UIViewController {
    
    public var placeAdd: String = ""
    public var placeNick: String = ""

    @IBOutlet var subView: UIView!
    
//    var mapView: MTMapView? 
    
    @IBOutlet weak var miniModal: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var nicknameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchBar.delegate = self
        
        UICustom()
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        if (nicknameField.text != nil) {
            placeNick = nicknameField.text ?? ""
            // 모달창 내리기
            self.dismiss(animated: true, completion: nil)
            print(">>>\(placeNick)")
        }
    }

    
    @IBAction func backTapped(_ sender: Any) {
        // 모달창 내리기
        self.dismiss(animated: true, completion: nil)
    }
    
    func UICustom() {
        searchBar.searchTextField.backgroundColor = UIColor.white
        searchBar.searchTextField.font = UIFont.systemFont(ofSize: 11)
        
        miniModal.layer.shadowOffset = CGSize(width: 10, height: 10)
        miniModal.layer.shadowOpacity = 0.2
        miniModal.layer.borderColor = UIColor(named: "boxLightGray")?.cgColor
        miniModal.layer.cornerRadius = 10
    }

}

extension MapViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        placeAdd = searchBar.text ?? ""
        print("--> 검색어: \(placeAdd)")
    }
}
