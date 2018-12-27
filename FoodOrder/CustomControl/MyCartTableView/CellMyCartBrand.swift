//
//  CellVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit
import Kingfisher

class CellMyCartBrand: UITableViewCell {

   
    @IBOutlet weak var viewRated: UIView!
    @IBOutlet weak var lblOrderStatus: LabelAveNirNextProBlackGreen!
   
    
    @IBOutlet weak var imgView: RoundImageView!
    @IBOutlet weak var lblBrandName: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var lblAddress: LabelAveNirNextProGrayMedium!
    @IBOutlet weak var btnTakeAway: UIButton!
    @IBOutlet weak var btnDineIn: UIButton!
    @IBOutlet weak var imgTakeAwayRadio: UIImageView!
    @IBOutlet weak var imgDineInRadio: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblAddress.text = CartData.shared.address!
        lblBrandName.text = CartData.shared.name!
        imgView.kf.setImage(with: URL.init(string: CartData.shared.image!))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellData() {
    
    }
    
    @IBAction func btnTypePress(_ sender: UIButton) {
        
        if sender.tag == 0 {
            imgTakeAwayRadio.image = UIImage.init(named: "radio_on")
            imgDineInRadio.image = UIImage.init(named: "radio_off")
            btnTakeAway.setTitleColor(UIColor.setButtonColor(), for: .normal)
            btnDineIn.setTitleColor(UIColor.colorGray(), for: .normal)
        } else {
            imgTakeAwayRadio.image = UIImage.init(named: "radio_off")
            imgDineInRadio.image = UIImage.init(named: "radio_on")
            btnTakeAway.setTitleColor(UIColor.colorGray(), for: .normal)
            btnDineIn.setTitleColor(UIColor.setButtonColor(), for: .normal)
        }
        
    }
}
