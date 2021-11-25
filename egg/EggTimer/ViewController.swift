//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var eggLabel: UILabel!
    let egg = [ "Soft": 3,"Medium": 7,"Hard": 12
    ]
    var totalTime = 0
    var secondPassed = 0
    var timer = Timer()
    
    
    @IBAction func eggButton(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = egg[hardness]!
        
        progressBar.progress = 0.0
        secondPassed = 0
        eggLabel.text = hardness // alur akhir
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target:self, selector: #selector(time), userInfo: nil, repeats: true)
    }
    
    @objc func time(){
        if secondPassed < totalTime{
            secondPassed += 1
            progressBar.progress = Float(secondPassed) / Float(totalTime)
        }else{
            timer.invalidate()
            eggLabel.text = "Done"
        }
    }
}
