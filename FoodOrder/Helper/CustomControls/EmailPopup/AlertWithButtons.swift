//
//  AlertWithButtons.swift
//  Trupr
//
//  Created by Aabid Khan on 8/9/18.
//  Copyright © 2018 Aabid Khan. All rights reserved.
//

import UIKit

@objc protocol AlertViewButtonsDelegate
{
    @objc func btnNoTapped()
    @objc func btnYesTapped()
}

class AlertWithButtons: UIView{
    
    @IBOutlet var lblMessage : UILabel!
    @IBOutlet var btnNo : UIButton!
    @IBOutlet var btnYes : UIButton!
    @IBOutlet var btnClose : UIButton!
    @IBOutlet var lblEmail: LabelAveNirNextProBlackMeduim!
    var alertButtonDelegate : AlertViewButtonsDelegate?
    
    //MARK: - Actions -
    
    @IBAction func btnNoTapped(_ sender: Any)
    {
        if let dele = self.alertButtonDelegate{
            dele.btnNoTapped()
        }
    }
    
    @IBAction func btnYesTapped(_ sender: Any)
    {
        if let dele = self.alertButtonDelegate{
            dele.btnYesTapped()
        }
    }
}

class CustomInfoView: UIView{
    
    @IBOutlet var lblMessage : UILabel!
    @IBOutlet var lblTitle : UILabel!
    @IBOutlet var btnOk : UIButton!
    
    @IBOutlet weak var btnOkHeight: NSLayoutConstraint!
    var alertButtonDelegate : AlertViewButtonsDelegate?
    
    //MARK: - Actions -
    @IBAction func btnOkTapped(_ sender: Any)
    {
        if let dele = self.alertButtonDelegate{
            dele.btnNoTapped()
        }
    }
}
