//
//  ViewController.swift
//  Tipper
//
//  Created by zach lee on 12/5/15.
//  Copyright © 2015 zach lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("defaultPercentage")   
        
        
        
        
        totalLabel.text = "$0.00"
        tipLabel.text = "$0.00"
        
      
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("defaultPercentage")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChange(sender: AnyObject)
    {
        
        var tipPercentages = [0.10,0.15,0.18,0.20]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]

        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipPercentage
        var total = tip + billAmount
        
        tipLabel.text = String (format: "$%.2f", tip)
        totalLabel.text = String (format: "$%.2f", total)
        
        
        
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        
        
    }
}

