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
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishTypingNumber = true
    private var calculateManager = CalculationManager()
  
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
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishTypingNumber = true
        if let operation = sender.currentTitle {
            calculateManager.setNumber(displayValue)
            
            if let ans = calculateManager.calculate(with: operation) {
                displayValue = ans
            }
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



