//
//  TableViewVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class TableViewMyOrder: BaseTableView,UITableViewDelegate,UITableViewDataSource {

    var blockTableViewDidSelectAtIndexPath:((IndexPath, Int)->Void)?
    var blockTableViewRateNowIndexPath:((Int, Int)->Void)?
    
    var sectionArray = ["Active Orders", "Past Orders"]
    var arrCurrentOrder = [CurrentOrder]()
    var arrPastOrder = [PastOrder]()
    var sectionIndex:Int!
    
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
        self.register(UINib(nibName:"CellMyOrder", bundle: nil), forCellReuseIdentifier: "CellMyOrder")
        
        self.register(UINib(nibName:"HeaderCell", bundle: nil), forCellReuseIdentifier: "HeaderCell")
        
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
        return sectionArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0 {
            return arrCurrentOrder.count
        }
        return arrPastOrder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.dequeueReusableCell(withIdentifier: "CellMyOrder", for:indexPath) as! CellMyOrder
        if indexPath.section == 0 {
            if self.arrCurrentOrder[indexPath.row].isRate == "0"{
                cell.btnRateNow.tag = indexPath.row
                cell.btnRateNow.addTarget(self, action: #selector(self.btnRateNowPress(sender:)), for: .touchUpInside)
            }
            cell.setCellDataCurrentOrder(C: self.arrCurrentOrder[indexPath.row])
        } else {
            if self.arrPastOrder[indexPath.row].isRate == "0"{
                cell.btnRateNow.tag = indexPath.row
                cell.btnRateNow.addTarget(self, action: #selector(self.btnRateNowPress(sender:)), for: .touchUpInside)
            }
            cell.setCellDataPastOrder(P: self.arrPastOrder[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension//getProportionalHeight(height: 175.7)
    }
    
    //MARK:- DID SELECT
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.deselectRow(at: indexPath, animated: true)
        if(self.blockTableViewDidSelectAtIndexPath != nil){
            self.blockTableViewDidSelectAtIndexPath!(indexPath, indexPath.section)
        }        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = self.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
        cell.lblTitle.text = self.sectionArray[section].uppercased()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return getProportionalWidth(width: 50)
    }
    
    @objc func btnRateNowPress(sender:UIButton) {
        if(self.blockTableViewRateNowIndexPath != nil){
            let touchPoint = sender.convert(CGPoint.zero, to: self)
            let clickedButtonIndexPath = self.indexPathForRow(at: touchPoint)
            self.blockTableViewRateNowIndexPath!(sender.tag, (clickedButtonIndexPath?.section)!)
        }
    }
    
}


