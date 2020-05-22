//
//  CalculationManager.swift
//  Calculator
//
//  Created by Anjali on 5/22/20.
//  Copyright © 2020 Anjali. All rights reserved.
//

import Foundation
 

struct CalculationManager {
    
    private var number : Double?
    
    private var intermediateCalculation : (n1 : Double, operation : String)?
    
    mutating func setNumber(_ number : Double) {
        self.number = number
    }
    
    
    mutating func calculate(with operators : String) -> Double? {
        if let n = number {
            switch operators {
            case "AC":
                return 0
                
            case "+/-":
                return n * -1
                
            case "%":
                return n / 100
                
            case "=":
               return performTwoNumberCalculation(n2 : n)
            
            default:
                intermediateCalculation = (n1 : n, operation : operators)
            }
        }
        return nil
    }
    
    
    private func performTwoNumberCalculation(n2 : Double) -> Double? {
        
        if let operators = intermediateCalculation?.operation, let n1 = intermediateCalculation?.n1 {
            switch operators {
            case "+":
              return  n1 + n2
                
            case "-":
                return n1 - n2
                
            case "×":
                return n1 * n2
            
            case "÷":
                return n1 / n2
                
            default:
               return nil
            }
        }
        return nil
    }
}
