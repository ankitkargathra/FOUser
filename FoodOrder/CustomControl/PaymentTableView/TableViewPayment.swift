//
//  TableViewVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

enum PaymentcellType {
    case CellSelectOrder,CellPayment
}

class TableViewPayment: BaseTableView,UITableViewDelegate,UITableViewDataSource {

    var blockTableViewDidSelectAtIndexPath:((IndexPath, PaymentcellType)->Void)?
    
    var arrSection = ["Table NUmber","Payment Mathod"]
    var arrCelltype:[[PaymentcellType]] = [[.CellSelectOrder],[.CellPayment,.CellPayment]]
    var arrTitle = ["Credit / Debit Card","Cash on Delivery"]
    var arrSubTitle = ["Enter card details to pay with your card","Please keep excat change handy to help us serve you better"]
    var arrImg = ["card.pdf","cash.pdf"]
    
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
        self.register(UINib(nibName:"CellPaymentSelectOrder", bundle: nil), forCellReuseIdentifier: "CellPaymentSelectOrder")
        self.register(UINib(nibName:"CellPaymentType", bundle: nil), forCellReuseIdentifier: "CellPaymentType")
        self.register(UINib(nibName:"HeaderCell", bundle: nil), forCellReuseIdentifier: "HeaderCell")
        //
        
        self.rowHeight = UITableViewAutomaticDimension
        self.sectionHeaderHeight = UITableViewAutomaticDimension
        self.estimatedSectionHeaderHeight = 100;
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
        self.separatorStyle = .none
        self.backgroundColor = UIColor.white
        // self.setTableFooter()
    }
    
    //MARK: TableView Delegate And DataSource
    //MARK:

    func numberOfSections(in tableView: UITableView) -> Int {
        return arrSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrCelltype[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        switch arrCelltype[indexPath.section][indexPath.row] {
        case .CellSelectOrder:
            let cell = self.dequeueReusableCell(withIdentifier: "CellPaymentSelectOrder") as! CellPaymentSelectOrder
            return cell
        case .CellPayment:
            let cell = self.dequeueReusableCell(withIdentifier: "CellPaymentType") as! CellPaymentType
            cell.lblTitle.text = arrTitle[indexPath.row]
            cell.lblSubtitle.text = arrSubTitle[indexPath.row]
            cell.imgView.image = UIImage.init(named: arrImg[indexPath.row])
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
//        let cell = self.cellForRow(at: indexPath) as! CellVaucher
        if(self.blockTableViewDidSelectAtIndexPath != nil){
            self.blockTableViewDidSelectAtIndexPath!(indexPath,arrCelltype[indexPath.section][indexPath.row])
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = self.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
        cell.lblTitle.text = arrSection[section].uppercased()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
}


