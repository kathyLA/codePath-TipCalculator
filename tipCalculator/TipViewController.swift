//
//  ViewController.swift
//  tipCalculator
//
//  Created by kathy yin on 3/12/17.
//  Copyright © 2017 kathy. All rights reserved.
//

import UIKit
import SnapKit
class TipViewController: UIViewController {
    var topContentView: UIStackView = UIStackView()
    var bottomContentView: UIStackView = UIStackView()
    var billHintBackgroundView: UIView = UIView()
    var billHintLabel: UILabel = UILabel()
    var billField: UITextField = UITextField()
    
    var tipControlHintBackgroundView: UIView = UIView()
    var tipControlHintLabel: UILabel = UILabel()
    
    var tipControlBackgroundView: UIView = UIView()
    var tipControl: UISegmentedControl?
    let tipPercentage: [Int] = [5, 10,15,20,25]
    var tipBackgroundView: UIView = UIView()
    var tipContentView: UIStackView = UIStackView()
    var percentageLabel: UILabel = UILabel()
    var buttonStack: UIStackView = UIStackView()
    var addLabel: UILabel = UILabel()
    var tipLabel: UILabel = UILabel()
    
    var totalBackgroundView: UIView = UIView()
    var totalContentView: UIStackView = UIStackView()
    var totalLabel: UILabel = UILabel()
    var equalLabel: UILabel = UILabel()
    let attributes: [String: Any] = [NSFontAttributeName: UIFont(name: "Helvetica-light" , size: 40), NSForegroundColorAttributeName: UIColor.white, NSKernAttributeName: CGFloat(0.5)]

 
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        
        self.view.backgroundColor = Theme.defaultBackgroundColor
        self.navigationController?.navigationBar.barTintColor = Theme.teal700
        self.navigationController?.navigationBar.isTranslucent =  false

        
        self.view.addSubview(self.topContentView)
        
        self.topContentView.axis = .vertical
        self.topContentView.alignment = .leading
        
        self.topContentView.snp.makeConstraints { maker in
            maker.top.leading.trailing.equalToSuperview().inset(20)
        }

        let billHint = "Enter Bill Amount"
        let billHintAttributes: [String: Any] = [NSFontAttributeName: UIFont(name: "Helvetica" , size: 14), NSForegroundColorAttributeName: UIColor.white, NSKernAttributeName: CGFloat(0.5)]

        self.topContentView.addArrangedSubview(self.billHintBackgroundView)

        self.billHintBackgroundView.backgroundColor = .clear
        self.billHintBackgroundView.layer.borderWidth = 1
        self.billHintBackgroundView.layer.borderColor = UIColor.white.cgColor
        
        self.billHintBackgroundView.addSubview(self.billHintLabel)
        self.billHintBackgroundView.layer.cornerRadius = 4
        self.billHintBackgroundView.layer.masksToBounds = true
        self.billHintLabel.snp.makeConstraints { maker in
            maker.edges.equalTo(self.billHintBackgroundView).inset(4)
        }

