//
//  FoodCourtDetailVC.swift
//  FoodOrder
//
//  Created by Rohan on 30/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class FoodCourtDetailVC: BaseVC, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var catView: UIView!
    @IBOutlet var fullCatView: UIView!
    @IBOutlet var tblCat: TableViewCategory!
    @IBOutlet var constraintHeight: NSLayoutConstraint!
    @IBOutlet var constraintHeightCartView: NSLayoutConstraint!
    var isWhiteNav = false
    
    override func viewDidLoad() {
        self.setNavigationButton(type: .BackSearchWhite)
        self.addTitleView(title: nil, subtitle: nil, isTextField: true)
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "CellMainHeader" , bundle: nil), forCellWithReuseIdentifier: "CellMainHeader")
        collectionView.register(UINib(nibName: "CellRecommendedItem" , bundle: nil), forCellWithReuseIdentifier: "CellRecommendedItem")
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        collectionView.register(UINib(nibName: "CellFoodCourtItem" , bundle: nil), forCellWithReuseIdentifier: "CellFoodCourtItem")
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "collectionHeaderID")

        //
        // Do any additional setup after loading the view.
        
        self.collectionView.backgroundColor = UIColor.white
        catView.clipsToBounds = false
        catView.layer.shadowColor = UIColor.black.cgColor
        catView.layer.shadowOpacity = 0.7
        catView.layer.shadowOffset = CGSize.init(width: 0, height: 3)
        catView.layer.shadowRadius = 6
//        catView.layer.shadowPath = UIBezierPath(roundedRect: catView.bounds, cornerRadius: 19).cgPath
        catView.layer.cornerRadius = 19
        //catView.
//        catView.clipsToBounds = true
        fullCatView.frame = kDeviceFrame
        fullCatView.isHidden = true
        self.navigationController?.view.addSubview(fullCatView)
        constraintHeight.constant = CGFloat(40 * tblCat.arrCateory.count) + 30.0
        tblCat.blockTableViewDidSelectAtIndexPath = { (indexPath) in
            self.fullCatView.alpha = 1
            UIView.animate(withDuration: 0.5, animations: {
                self.fullCatView.alpha = 0
            }) { (copmletion) in
                self.fullCatView.isHidden = true
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.isStatusBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.isStatusBarHidden = false
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellMainHeader", for: indexPath)  as! CellMainHeader
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellRecommendedItem", for: indexPath)  as! CellRecommendedItem
                if indexPath.row%2 != 0 {
                    cell.leftConstraint.constant = getProportionalWidth(width: 20)
                    cell.rightConstraint.constant = 0
                } else {
                    cell.leftConstraint.constant = 0
                    cell.rightConstraint.constant = getProportionalWidth(width: 20)
                }
                cell.backgroundColor = UIColor.white
                return cell
            }
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellFoodCourtItem", for: indexPath)  as! CellFoodCourtItem
            cell.blockTableViewDidSelectAtIndexPath = { (button) in
                self.constraintHeightCartView.constant = 57.7
                UIView.animate(withDuration: 0.5, animations: {
                    self.view.layoutIfNeeded()
                })
                
                let rateView = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "RatePopupVC") as! RatePopupVC
                rateView.isRate = false
                rateView.modalPresentationStyle = .custom
                self.present(rateView, animated: true, completion: nil)
            }
            return cell
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return CGSize(width: collectionView.frame.size.width, height: getProportionalWidth(width: 340))
            } else {
                let width = collectionView.frame.size.width / 2
                return CGSize.init(width: width - 10, height: collectionView.frame.size.width / 2)
            }
        } else {
            let width = collectionView.frame.size.width
            return CGSize.init(width: width, height: 50)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: collectionView.frame.width, height: 0) //add your height here
        } else {
            return CGSize(width: collectionView.frame.width, height: 13.7 + 22 + 10) //add your height here
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionElementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "collectionHeaderID", for: indexPath)
            headerView.clipsToBounds = true
            headerView.backgroundColor = UIColor.setColor(red: 244, green: 244, blue: 244)
            let whiteView = UIView()
            whiteView.frame = CGRect.init(x: 0, y: 13.7, width: kPresentedViewWidth, height: 22 + 30)
            whiteView.backgroundColor = UIColor.white
            headerView.addSubview(whiteView)
            
            let lblheader = UILabel()
            lblheader.text = "Pizza"
            lblheader.font = Font.setAveNirNextPro(font: .Bold, size: 17)
            lblheader.frame = CGRect.init(x: getProportionalWidth(width: 18.7), y: 20, width: 200, height: 30)
            lblheader.textColor = UIColor.black
            headerView.addSubview(lblheader)
            
            return headerView
            
        default:
            return UICollectionReusableView()
            //assert(false, "Unexpected element kind")
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        NSLog("Table view scroll detected at offset: %f", scrollView.contentOffset.y)
        
        if let vc = self.collectionView.parentViewController {
            
            if scrollView.contentOffset.y > 50 {
                
                if isWhiteNav == false {
                    
                    isWhiteNav = true
                }
                vc.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
                vc.navigationController?.navigationBar.shadowImage = nil
                self.setNavigationImage(isBlack: true)
                self.txtField.text = "Domino’s Pizza"
//                self.addTitleView(title: "Domino’s Pizza", subtitle: "")
                
            } else {
                vc.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                vc.navigationController?.navigationBar.shadowImage = UIImage()
                self.setNavigationImage(isBlack: false)
                self.txtField.text = ""
            }
        }
    }
    
    @IBAction func btnCategoryPress() {
        fullCatView.isHidden = false
        fullCatView.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.fullCatView.alpha = 1
        }) { (copmletion) in
        }
    }
    
    @IBAction func btnViewCartPress() {
        let cartVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "MyCartVC") as! MyCartVC
        self.navigationController?.pushViewController(cartVC, animated: true)
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
