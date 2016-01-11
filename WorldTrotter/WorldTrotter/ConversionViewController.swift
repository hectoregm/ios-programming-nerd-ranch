//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Hector Enrique Gomez Morales on 1/10/16.
//  Copyright © 2016 Hector Enrique Gomez Morales. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    @IBOutlet var celsiusLabel: UILabel!
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        celsiusLabel.text = textField.text
    }
}
