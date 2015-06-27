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
    
    @IBAction func calculateTapped(sender: AnyObject) {
        // This code is run each time the Calculate Button is tapped
        
        
        var userInput = billTextField.text as NSString // Get Bill
        var totalBill: Double = floor(userInput.doubleValue) // Convert String to Float
        
        var index: Int = tipRateSegmentedControl.selectedSegmentIndex
        var tipRate: Double = 0.00 // set tip rate to first index
        
        // set tip rates according to segment control postion
        if index == 0 {
            tipRate = 0.00
        } else if index == 1 {
            tipRate = 0.15
        } else if index == 2 {
            tipRate = 0.18
        } else {
            tipRate = 0.20
        }
        
        
        var tip: Double = totalBill * tipRate // calculate the tip
        let roundedTip = Double(round(100*tip)/100) // rounding the tip
        tipLabel.text = NSString(format: "Tip Amount: $%.2f", roundedTip) as String // Limiting to 2 decimals
        
        var total: Double = totalBill + roundedTip // add tip to total
        var roundedTotal = Double(round(100*total)/100) //rounding the total
        totalLabel.text = NSString(format: "Total Amount: $%.2f", roundedTotal) as String // Limiting to 2 decimals
        
        
        var guestIndex: Int = numberOfGuestsSegmentedControl.selectedSegmentIndex
        var guestNumber: Int = 1 // set number of guests to 1 for default
        
        // set number of guests according to segment control postion
        
        switch guestIndex {
            
        case 0:
                guestNumber = guestIndex + 1
        case 1:
                guestNumber = guestIndex + 1
        case 2:
                guestNumber = guestIndex + 1
        case 3:
                guestNumber = guestIndex + 1
        case 4:
                guestNumber = guestIndex + 1
        case 5:
                guestNumber = guestIndex + 1
        default:
            break
        
        }

        
        // Debugging
        // println(tipRate) // make sure it selects the right tip amount
        // println(guestNumber) // make sure it selects right number of guests
        
        var guestTotal: Double = roundedTotal / Double(guestNumber) // divide bill by # of guests
        eachPaysLabel.text = NSString(format: "Each Guest Pays: $%.2f", guestTotal) as String // Limiting to 2 decimals
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.billTextField.delegate = self

        // calculate button border
        self.calculateButton.layer.cornerRadius = 7
        self.calculateButton.layer.masksToBounds = true
        self.calculateButton.layer.borderWidth = 1
        self.calculateButton.layer.borderColor = UIColor.blueColor().CGColor
          }
    
    
    @IBAction func guestTap(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    @IBAction func tipTapped(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

}