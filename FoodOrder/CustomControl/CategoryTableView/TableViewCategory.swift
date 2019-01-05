//
//  TableViewVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class TableViewCategory: BaseTableView,UITableViewDelegate,UITableViewDataSource {

    var blockTableViewDidSelectAtIndexPath:((IndexPath, String)->Void)?
    
    var arrCateory = [Category]()
    
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
        self.register(UINib(nibName:"CellCategory", bundle: nil), forCellReuseIdentifier: "CellCategory")
        
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = 44
//        self.backgroundColor = UIColor.init(patternImage: #imageLiteral(resourceName: "HomeBg"))
        self.isScrollEnabled = true
        self.showsVerticalScrollIndicator = false
        self.bounces = true
        self.separatorStyle = .none
        self.allowsSelection = true
        self.allowsMultipleSelection = true
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
        return arrCateory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.dequeueReusableCell(withIdentifier: "CellCategory") as! CellCategory
        
        cell.imgDot.isHidden = !arrCateory[indexPath.row].isSelected!
        cell.lblTitle.font = Font.setAveNirNextPro(font: .Demi, size: 15.7, isChangeAsPerDevice: false)
        cell.lblTitle.text = arrCateory[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 40//getProportionalHeight(height: 175.7)
    }
    
    //MARK:- DID SELECT
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
//        let cell = self.cellForRow(at: indexPath) as! CellVaucher
        
        
        for cat in self.arrCateory {
            cat.isSelected = false
        }
        
        if(self.blockTableViewDidSelectAtIndexPath != nil){
            self.blockTableViewDidSelectAtIndexPath!(indexPath, self.arrCateory[indexPath.row].name!)
        }
        //tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.arrCateory[indexPath.row].isSelected = false
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
    
}


