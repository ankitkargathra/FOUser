//
//  CellRecommendedItem.swift
//  FoodOrder
//
//  Created by Rohan on 30/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellRecommendedItem: UICollectionViewCell {
    
    @IBOutlet var leftConstraint: NSLayoutConstraint!
    @IBOutlet var rightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblFoodName: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var lblFoodTopings: LabelAveNirNextProGrayMedium!
    @IBOutlet weak var lblFoodPrice: LabelAveNirNextProBlackMeduim!
}
