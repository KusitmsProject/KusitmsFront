//
//  HomeViewController.swift
//  Bring
//
//  Created by 오예진 on 2022/11/05.
//

import UIKit

class TodayCDViewController: UIViewController {

    // MARK: - Property
    
    @IBOutlet weak var topBackgroundView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var monthDayLabel: UILabel!
    
    @IBOutlet weak var addImoticonButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        configureConstraints()
    }
    
    // MARK: - UI
    
    private func configureViews() {
        view.layoutIfNeeded()
        
        bottomView.roundCorners(topLeft: 16, topRight: 16)

        saveButton.layer.cornerRadius = 10
        saveButton.layer.masksToBounds = true


        gradient.frame = topBackgroundView.bounds
        gradient.colors = [UIColor(hexString: "BAABDB").cgColor, UIColor(hexString: "ABC3DB").cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        if gradient.superlayer == nil {
            topBackgroundView.layer.insertSublayer(self.gradient, at: 0)
        }
    }
    
    private var gradient = CAGradientLayer()
    
    private func configureConstraints() {
        
    }
}
