//
//  PlaceCell.swift
//  Bring
//
//  Created by 오예진 on 2022/11/08.
//

import UIKit
import Foundation


class PlaceCell: UITableViewCell {

    public weak var delegate: PlaceCellDelegate?
    
    @IBOutlet weak var checkMark: UIImageView!
    @IBOutlet weak var mapBtn: UIButton!
    
    @IBOutlet var nickNameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    
    var record: Record?
    var place: Place?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nickNameLabel.alpha = 0
        addressLabel.alpha = 0
        
        print("---------------=======", place)
    }
    


    @IBAction func btnTapped(_ sender: Any) {

        let storyboard = UIStoryboard(name: "Map", bundle: nil)
        let mapStoryboard = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        
        mapStoryboard.record = record
        
        if let vc = self.next(ofType: UIViewController.self) {
            vc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            vc.modalPresentationStyle = .fullScreen
            vc.present(mapStoryboard, animated: true, completion: nil)
            
            nickNameLabel.alpha = 1
            addressLabel.alpha = 1
            mapBtn.setTitle("", for: .normal)
            checkMark.tintColor = UIColor(named: "prevMain")
        }
        

        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
