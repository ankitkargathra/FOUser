//
//  TableViewVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

enum CellType {
    case Status,Statestic,RecentOrder
}

class TableViewHome: BaseTableView,UITableViewDelegate,UITableViewDataSource {

    var blockTableViewDidSelectAtIndexPath:((IndexPath,CellType)->Void)?
    var arrCurrentOrder = [DSCurrentOrder]()
    var arrActivity = [DSActivity]()
    var arrRecentScan = [RecentScan]()
    var sectionArray:[CellType] = []
    
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
        self.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: -150, right: 0)
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
        return sectionArray.count > 0 ? sectionArray.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if self.arrActivity.count <= indexPath.row{
            return UITableViewCell()
        }
        switch sectionArray[indexPath.row] {
        case .Status:
            let cell = self.dequeueReusableCell(withIdentifier: "CellOrderStatus", for:indexPath) as! CellOrderStatus
            let data = self.arrCurrentOrder[indexPath.row].orderStatus
            if data == "Order In Kitchen"{
                cell.setCellDataOrderPreparing(isPreparing: true, OS: self.arrCurrentOrder[indexPath.row])
            }else{
                cell.setCellDataOrderPreparing(isPreparing: false, OS: self.arrCurrentOrder[indexPath.row])
            }
            return cell
        case .Statestic:
            let cell = self.dequeueReusableCell(withIdentifier: "CellStatistics", for:indexPath) as! CellStatistics
            return cell
        case .RecentOrder:
            let cell = self.dequeueReusableCell(withIdentifier: "CellMyOrder", for:indexPath) as! CellMyOrder
            cell.setCellDataRecentOrder(RO: self.arrActivity[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
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


