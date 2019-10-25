//
//  CellVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellProductName: UITableViewCell {

    @IBOutlet weak var lblRestaurantName: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var lblRestaurantAddress: LabelAveNirNextProGrayMedium!
    @IBOutlet weak var imgView: RoundImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func CellProductName(PN:OrderDetails){
        self.lblRestaurantName.text = PN.restaurantName
        self.lblRestaurantAddress.text = PN.restaurantAddress
        if let img = PN.picture {
            self.imgView.kf.setImage(with: URL.init(string: img))
        }
    }
}
