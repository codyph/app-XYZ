//
//  ViewController.swift
//  app-XYZ
//
//  Created by Bailey Aldridge on 14/1/19.
//  Copyright © 2019 Cody Philipp. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var xLbl: UILabel!
    @IBOutlet weak var yLbl: UILabel!
    @IBOutlet weak var zLbl: UILabel!
    
    // Variables
    var motionManager: CMMotionManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateLabels)
    }

    func updateLabels(data: CMAccelerometerData?, error: Error?) {
        guard let accelerometerData = data else { return }
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        
        let x = formatter.string(for: (accelerometerData.acceleration.x * 9.8))!
        let y = formatter.string(for: (accelerometerData.acceleration.y * 9.8))!
        let z = formatter.string(for: (accelerometerData.acceleration.z * 9.8))!
        
        xLbl.text = "X: \(x)"
        yLbl.text = "Y: \(y)"
        zLbl.text = "Z: \(z)"
        
        
    }
 
}

