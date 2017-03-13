//
//  SettingViewController.swift
//  tipCalculator
//
//  Created by kathy yin on 3/12/17.
//  Copyright © 2017 kathy. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var tipSettingControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        //no setting in the user default set it to 0
        var index: Int = (defaults.object(forKey: "defaultIndex") as? Int) ?? -1
        guard index != -1 else {
                index = 0
                let defaults = UserDefaults.standard
                defaults.set(index, forKey: "defaultIndex")
                defaults.synchronize()
                return
         }
        
         settingTipControl.selectedSegmentIndex = index
         // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var settingTipControl: UISegmentedControl!
    
    
    @IBAction func onSelectDefaultPercantage(_ sender: Any){
        
        let select: Int = (sender as? UISegmentedControl)?.selectedSegmentIndex ?? 0
        let defaults = UserDefaults.standard
        defaults.set(select, forKey: "defaultIndex")
        defaults.synchronize()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
