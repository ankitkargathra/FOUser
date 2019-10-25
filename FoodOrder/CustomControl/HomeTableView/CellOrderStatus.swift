//
//  CellVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellOrderStatus: UITableViewCell {

    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var imgLogo: RoundImageView!
    @IBOutlet weak var lblNameProduct: LabelAveNirNextProBoldWhite!
    @IBOutlet weak var lblOrderTime: LabelAveNirNextProMediumWhite!
    @IBOutlet weak var lblOrderStatus: LabelAveNirNextProBoldWhite!
    @IBOutlet weak var lblOrderNumber: UILabel!
    @IBOutlet weak var btnViewDetails: UIButton!
    @IBOutlet weak var imgHot_pot: UIImageView!
    @IBOutlet weak var imgChef: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrRecentScan = [RecentScan]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName:"CellRecentScan", bundle: nil), forCellWithReuseIdentifier: "cellrecent")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellDataOrderPreparing(isPreparing: Bool, OS:DSCurrentOrder) {
        
        self.lblNameProduct.text = OS.restaurantName
        self.lblOrderTime.text = Date.convertDate(date: OS.orderDate)
        self.lblOrderNumber.text = OS.orderQueue
        if let img = OS.picture {
            self.imgLogo.kf.setImage(with: URL.init(string: img))
        }
        
        viewBg.backgroundColor = isPreparing ? UIColor.colorOrange() : UIColor.setOrderGreenColor()
        imgLogo.backgroundColor = isPreparing ? UIColor.customWhiteColor() : UIColor.setBlueFbColor()
        lblOrderStatus.text = isPreparing ? "Your order is being \nprepaired" : "Your order is ready \nto serve"
        
        if isPreparing {
            imgChef.isHidden = true
            imgHot_pot.isHidden = false
        } else {
            imgChef.isHidden = false
            imgHot_pot.isHidden = true
        }
    }
}

extension CellOrderStatus:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrRecentScan.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellrecent", for: indexPath)  as! CellRecentScan
        cell.cellData(RS: self.arrRecentScan[indexPath.row], Index:indexPath.row)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 0.54*self.frame.size.width, height: 0.67*self.frame.size.height)
    }
}
