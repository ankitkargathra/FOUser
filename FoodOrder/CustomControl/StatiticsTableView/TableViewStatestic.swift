//
//  TableViewVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

enum CellStatistic {
    case Chart
    case StoreSpending
}

class TableViewStatestic: BaseTableView,UITableViewDelegate,UITableViewDataSource {

    var blockTableViewDidSelectAtIndexPath:((IndexPath)->Void)?
    var blockTableViebtnNextPreviousAtIndexPath:((Int)->Void)?
    
    var arrOrderStatistics = [RestaurentWise]()
    var arrCateory:[[CellStatistic]] = []
    var TotalAmount:Double!
    var arrAmount:[Int] = []
    var date = Date()
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.contentInset = UIEdgeInsetsMake(15, 0, 15, 0)
        
        // REUSE CELL
        self.register(UINib(nibName:"CellDateSelect", bundle: nil), forCellReuseIdentifier: "CellDateSelect")
        self.register(UINib(nibName:"HeaderCell", bundle: nil), forCellReuseIdentifier: "HeaderCell")
        self.register(UINib(nibName:"CellTotalSpending", bundle: nil), forCellReuseIdentifier: "CellTotalSpending")
        //
        
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
        return arrCateory.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrCateory[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        switch arrCateory[indexPath.section][indexPath.row] {
        case .Chart:
            let cell = self.dequeueReusableCell(withIdentifier: "CellDateSelect") as! CellDateSelect
            cell.btnPrevious.tag = 1
            cell.btnNext.tag = 2
            cell.btnPrevious.addTarget(self, action: #selector(self.btnNextPreviousPress(sender:)), for: .touchUpInside)
            cell.btnNext.addTarget(self, action: #selector(self.btnNextPreviousPress(sender:)), for: .touchUpInside)
            if(self.arrOrderStatistics.count == 0){
                cell.removeStaticsData(date: date)
                return cell
            }
            let dataEntries = cell.generateDataEntries(index:indexPath.row, RO: self.arrOrderStatistics[indexPath.row], amount:String(TotalAmount), max:self.arrAmount.max()!, date:date)
            cell.basicBarChart.dataEntries = dataEntries
            return cell
        case .StoreSpending:
            let cell = self.dequeueReusableCell(withIdentifier: "CellTotalSpending") as! CellTotalSpending
            cell.cellTotalSpendingData(RW: self.arrOrderStatistics[indexPath.row-5])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        if indexPath.section == 0 {
            return getProportionalWidth(width: 530)
        } else {
            return getProportionalWidth(width: 58.3)
        }
    }
    
    //MARK:- DID SELECT
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if(self.blockTableViewDidSelectAtIndexPath != nil){
            self.blockTableViewDidSelectAtIndexPath!(indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = self.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
        cell.lblTitle.text = "Other Stores Spending".uppercased()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return getProportionalWidth(width: 51.7)
        }
    }
    
    @objc func btnNextPreviousPress(sender:UIButton) {
        self.blockTableViebtnNextPreviousAtIndexPath!(sender.tag)
    }
}


