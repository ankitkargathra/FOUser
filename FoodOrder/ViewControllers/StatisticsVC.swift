//
//  StatisticsVC.swift
//  FoodOrder
//
//  Created by Rohan on 31/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class StatisticsVC: BaseVC {
    
    @IBOutlet weak var tblStatistics: TableViewStatestic!
    
    var month = ""
    var year = ""
    
    override func viewDidLoad() {
        self.setNavigationButton(type: .BackBlack)
        self.addTitleView(title: "Statistics", subtitle: nil)
        super.viewDidLoad()
        let formatterYear = DateFormatter()
        let formatterMonth = DateFormatter()
        formatterYear.dateFormat = "YYYY"
        formatterMonth.dateFormat = "MM"
        month = formatterMonth.string(from: tblStatistics.date)
        year = formatterYear.string(from: tblStatistics.date)
        tblStatistics.blockTableViebtnNextPreviousAtIndexPath = { (sender) in
            if(sender == 1){
                let nextMonth = Calendar.current.date(byAdding: .month, value: -1, to: self.tblStatistics.date)
                self.tblStatistics.date = nextMonth!
                self.month = formatterMonth.string(from: nextMonth!)
                self.year = formatterYear.string(from: self.tblStatistics.date)
            }else{
                let nextMonth = Calendar.current.date(byAdding: .month, value: 1, to: self.tblStatistics.date)
                self.tblStatistics.date = nextMonth!
                self.month = formatterMonth.string(from: nextMonth!)
                self.year = formatterYear.string(from: self.tblStatistics.date)
            }
            self.getStatisticsData(month: self.month, year: self.year)
        }
        getStatisticsData(month: month, year: year)
    }
    
    func getStatisticsData(month:String!, year:String!){
        UtilityClass.showHUD()
        let params = ["month":month,"year":year] as JSONDICTIONARY
        ApiController.shared.getStatisticsData(Params: params) { (success, message, response) in
            UtilityClass.hideHUD()
            if(success){
                if response != nil{
                    self.removeData()
                    let statistics = StatisticsClass.init(fromDictionary: response!)
                    self.tblStatistics.TotalAmount = statistics.totalSpent
                    for obj in statistics.restaurentWise{
                        if statistics.restaurentWise.count <= 5{
                            self.tblStatistics.arrOrderStatistics.append(obj)
                            self.tblStatistics.arrCateory.append([.Chart])
                            let orderamount = Int((obj.orderAmount as NSString).doubleValue)
                            self.tblStatistics.arrAmount.append(orderamount)
                        }else{
                            self.tblStatistics.arrOrderStatistics.append(obj)
                            self.tblStatistics.arrCateory.append([.StoreSpending])
                        }
                    }
                    DispatchQueue.main.async {
                        self.tblStatistics.reloadData()
                    }
                }else{
                    self.removeData()
                    self.tblStatistics.arrCateory.append([.Chart])
                    self.tblStatistics.reloadData()
                }
            }
        }
    }
    
    func removeData(){
        self.tblStatistics.arrOrderStatistics.removeAll()
        self.tblStatistics.arrCateory.removeAll()
        self.tblStatistics.arrAmount.removeAll()
    }
}
