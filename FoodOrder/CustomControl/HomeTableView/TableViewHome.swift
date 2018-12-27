//
//  TableViewVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

enum CellType {
    case Status,RecentOrder,Statestic
}

class TableViewHome: BaseTableView,UITableViewDelegate,UITableViewDataSource {

    var blockTableViewDidSelectAtIndexPath:((IndexPath,CellType)->Void)?
    
    var sectionArray:[CellType] = [.Statestic,.RecentOrder,.RecentOrder,.RecentOrder,.RecentOrder]
    
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
        self.register(UINib(nibName:"CellOrderStatus", bundle: nil), forCellReuseIdentifier: "CellOrderStatus")
        self.register(UINib(nibName:"CellMyOrder", bundle: nil), forCellReuseIdentifier: "CellMyOrder")
        self.register(UINib(nibName:"CellStatistics", bundle: nil), forCellReuseIdentifier: "CellStatistics")

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

//    func numberOfSections(in tableView: UITableView) -> Int {
//        return sectionArray.count
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       return sectionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        switch sectionArray[indexPath.row] {
        case .Status:
            let cell = self.dequeueReusableCell(withIdentifier: "CellOrderStatus") as! CellOrderStatus
            if indexPath.row == 0 {
                cell.setCellDataOrderPreparing(isPreparing: false)
            } else if indexPath.row == 1 {
                cell.setCellDataOrderPreparing(isPreparing: true)
            }
            return cell
        case .RecentOrder:
            let cell = self.dequeueReusableCell(withIdentifier: "CellMyOrder") as! CellMyOrder
            cell.lblOrderStatus.textColor = UIColor.colorRed()
            cell.lblOrderStatus.text = "Order is delivered"
            cell.viewRated.isHidden = false
            return cell
        case .Statestic:
            let cell = self.dequeueReusableCell(withIdentifier: "CellStatistics") as! CellStatistics
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        switch sectionArray[indexPath.row] {
        case .Status:
            return getProportionalWidth(width: 190) + ((IS_iPHONE_4 || IS_iPHONE_5) ? 10 : 0)
        case .RecentOrder:
            return UITableViewAutomaticDimension
        case .Statestic:
            return UITableViewAutomaticDimension
        }
        
    }
    
    //MARK:- DID SELECT
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.deselectRow(at: indexPath, animated: true)
//        let cell = self.cellForRow(at: indexPath) as! CellVaucher
        if(self.blockTableViewDidSelectAtIndexPath != nil){
            self.blockTableViewDidSelectAtIndexPath!(indexPath, sectionArray[indexPath.row])
        }        
    }
    
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let cell = self.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
//        cell.lblTitle.text = self.sectionArray[section].uppercased()
//        return cell
//    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
}


