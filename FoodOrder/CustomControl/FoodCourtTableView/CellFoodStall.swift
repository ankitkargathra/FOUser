//
//  CellVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellFoodStall: BaseTableViewCell {

    @IBOutlet weak var imgStore: RoundImageView!
    @IBOutlet weak var lblStoreName: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var lblStoreCategories: LabelAveNirNextProGrayMedium!
    @IBOutlet weak var lblWaiting: LabelAveNirNextProBoldWhite!
    @IBOutlet weak var lblStar: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var lblSelfService: LabelAveNirNextProBlackGreen!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setStoreData(store: Restaurants) {
        
        self.lblStoreName.text = checkNULL(str: store.restaurant_name)
        self.lblStoreCategories.text = checkNULL(str: store.categoriesString)
        self.lblWaiting.text = checkNULL(str: store.waiting)
        self.lblStar.text = checkNULL(str: store.ratings)
        self.lblSelfService.isHidden = !store.self_service!
        if let img = store.item_picture {
            self.imgStore.kf.setImage(with: URL.init(string: img))
        }
        
    }
    

}
