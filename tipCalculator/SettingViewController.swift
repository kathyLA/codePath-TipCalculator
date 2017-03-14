//
//  SettingViewController.swift
//  tipCalculator
//
//  Created by kathy yin on 3/12/17.
//  Copyright © 2017 kathy. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    var contentView = UIStackView()
    var settingHintLabel = UILabel()
    var settingBackGroundView = UIView()
    var defaultExpectation: UISegmentedControl?

    override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = Theme.defaultBackgroundColor
    self.view.addSubview(contentView)
    contentView.axis = .vertical
    contentView.alignment = .leading
    contentView.snp.makeConstraints { maker in
      maker.leading.top.trailing.equalTo(self.view).inset(20)
    }
        
    settingBackGroundView.layer.borderColor = UIColor.white.cgColor
    settingBackGroundView.layer.borderWidth = 1
    settingBackGroundView.layer.cornerRadius = 4
    settingBackGroundView.layer.masksToBounds = true
    contentView.addArrangedSubview(settingBackGroundView)
    
    let hint = "Select Default Service Expecation"
    let attributes: [String: Any] = [NSFontAttributeName: UIFont(name: "Helvetica" , size: 14), NSForegroundColorAttributeName: UIColor.white, NSKernAttributeName: CGFloat(0.5)]
    settingHintLabel.attributedText = NSAttributedString(string: hint, attributes: attributes)
    
    settingBackGroundView.addSubview(settingHintLabel)
    settingHintLabel.setContentHuggingPriority(UILayoutPriorityRequired, for: .horizontal)
    settingHintLabel.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)
    
    settingHintLabel.snp.makeConstraints { maker in
        maker.edges.equalTo(settingBackGroundView).inset(4)
    }
        
    let expecationBackgroundView = UIView()
    contentView.addArrangedSubview(expecationBackgroundView)

    let items = ["","", "","",""]
    defaultExpectation = UISegmentedControl(items: items)
    defaultExpectation?.setImage( UIImage(named: "ic_sentiment_very_dissatisfied" ), forSegmentAt: 0)
    defaultExpectation?.setImage( UIImage(named: "ic_sentiment_dissatisfied"), forSegmentAt: 1)
    defaultExpectation?.setImage( UIImage(named: "ic_sentiment_neutral"), forSegmentAt: 2)
    defaultExpectation?.setImage( UIImage(named: "ic_sentiment_satisfied"), forSegmentAt: 3)
    defaultExpectation?.setImage( UIImage(named: "ic_sentiment_very_satisfied"), forSegmentAt: 4)
    expecationBackgroundView.addSubview(defaultExpectation!)
    defaultExpectation?.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)
    
    expecationBackgroundView.snp.makeConstraints { maker in
       maker.width.equalToSuperview()
    }
    
    defaultExpectation?.snp.makeConstraints { maker in
        maker.top.bottom.equalTo(expecationBackgroundView).inset(20)
        maker.left.right.equalToSuperview()
    }
        
    defaultExpectation?.addTarget(self, action: #selector(onSelectDefaultPercantage(_:)), for: .valueChanged)
    
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
    defaultExpectation?.selectedSegmentIndex = index
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   func onSelectDefaultPercantage(_ sender: Any){
        
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
