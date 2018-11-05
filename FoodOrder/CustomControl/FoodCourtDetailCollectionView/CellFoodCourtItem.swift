//
//  CellFoodCourtItem.swift
//  FoodOrder
//
//  Created by Rohan on 31/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit
import ValueStepper

class CellFoodCourtItem: UICollectionViewCell {
 
    var sepratorView: UIView!
    @IBOutlet var btnAdd: UIButton!
    
    var blockTableViewDidSelectAtIndexPath:((UIButton)->Void)?
    
    @IBOutlet weak var valueSteper: ValueStepper!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btnAdd.layer.borderWidth = 1
        btnAdd.layer.cornerRadius = 2
        btnAdd.titleLabel?.font = Font.setAveNirNextPro(font: .Medium, size: 13.2)
        btnAdd.layer.borderColor = UIColor.setColor(red: 0, green: 180, blue: 96).cgColor
        
        if sepratorView == nil  {
            sepratorView = UIView.init()
            sepratorView.translatesAutoresizingMaskIntoConstraints = false
            sepratorView.backgroundColor = UIColor.colorGray()
            self.contentView.addSubview(sepratorView)
        }
        
        NSLayoutConstraint.activate([
            self.sepratorView.heightAnchor.constraint(equalToConstant: 0.3),
            self.sepratorView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0),
            self.sepratorView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 18.3),
            self.sepratorView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -18.3)
            ])
        valueSteper.valueLabel.text = "1"
    }
    @IBAction func btnAddPress(_ sender: UIButton) {
        self.btnAdd.isHidden = true
        if(self.blockTableViewDidSelectAtIndexPath != nil){
            self.blockTableViewDidSelectAtIndexPath!(sender)
        }
    }
    
}
