//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Hector Enrique Gomez Morales on 1/10/16.
//  Copyright © 2016 Hector Enrique Gomez Morales. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9.0)
        } else {
            return nil
        }
    }
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        if let text = textField.text, value = Double(text) {
            fahrenheitValue = value
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
        let replacementTextHasDecimalSeparator = string.rangeOfString(".")
        
        let doubleDecimal = existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil
        
        let decimalDigitSet = NSCharacterSet(charactersInString: "01234567890.")

        var invalidNumber = false
        for character in string.characters {
            if !charset(decimalDigitSet, containsCharacter: character) {
                invalidNumber = true
                break
            }
        }
        
        if  doubleDecimal || invalidNumber {
            return false
        } else {
            return true
        }
    }
    
    func charset(cset: NSCharacterSet, containsCharacter c: Character) -> Bool {
        let s = String(c)
        let result = s.rangeOfCharacterFromSet(cset)
        return result != nil
    }
}
