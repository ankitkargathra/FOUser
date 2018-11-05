//
//  RatePopupVC.swift
//  FoodOrder
//
//  Created by Rohan on 04/11/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class RatePopupVC: BaseVC {

    
    @IBOutlet var bottomConstrint: NSLayoutConstraint!
    @IBOutlet var btnRates: [UIButton]!
    
    @IBOutlet var viewRate: UIView!
    @IBOutlet var viewSize: UIView!
    
    var isRate: Bool = true
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.clear
        super.viewDidLoad()
        self.setViewHidden(rate: !isRate)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3, animations: {
            self.view.backgroundColor = UIColor.setBlack(alpha: 0.4)
        }) { (completion) in
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    @IBAction func btnDismissPress() {
        self.bottomConstrint.constant = -getProportionalHeight(height: 459)
        UIView.animate(withDuration: 0.3, animations: {
            self.view.backgroundColor = UIColor.setBlack(alpha: 0.0)
            self.view.layoutIfNeeded()
        }) { (completion) in
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func btnRatePress(sender: UIButton) {
        let stackView = sender.superview as! UIStackView
        
        for viewObj in stackView.arrangedSubviews {
            
            if viewObj.isKind(of: UIButton.classForCoder()) {
                
                let button = viewObj as! UIButton
                
                if button.tag <= sender.tag {
                    button.isSelected = true
                } else {
                    button.isSelected = false
                }
            }
        }
        
    }
    
    func setViewHidden(rate: Bool) {
        self.viewRate.isHidden = rate
        self.viewSize.isHidden = !rate
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
