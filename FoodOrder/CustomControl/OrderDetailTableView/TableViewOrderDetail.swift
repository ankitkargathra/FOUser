//
//  TableViewVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

enum OrderDetailCellType {
    case OrderNumber, CompanyLogo, Product, Total, OrderWillReady
}

class TableViewOrderDetail: BaseTableView,UITableViewDelegate,UITableViewDataSource {

    var blockTableViewDidSelectAtIndexPath:((IndexPath)->Void)?
    
    var sectionArray: [[OrderDetailCellType]] = [
        [.OrderWillReady,.OrderNumber,.CompanyLogo],
        [.Product,.Product,.Total]
    ]
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.contentInset = UIEdgeInsetsMake(10, 0, 0, 0)
        
        // REUSE CELL
        self.register(UINib(nibName:"CellOrderNumber", bundle: nil), forCellReuseIdentifier: "CellOrderNumber")
        self.register(UINib(nibName:"HeaderCell", bundle: nil), forCellReuseIdentifier: "HeaderCell")
        self.register(UINib(nibName:"CellProductName", bundle: nil), forCellReuseIdentifier: "CellProductName")
        self.register(UINib(nibName:"CellProductItem", bundle: nil), forCellReuseIdentifier: "CellProductItem")
        self.register(UINib(nibName:"CellGrandTotal", bundle: nil), forCellReuseIdentifier: "CellGrandTotal")
        self.register(UINib(nibName:"CellwillReady", bundle: nil), forCellReuseIdentifier: "CellwillReady")
        //CellwillReady

//        self.estimatedSectionHeaderHeight = 100
//        self.sectionHeaderHeight = UITableViewAutomaticDimension
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
        return sectionArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       return self.sectionArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        switch sectionArray[indexPath.section][indexPath.row] {
            case .OrderNumber:
                let cell = self.dequeueReusableCell(withIdentifier: "CellOrderNumber") as! CellOrderNumber
                return cell
            case .CompanyLogo:
                let cell = self.dequeueReusableCell(withIdentifier: "CellProductName") as! CellProductName
                return cell
            case .Product:
                let cell = self.dequeueReusableCell(withIdentifier: "CellProductItem") as! CellProductItem
                cell.setDashlign()
                return cell
            case .Total:
                let cell = self.dequeueReusableCell(withIdentifier: "CellGrandTotal") as! CellGrandTotal
                return cell
        case .OrderWillReady:
            let cell = self.dequeueReusableCell(withIdentifier: "CellwillReady") as! CellwillReady
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        switch sectionArray[indexPath.section][indexPath.row] {
            
        case .OrderNumber:
            break
        case .CompanyLogo:
            break
        case .Product:
            break
        case .Total:
            break
        case .OrderWillReady:
            break
        }
       return UITableViewAutomaticDimension
    }
    
    //MARK:- DID SELECT
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.deselectRow(at: indexPath, animated: true)
//        let cell = self.cellForRow(at: indexPath) as! CellVaucher
        if(self.blockTableViewDidSelectAtIndexPath != nil){
            self.blockTableViewDidSelectAtIndexPath!(indexPath)
        }        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = self.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
        cell.lblTitle.text = "Bill Details".uppercased()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return getProportionalWidth(width: 51.7)
        }
        
    }
    
}


