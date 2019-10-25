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
    var blockTableViewRateNowIndexPath:((Int)->Void)?
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
        
        switch sectionArray[indexPath.row] {
        case .Status:
            let cell = self.dequeueReusableCell(withIdentifier: "CellOrderStatus", for:indexPath) as! CellOrderStatus
            if self.arrCurrentOrder.count == 0{
                cell.imgHot_pot.isHidden = true
                cell.viewBg.isHidden = true
                cell.arrRecentScan = self.arrRecentScan
                cell.collectionView.reloadData()
            }else{
                cell.collectionView.isHidden = true
                let data = self.arrCurrentOrder[indexPath.row].orderStatus
                if data == "Order In Kitchen" || data == "Order Accepted"{
                    cell.setCellDataOrderPreparing(isPreparing: true, OS: self.arrCurrentOrder[indexPath.row])
                }else if data == "Order Ready to Serve"{
                    cell.setCellDataOrderPreparing(isPreparing: false, OS: self.arrCurrentOrder[indexPath.row])
                }
            }
            return cell
        case .Statestic:
            let cell = self.dequeueReusableCell(withIdentifier: "CellStatistics", for:indexPath) as! CellStatistics
            return cell
        case .RecentOrder:
            let cell = self.dequeueReusableCell(withIdentifier: "CellMyOrder", for:indexPath) as! CellMyOrder
            cell.setCellDataRecentOrder(RO: self.arrActivity[self.arrCurrentOrder.count == 0 ? indexPath.row-2 : indexPath.row-self.arrCurrentOrder.count-1])
            if self.arrActivity[self.arrCurrentOrder.count == 0 ? indexPath.row-2 : indexPath.row-self.arrCurrentOrder.count-1].isRate == "0"{
                cell.btnRateNow.tag = self.arrCurrentOrder.count == 0 ? indexPath.row-2 : indexPath.row-self.arrCurrentOrder.count-1
                cell.btnRateNow.addTarget(self, action: #selector(self.btnRateNowPress(sender:)), for: .touchUpInside)
            }
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
        if(self.blockTableViewDidSelectAtIndexPath != nil){
            self.blockTableViewDidSelectAtIndexPath!(indexPath, sectionArray[indexPath.row])
        }        
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    @objc func btnRateNowPress(sender:UIButton) {
        if(self.blockTableViewRateNowIndexPath != nil){
            self.blockTableViewRateNowIndexPath!(sender.tag)
        }
    }
}


