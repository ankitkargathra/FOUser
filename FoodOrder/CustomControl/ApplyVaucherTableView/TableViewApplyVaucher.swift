//
//  TableViewVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class TableViewApplyVaucher: BaseTableView,UITableViewDelegate,UITableViewDataSource {

    var blockTableViewDidSelectAtIndexPath:((Int)->Void)?
    
    
    var vouchersArr = [Voucher]()
    
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
        self.register(UINib(nibName:"CellApplyVaucher", bundle: nil), forCellReuseIdentifier: "CellApplyVaucher")
        self.register(UINib(nibName:"HeaderCell", bundle: nil), forCellReuseIdentifier: "HeaderCell")
        
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
        return vouchersArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.dequeueReusableCell(withIdentifier: "CellApplyVaucher") as! CellApplyVaucher
        let v = vouchersArr[indexPath.row]
        cell.setCellDate(voucher: v)
        cell.btnApply.addTarget(self, action: #selector(self.applyBtnPress(button:)), for: UIControlEvents.touchUpInside)
        cell.btnApply.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension//getProportionalHeight(height: 175.7)
    }
    
    //MARK:- DID SELECT
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
//        let cell = self.cellForRow(at: indexPath) as! CellVaucher
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = self.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
        cell.lblTitle.text = "Your Available Vouchers".uppercased()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return getProportionalWidth(width: 51.7)
    }
    
    @objc func applyBtnPress(button: UIButton) {
        if(self.blockTableViewDidSelectAtIndexPath != nil){
            self.blockTableViewDidSelectAtIndexPath!(button.tag)
        }
    }
    
    
}


