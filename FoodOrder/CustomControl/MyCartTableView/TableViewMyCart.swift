//
//  TableViewVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

enum MyCartCellType {
    case cellBrand,cellProduct,cellCouponCode,cellSpecialInst,CellTotal
}

class TableViewMyCart: BaseTableView,UITableViewDelegate,UITableViewDataSource {

    var blockTableViewDidSelectAtIndexPath:((IndexPath, MyCartCellType)->Void)?
    
    var arrCell:[MyCartCellType] = [.cellBrand,.cellProduct,.cellProduct,.cellCouponCode,.cellSpecialInst,.CellTotal]
    
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
        self.reloadData()
        // self.setTableFooter()
    }
    
    //MARK: TableView Delegate And DataSource
    //MARK:

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        switch arrCell[indexPath.row] {
        case .cellBrand:
            let cell = self.dequeueReusableCell(withIdentifier: "CellMyCartBrand") as! CellMyCartBrand
            return cell
        case .cellProduct:
            let cell = self.dequeueReusableCell(withIdentifier: "CellMyCartProductItem") as! CellMyCartProductItem
            return cell
        case .cellCouponCode:
            let cell = self.dequeueReusableCell(withIdentifier: "CellApplyVoucher") as! CellApplyVoucher
            cell.setCellApplyCode(applyed: false)
            return cell
        case .cellSpecialInst:
            let cell = self.dequeueReusableCell(withIdentifier: "CellSpecialInst") as! CellSpecialInst
            return cell
        case .CellTotal:
            let cell = self.dequeueReusableCell(withIdentifier: "CellGrandTotalCart") as! CellGrandTotalCart
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
            self.blockTableViewDidSelectAtIndexPath!(indexPath, arrCell[indexPath.row])
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
    
}


