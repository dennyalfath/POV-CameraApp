//
//  CameraView+UI.swift
//  POV-CameraApp
//
//  Created by Hendy Rusnanto on 14/05/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import Foundation
import UIKit




extension CameraView {
    
    
    
    
    func ViewOpacity() {
        UIView.animate(withDuration: 7) {
            self.upperView.layer.opacity = 0.5
            self.bottomView.layer.opacity = 0.5
        }
    }
    
    
    
    
    func absoluteComponentStyle() {
        self.CameraButton.layer.opacity = 1
        self.Gallery.layer.opacity = 1
        self.switchCamera.layer.opacity = 1
        self.flash.layer.opacity = 1
        self.grid.layer.opacity = 1
        self.ratio.layer.opacity = 1
        self.info.layer.opacity = 1
        self.zoom.layer.opacity = 1
    }
}
