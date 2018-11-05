//
//  FoodCourtCollection.swift
//  FoodOrder
//
//  Created by Rohan on 30/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class FoodCourtCollection: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private let marginVertical:CGFloat =  getProportionalWidth(width: 0)
    private let marginHorizontal:CGFloat = getProportionalWidth(width: 0)
    private let marginLeftRight:CGFloat = getProportionalWidth(width: 0)
    private let marginTop:CGFloat = getProportionalWidth(width: 0)
    private let marginBottom:CGFloat = getProportionalWidth(width: 0)
    
    
    // MARK:- PROPERTIES
    
    var blockCallForscrollViewOffset : ((_ scrollView:UIScrollView) -> Void)?
    
    
    // MARK:- INIT
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.configureViews()
        self.doSetupCollectionView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.contentInset = UIEdgeInsetsMake(marginTop, 0, 0, 0)
    }
    
    
    // MARK:- SETUP COLLECTIONVIEW
    
    func configureViews() {
        
        let flowLayout     = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing  = 15
        flowLayout.minimumLineSpacing       = 20
        flowLayout.scrollDirection = .horizontal
    
        self.collectionViewLayout = flowLayout
        self.contentInset = UIEdgeInsetsMake(marginTop, marginLeftRight, marginBottom, marginLeftRight)
        self.backgroundColor = UIColor.clear
        self.delegate = self
        self.allowsSelection = true
        self.allowsMultipleSelection = false
        self.alwaysBounceVertical = false
        self.alwaysBounceHorizontal = true
        self.isPagingEnabled = false
        
        
    }
    
    func doSetupCollectionView() {
        self.register(UINib(nibName: "CellMainHeader" , bundle: nil), forCellWithReuseIdentifier: "CellMainHeader")
        self.register(UINib(nibName: "CellRecommendedItem" , bundle: nil), forCellWithReuseIdentifier: "CellRecommendedItem")
        self.reloadData()
    }
    
    // MARK:- UICOLLECTIONVIEW DATASOURCE
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.blockCallForscrollViewOffset != nil {
            self.blockCallForscrollViewOffset!(scrollView)
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellRecommendedItem", for: indexPath)  as! CellRecommendedItem
        
        if indexPath.row%2 == 0 {
            cell.backgroundColor = UIColor.gray
        } else {
            cell.backgroundColor = UIColor.yellow
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    //MARK:
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return marginVertical
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return marginHorizontal
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //let cellWidth   = ((self.width - (marginVertical * 4) - marginLeftRight - marginLeftRight)/3.8) - 1
        
        let cellHeight  = self.frame.width / 2
//        let cellWidth   =  self.frame.height
        return CGSize(width: cellHeight, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            
        case UICollectionElementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CellMainHeader", for: indexPath)
            
            headerView.backgroundColor = UIColor.blue
            return headerView
            
        case UICollectionElementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CellMainHeader", for: indexPath)
            
            footerView.backgroundColor = UIColor.green
            return footerView
            
        default:
            return UICollectionReusableView()
            //assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if let headerView = collectionView.visibleSupplementaryViews(ofKind: UICollectionElementKindSectionHeader).first as? CellMainHeader {
            // Layout to get the right dimensions
            headerView.layoutIfNeeded()
            
            // Automagically get the right height
//            let height = headerView.contentView.systemLayoutSizeFitting(UILayoutFittingExpandedSize).height
            
            // return the correct size
            return CGSize(width: collectionView.frame.width, height: 296)
        }
        
        // You need this because this delegate method will run at least
        // once before the header is available for sizing.
        // Returning zero will stop the delegate from trying to get a supplementary view
        return CGSize(width: 1, height: 1)
    }
}
