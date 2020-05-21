//
//  ViewController.swift
//  Calculator
//
//  Created by Anjali on 5/21/20.
//  Copyright © 2020 Anjali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var num = ""
    var isFinishTypingNumber = true
    
    @IBOutlet weak var displayLabel: UILabel!
     
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishTypingNumber = false
        if let sign = sender.currentTitle {
            displayLabel.text = sign
            num = ""
        }
         isFinishTypingNumber = true
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numberValue = sender.currentTitle {
            if isFinishTypingNumber {
                num  = num + numberValue
                displayLabel.text = num
                }
            }
            
    }

}



