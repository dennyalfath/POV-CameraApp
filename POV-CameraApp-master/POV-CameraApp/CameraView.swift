//
//  ViewController.swift
//  POV
//
//  Created by Hendy Rusnanto on 12/05/20.
//  Copyright © 2020 HR. All rights reserved.
//

import UIKit

class CameraView: UIViewController {
    
    
  
    
    

    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var CameraButton: UIButton!
    @IBOutlet weak var Gallery: UIButton!
    @IBOutlet weak var switchCamera: UIButton!
    @IBOutlet weak var flash: UIButton!
    @IBOutlet weak var grid: UIButton!
    @IBOutlet weak var ratio: UIButton!
    @IBOutlet weak var info: UIButton!
    @IBOutlet weak var zoom: UIButton!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        ViewOpacity()
        absoluteComponentStyle()
    }
}

