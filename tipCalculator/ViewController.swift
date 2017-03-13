//
//  ViewController.swift
//  tipCalculator
//
//  Created by kathy yin on 3/12/17.
//  Copyright © 2017 kathy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let index = defaults.integer(forKey: "defaultIndex")
        tipControl.selectedSegmentIndex = index
        calculateTip()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    @IBAction func onTapSender(_ sender: Any) {
        view.endEditing(true)
    }


    @IBAction func calculateTip() {
         let tipPercantage = [0.18, 0.20, 0.25]
         let bill = Double(billField.text!) ?? 0
         let tip = bill * tipPercantage[tipControl.selectedSegmentIndex]
         let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

