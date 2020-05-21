//
//  ViewController.swift
//  Calculator
//
//  Created by Anjali on 5/21/20.
//  Copyright © 2020 Anjali. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    private var isFinishTypingNumber = true
    
    private var displayValue : Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                print("can not convert into number")
                return 0
            }
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
        }
        
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishTypingNumber = true
        
        switch sender.currentTitle! {
        case "AC":
            displayValue = 0
            break
        case "+/-":
            displayValue *= -1
            break
        case "%":
            displayValue /= 100
            break
        default:
            print("oprator not found")
            break
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numberValue = sender.currentTitle {
            
            if isFinishTypingNumber {
                displayLabel.text = numberValue
                isFinishTypingNumber = false
            } else {
                if numberValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numberValue
            }
        }
    }
}



