//
//  DiagonalRuleVC.swift
//  POV-CameraApp
//
//  Created by Denny Alfath on 28/05/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

class DiagonalRuleVC: UIViewController {
    
    @IBOutlet weak var defVC: UIView!
    @IBOutlet weak var howVC: UIView!
    @IBOutlet weak var exampleVC: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        setupSegmentedControl()
    }
    
    private func setupSegmentedControl() {
        segmentedControl.selectedSegmentIndex = 0
    }
    
    @IBAction func didTapSegment(_ sender: Any) {
        updateView()
    }
    
    private func updateView() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            UIView.animate(withDuration: 0.5, animations: {
                self.defVC.alpha = 1
                self.howVC.alpha = 0
                self.exampleVC.alpha = 0
            })
        case 1:
            UIView.animate(withDuration: 0.5, animations: {
                self.defVC.alpha = 0
                self.howVC.alpha = 1
                self.exampleVC.alpha = 0
            })
        case 2:
            UIView.animate(withDuration: 0.5, animations: {
                self.defVC.alpha = 0
                self.howVC.alpha = 0
                self.exampleVC.alpha = 1
            })
        default: break
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
