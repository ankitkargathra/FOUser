//
//  TableViewVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class TableViewFoodSize: BaseTableView,UITableViewDelegate,UITableViewDataSource {

    var blockTableViewDidSelectAtIndexPath:((IndexPath)->Void)?
    
    
    var addOn = AddOns()
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.contentInset = UIEdgeInsetsMake(0, 0, 15, 0)
        
        // REUSE CELL
        self.register(UINib(nibName:"CellFoodSizeHeader", bundle: nil), forCellReuseIdentifier: "CellFoodSizeHeader")
        self.register(UINib(nibName:"CellFoodSize", bundle: nil), forCellReuseIdentifier: "CellFoodSize")
        
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
        return addOn.header.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return addOn.customizeOptions[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = self.dequeueReusableCell(withIdentifier: "CellFoodSize") as! CellFoodSize
        
        let item = addOn.customizeOptions[indexPath.section][indexPath.row]
        cell.lblSize.text = item.title!
        cell.lblPrice.text = "$\(item.price!)"
        cell.imgSelection.image = item.selected == true ? UIImage.init(named: "radio_on") : UIImage.init(named: "radio_off")
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 35;
    }
    
    //MARK:- DID SELECT
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
     
        let title = addOn.header[indexPath.section]
        let option = addOn.customizeOptions[indexPath.section][indexPath.row]
        if title == "Add Ons" || title == "add_ons" {
            option.selected = (option.selected == nil) ? true : !option.selected
        } else {
            for item in addOn.customizeOptions[indexPath.section] {
                item.selected = false
            }
            addOn.customizeOptions[indexPath.section][indexPath.row].selected = true
        }
        
        self.reloadData()
        
//        let cell = self.cellForRow(at: indexPath) as! CellVaucher
        if(self.blockTableViewDidSelectAtIndexPath != nil){
            self.blockTableViewDidSelectAtIndexPath!(indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = self.dequeueReusableCell(withIdentifier: "CellFoodSizeHeader") as! CellFoodSizeHeader
        cell.lblTitle.text = addOn.header[section]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return getProportionalWidth(width: 51.7)
    }
    
}


