//
//  CellMainHeader.swift
//  FoodOrder
//
//  Created by Rohan on 30/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit
import Kingfisher

class CellMainHeader: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {

    @IBOutlet var brandView: UIView!
    @IBOutlet var dotedLine: UIView!
    
    @IBOutlet weak var lblReasturantName: LabelAveNirNextProBoldWhite!
    @IBOutlet weak var lblRate: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var lblCategories: LabelAveNirNextProGrayMedium!
    @IBOutlet weak var lblHeader: LabelAveNirNextProBlackDemi!
    var banner = [Banner]()
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        brandView.clipsToBounds = false
        brandView.layer.shadowColor = UIColor.black.cgColor
        brandView.layer.shadowOpacity = 0.7
        brandView.layer.shadowOffset = CGSize.zero
        brandView.layer.shadowRadius = 8.6
        //brandView.layer.shadowPath = UIBezierPath(roundedRect: brandView.bounds, cornerRadius: 8.6).cgPath
        brandView.layer.cornerRadius = 8.6
        dotedLine.addDashedBorder(points: [CGPoint(x: 0, y: dotedLine.frame.size.height / 2),
                                           CGPoint(x: self.frame.width, y: dotedLine.frame.size.height / 2)])
        dotedLine.clipsToBounds = true
    }
    
    
    func setBannerData(baner: [Banner]) {
        self.banner = baner
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banner.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let bnr = banner[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let imgView = UIImageView()
        if bnr.picture != nil && bnr.picture.count != 0 {
            imgView.kf.setImage(with: URL.init(string: bnr.picture))
        }
        cell.backgroundView = imgView
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //let cellWidth   = ((self.width - (marginVertical * 4) - marginLeftRight - marginLeftRight)/3.8) - 1
        //        let cellWidth   =  self.frame.height
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.height)
    }
}
