//
//  AnimationViewController.swift
//  Bring
//
//  Created by 오예진 on 2022/11/24.
//

import UIKit
import Gifu

class AnimationViewController: UIViewController {

    @IBOutlet var gifImageView: GIFImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gifImageView.animate(withGIFNamed: "splash")

    }
    
}
