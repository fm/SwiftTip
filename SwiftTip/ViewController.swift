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
    @IBOutlet weak var tipRateSegmentedControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var eachPaysLabel: UILabel!
    @IBOutlet weak var numberOfGuests: UIStepper!
    @IBOutlet weak var guestLabel: UILabel!
    
    func calculateTip() {
        // This code is run each time the Calculate Button is tapped
        
        
        var userInput = billTextField.text as NSString // Get Bill
        var totalBill: Double = userInput.doubleValue // Convert String to Double
        
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
        tipLabel.text = NSString(format: "$%.02f", roundedTip) as String // Limiting to 2 decimals
        
        var total: Double = totalBill + roundedTip // add tip to total
        var roundedTotal = Double(round(100*total)/100) //rounding the total
        totalLabel.text = NSString(format: "$%.02f", roundedTotal) as String // Limiting to 2 decimals
        
        
        var guestNumber = numberOfGuests.value // sets value to stepper
        
        // Debugging
        // println(tipRate) // make sure it selects the right tip amount

        var guestTotal: Double = roundedTotal / Double(guestNumber) // divide bill by # of guests
        eachPaysLabel.text = NSString(format: "$%.02f", guestTotal) as String // Limiting to 2 decimals
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.billTextField.delegate = self

          }

    // "\(numberOfGuests.value)"
    
    @IBAction func numberGuestChanged(sender: AnyObject) {
        guestLabel.text = String(format: "%.00f", numberOfGuests.value) // displaying label as text
        calculateTip()    }
    
    @IBAction func totalChanged(sender: AnyObject) {
        calculateTip()
    }
    
    
    @IBAction func guestTap(sender: AnyObject) {
        self.view.endEditing(true)
        calculateTip()
    }
    
    @IBAction func tipTapped(sender: AnyObject) {
        self.view.endEditing(true)
        calculateTip()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
        calculateTip()
    }

}