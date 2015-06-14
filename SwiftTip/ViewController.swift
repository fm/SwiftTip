//
//  ViewController.swift
//  SwiftTip
//
//  Created by Faisal Misle  on 5/9/15.
//  Copyright (c) 2015 Faisal Misle. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var numberOfGuestsSegmentedControl: UISegmentedControl!
    @IBOutlet weak var tipRateSegmentedControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var eachPaysLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    @IBAction func guestTapped(sender: AnyObject) {
        // hides keyboard when numberOfGuestsSegmentedControl is tapped
        billTextField.resignFirstResponder()
    
    @IBAction func calculateTapped(sender: AnyObject) {
        // This code is run each time the Calculate Button is tapped
        
        var userInput = billTextField.text as NSString //Get Bill
        var totalBill: Float = userInput.floatValue //Convert String to Float
        
        var index: Int = tipRateSegmentedControl.selectedSegmentIndex
        var tipRate: Float = 0.15 // set tip rate to first index
        
        if index == 0 {
            tipRate = 0.15
        } else if index == 1 {
            tipRate = 0.18
        } else {
            tipRate = 0.20
        }
        
        
        var tip: Float = totalBill * tipRate // calculate the tip
        tipLabel.text = "Tip Amount: $\(tip)"
        
        var total: Float = totalBill + tip // add tip to total
        totalLabel.text = "Total Amount: $\(total)"
        
        var guestIndex: Int = numberOfGuestsSegmentedControl.selectedSegmentIndex
        
        
        switch guestIndex {
            
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        default:
            break
        
        }
        
        
        eachPaysLabel.text = "Each Guest Pays: $\(guestTotal)"
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.calculateButton.layer.cornerRadius = 7
        self.calculateButton.layer.masksToBounds = true
        self.calculateButton.layer.borderWidth = 1
        self.calculateButton.layer.borderColor = UIColor.blueColor().CGColor
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