        self.billHintLabel.setContentHuggingPriority(UILayoutPriorityRequired, for: .horizontal)
        self.billHintLabel.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)
        self.billHintLabel.setContentCompressionResistancePriority(UILayoutPriorityRequired, for: .vertical)
        self.billHintLabel.attributedText = NSAttributedString(string: billHint, attributes: billHintAttributes)
        
        
        self.topContentView.addArrangedSubview(self.billField)
        let billField = "$0"
        let billFieldAttributes: [String: Any] = [NSFontAttributeName: UIFont(name: "Helvetica-light" , size: 60), NSForegroundColorAttributeName: UIColor.white, NSKernAttributeName: CGFloat(0.8)]
        self.billField.defaultTextAttributes = billFieldAttributes
        self.billField.keyboardType = .decimalPad
        self.billField.textAlignment = .right
        self.billField.setContentCompressionResistancePriority(UILayoutPriorityRequired, for: .vertical)
        self.billField.attributedPlaceholder = NSAttributedString(string: billField, attributes: billFieldAttributes)
        self.billField.snp.makeConstraints { maker in
            maker.width.equalToSuperview()
        }
     
        
        self.tipControlHintBackgroundView.layer.borderColor = UIColor.white.cgColor
        self.tipControlHintBackgroundView.layer.borderWidth = 1
        self.tipControlHintBackgroundView.layer.cornerRadius = 4
        self.tipControlHintBackgroundView.layer.masksToBounds = true
        
        self.topContentView.addArrangedSubview(self.tipControlHintBackgroundView)
         
        let tipHint = "Select Tip Percentage by Satisfaction"
        let tipHintAttributes: [String: Any] = [NSFontAttributeName: UIFont(name: "Helvetica" , size: 14), NSForegroundColorAttributeName: UIColor.white, NSKernAttributeName: CGFloat(0.5)]
        self.tipControlHintLabel.attributedText = NSAttributedString(string: tipHint, attributes: tipHintAttributes)
        
        self.tipControlHintBackgroundView.addSubview(self.tipControlHintLabel)
        self.tipControlHintLabel.setContentHuggingPriority(UILayoutPriorityRequired, for: .horizontal)
        self.tipControlHintLabel.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)

        self.tipControlHintLabel.snp.makeConstraints { maker in
            maker.edges.equalTo(self.tipControlHintBackgroundView).inset(4)
        }
        
        self.topContentView.addArrangedSubview(self.tipControlBackgroundView)
        //let index = self.tipControl?.selectedSegmentIndex ?? 0
        //self.tipControl?.selectedSegmentIndex = index
        
        let items = ["","", "","",""]
        self.tipControl = UISegmentedControl(items: items)
        self.tipControl?.setImage( UIImage(named: "ic_sentiment_very_dissatisfied" ), forSegmentAt: 0)
        self.tipControl?.setImage( UIImage(named: "ic_sentiment_dissatisfied"), forSegmentAt: 1)
        self.tipControl?.setImage( UIImage(named: "ic_sentiment_neutral"), forSegmentAt: 2)
        self.tipControl?.setImage( UIImage(named: "ic_sentiment_satisfied"), forSegmentAt: 3)
        self.tipControl?.setImage( UIImage(named: "ic_sentiment_very_satisfied"), forSegmentAt: 4)
        self.tipControlBackgroundView.addSubview(self.tipControl!)
        self.tipControl?.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)
        
        self.tipControlBackgroundView.snp.makeConstraints { maker in
            maker.width.equalToSuperview()
        }
        
        self.tipControl?.snp.makeConstraints { maker in
             maker.top.bottom.equalTo(self.tipControlBackgroundView).inset(20)
             maker.left.right.equalToSuperview()
        }
        
        self.view.addSubview(self.bottomContentView)
        self.bottomContentView.snp.makeConstraints { maker in
            maker.leading.width.equalToSuperview()
            maker.top.equalTo(self.topContentView.snp.bottom)
            //maker.bottom.height.equalTo(20).priority(200)
        }
        
        self.bottomContentView.addArrangedSubview(self.tipBackgroundView)
        self.tipContentView.axis = .horizontal
        self.tipContentView.distribution = .fill
        self.tipContentView.alignment = .center
        self.tipBackgroundView.addSubview(self.tipContentView)
        
        self.tipBackgroundView.backgroundColor = Theme.blueA200

        let add = "+"
        let tip = "$0.0"
        let percent = "%"
    
        self.addLabel.attributedText = NSAttributedString(string: add, attributes: attributes)
        self.percentageLabel.attributedText = NSAttributedString(string: percent, attributes: attributes)
        
        self.tipLabel.attributedText = NSAttributedString(string: tip, attributes: attributes)
        self.tipLabel.textAlignment = .right
        self.percentageLabel.setContentHuggingPriority(UILayoutPriorityRequired, for: .horizontal)
        //self.percentageLabel.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)
        self.addLabel.setContentHuggingPriority(UILayoutPriorityRequired, for: .horizontal)
        //self.addLabel.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)
        self.addLabel.setContentCompressionResistancePriority(UILayoutPriorityRequired, for: .horizontal)
        //self.addLabel.setContentCompressionResistancePriority(UILayoutPriorityRequired, for: .vertical)
        self.tipContentView.addArrangedSubview(addLabel)
        self.tipContentView.addArrangedSubview(percentageLabel)
        self.tipContentView.addArrangedSubview(tipLabel)
        self.tipLabel.setContentHuggingPriority(UILayoutPriorityDefaultLow, for: .horizontal)
        //self.tipLabel.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)
        self.tipBackgroundView.snp.makeConstraints { maker in
            maker.width.equalToSuperview()
        }
        
        self.tipContentView.snp.makeConstraints { maker in
            maker.left.right.equalTo(self.tipBackgroundView).inset(20)
            maker.top.bottom.equalTo(self.tipBackgroundView).inset(10)
        }

        self.bottomContentView.axis = .vertical
        self.bottomContentView.alignment = .leading
        self.bottomContentView.addArrangedSubview(self.totalBackgroundView)
       
        self.totalBackgroundView.snp.makeConstraints { maker in
            maker.width.equalToSuperview()
        }
        
        self.totalBackgroundView.backgroundColor = Theme.blueA400
        
        self.totalContentView.axis = .horizontal
        self.totalContentView.distribution = .fill
        self.totalContentView.alignment = .center
        self.totalBackgroundView.addSubview(self.totalContentView)

        let equal = "="
        let total = "$0.0"
        self.totalLabel.attributedText = NSAttributedString(string: total, attributes: attributes)
        self.totalLabel.setContentHuggingPriority(UILayoutPriorityDefaultLow, for: .horizontal)
        self.totalLabel.textAlignment = .right
        self.equalLabel.attributedText = NSAttributedString(string: equal, attributes: attributes)
        self.equalLabel.setContentHuggingPriority(UILayoutPriorityRequired, for: .horizontal)
        self.equalLabel.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)
        self.equalLabel.setContentCompressionResistancePriority(UILayoutPriorityRequired, for: .horizontal)
    
        self.totalContentView.addArrangedSubview(self.equalLabel)
        self.totalContentView.addArrangedSubview(self.totalLabel)
        
        self.totalContentView.snp.makeConstraints { maker in
            maker.left.right.equalTo(self.totalBackgroundView).inset(20)
            maker.top.bottom.equalTo(self.totalBackgroundView).inset(10)
        }
        
        self.tipControl?.addTarget(self, action: #selector(calculateTip), for: .valueChanged)
        self.billField.addTarget(self, action: #selector(calculateTip), for: .editingChanged)
    }

    //View life cycle
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
        super.viewWillAppear(animated)
        self.billField.becomeFirstResponder()
        let defaults = UserDefaults.standard
        let index = defaults.integer(forKey: "defaultIndex")
        tipControl?.selectedSegmentIndex = index
        calculateTip()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func onTapSender(_ sender: Any) {
        view.endEditing(true)
    }

    func calculateTip() {
      let bill = Double(billField.text!) ?? 0
      let percentage = tipPercentage[(tipControl?.selectedSegmentIndex)!]
      let tip = bill * Double(percentage)/100.0
      let total = bill + tip
      let tipStr = String(format: "$%.2f", tip)
      let totalStr = String(format: "$%.2f", total)
      let percentStr = "\(percentage) %"
      self.tipLabel.attributedText = NSAttributedString(string: tipStr, attributes: attributes)
      self.totalLabel.attributedText = NSAttributedString(string: totalStr, attributes: attributes)
      self.percentageLabel.attributedText = NSAttributedString(string: percentStr, attributes: attributes)
    }
}

