//
//  TableViewVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController

enum MyCartCellType {
    case cellBrand,cellProduct,cellCouponCode,cellSpecialInst,CellTotal
}

class TableViewMyCart: BaseTableView,UITableViewDelegate,UITableViewDataSource {

    var blockTableViewDidSelectAtIndexPath:((IndexPath, MyCartCellType)->Void)?
    var itemCell = [MyCartCellType]()
    var arrCell = [[MyCartCellType]]()
    
    var voucherApplied: Bool = false
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        // REUSE CELL
        self.register(UINib(nibName:"CellMyCartBrand", bundle: nil), forCellReuseIdentifier: "CellMyCartBrand")
        self.register(UINib(nibName:"CellMyCartProductItem", bundle: nil), forCellReuseIdentifier: "CellMyCartProductItem")
        self.register(UINib(nibName:"CellApplyVoucher", bundle: nil), forCellReuseIdentifier: "CellApplyVoucher")
        self.register(UINib(nibName:"CellSpecialInst", bundle: nil), forCellReuseIdentifier: "CellSpecialInst")
        self.register(UINib(nibName:"CellGrandTotalCart", bundle: nil), forCellReuseIdentifier: "CellGrandTotalCart")
        
        self.estimatedSectionHeaderHeight = 100
        self.sectionHeaderHeight = UITableViewAutomaticDimension
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = 44
//        self.backgroundColor = UIColor.init(patternImage: #imageLiteral(resourceName: "HomeBg"))
        self.isScrollEnabled = true
        self.showsVerticalScrollIndicator = false
        self.bounces = true
        self.separatorStyle = .none
        self.allowsSelection = true
        self.dataSource = self
        self.delegate = self
        
        self.setData()
        // self.setTableFooter()
    }
    
    
    func setData() {
        itemCell.removeAll()
        for _ in 0..<CartData.shared.items.count {
            itemCell.append(.cellProduct)
        }
        arrCell = [[.cellBrand],itemCell,[.cellCouponCode,.cellSpecialInst,.CellTotal]]
        self.reloadData()
    }
    
    //MARK: TableView Delegate And DataSource
    //MARK:

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrCell[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        switch arrCell[indexPath.section][indexPath.row] {
        case .cellBrand:
            let cell = self.dequeueReusableCell(withIdentifier: "CellMyCartBrand") as! CellMyCartBrand
            return cell
        case .cellProduct:
            let cell = self.dequeueReusableCell(withIdentifier: "CellMyCartProductItem") as! CellMyCartProductItem
            cell.setCellData(menu: CartData.shared.items[indexPath.row])
            
            cell.blockTableViewSteperPress = { (steper) in
                CartData.shared.items[indexPath.row].addedInCartValue! = Int.init(steper.value)
                if CartData.shared.items[indexPath.row].addedInCartValue! == 0 {
                    CartData.shared.items.remove(at: indexPath.row)
                    self.setData()
                    
                } else{
                    cell.setCellData(menu: CartData.shared.items[indexPath.row])
                }
                NotificationCenter.default.post(name: kUpdateCartNotification, object: nil)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "setupCart"), object: nil)
                
//                self.reloadRows(at: [IndexPath.init(row: indexPath.row, section: indexPath.section)], with: UITableViewRowAnimation.none)
//                self.reloadRows(at: [IndexPath.init(row: 2, section: 2)], with: UITableViewRowAnimation.none)
            }
            
            cell.btnCustomizePress = { (index) in
                let rateView = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "RatePopupVC") as! RatePopupVC
                rateView.isRate = false
                rateView.modalPresentationStyle = .custom
                rateView.addOn = CartData.shared.items[indexPath.row].customizeOptions[0]
                rateView.item = CartData.shared.items[indexPath.row]
                SJSwiftSideMenuController.navigationContainer.present(rateView, animated: true, completion: nil)
            }
            return cell
        case .cellCouponCode:
            let cell = self.dequeueReusableCell(withIdentifier: "CellApplyVoucher") as! CellApplyVoucher
            cell.setCellApplyCode(applyed: voucherApplied)
            
            if voucherApplied == true {
                cell.lblSelectedVoucher.text = "\(CartData.shared.voucherDiscount!)% Discount"
            }
            
            cell.btnClose.addTarget(self, action: #selector(self.removeCoupon), for: UIControlEvents.touchUpInside)
            return cell
        case .cellSpecialInst:
            let cell = self.dequeueReusableCell(withIdentifier: "CellSpecialInst") as! CellSpecialInst
            return cell
        case .CellTotal:
            let cell = self.dequeueReusableCell(withIdentifier: "CellGrandTotalCart") as! CellGrandTotalCart
            cell.setCartTotal()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension//getProportionalHeight(height: 175.7)
    }
    
    //MARK:- DID SELECT
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.deselectRow(at: indexPath, animated: true)
//        let cell = self.cellForRow(at: indexPath) as! CellVaucher
        if(self.blockTableViewDidSelectAtIndexPath != nil){
            self.blockTableViewDidSelectAtIndexPath!(indexPath, arrCell[indexPath.section][indexPath.row])
        }        
    }
    
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let cell = self.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
//        cell.lblTitle.text = self.sectionArray[section].uppercased()
//        return cell
//    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    @objc func removeCoupon() {
        self.voucherApplied = false
        CartData.shared.discount = "0"
        CartData.shared.voucherDiscount = "0"
        self.reloadData()
    }
}


