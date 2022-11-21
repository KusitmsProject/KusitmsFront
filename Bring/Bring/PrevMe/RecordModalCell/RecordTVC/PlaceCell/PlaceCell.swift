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
    
    var record: Record?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    


    @IBAction func btnTapped(_ sender: Any) {

        let storyboard = UIStoryboard(name: "Map", bundle: nil)
        let mapStoryboard = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        
        mapStoryboard.record = record
        
        if let vc = self.next(ofType: UIViewController.self) {
            vc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            vc.modalPresentationStyle = .fullScreen
            vc.present(mapStoryboard, animated: true, completion: nil)
        }
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
