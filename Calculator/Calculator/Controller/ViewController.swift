//
//  ViewController.swift
//  Calculator
//
//  Created by Kedar Mohile on 6/16/20.
//  Copyright © 2020 Arti Karnik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
@IBOutlet weak var displayLabel: UILabel!
private var calculator = Calculate()
private var isFinishedTypingNumber: Bool = true
    
private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
}
// MARK: Button events
@IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
@IBAction func numberButtonPressed(_ sender: UIButton) {

    if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}

