//
//  CellVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellDateSelect: UITableViewCell {
    
    //    @IBOutlet var imgDot: UIImageView!
    //    @IBOutlet var lblTitle: UILabel!
    @IBOutlet weak var lblDate: LabelAveNirNextProBlackDemi!
    @IBOutlet weak var btnPrevious: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var lblTotalAmout: LabelAveNirNextProBoldWhite!
    
    @IBOutlet weak var basicBarChart: BasicBarChart!
    @IBOutlet weak var lbl0: LabelAveNirNextProBlackDemi!
    @IBOutlet weak var lbl20: LabelAveNirNextProBlackDemi!
    @IBOutlet weak var lbl40: LabelAveNirNextProBlackDemi!
    @IBOutlet weak var lbl80: LabelAveNirNextProBlackDemi!
    @IBOutlet weak var lbl100: LabelAveNirNextProBlackDemi!
    @IBOutlet weak var lblNodataFound: LabelAveNirNextProBlackDemi!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
     self.selectionStyle = .none
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func generateDataEntries(index:Int, RO:RestaurentWise, amount:String, max:Int, date:Date) -> [BarEntry] {
        
        getDataFromDate(date: date)
        lblTotalAmout.text = amount.add$Tag()
        lbl0.text = "\(Int(Float(max+10)*Float(0.2)))"
        lbl20.text =  "\(Int(Float(max+10)*Float(0.4)))"
        lbl40.text =  "\(Int(Float(max+10)*Float(0.6)))"
        lbl80.text =  "\(Int(Float(max+10)*Float(0.8)))"
        lbl100.text =  "\(max+10)"
        lblNodataFound.isHidden = true
        basicBarChart.isHidden = false
        
        let colors = [#colorLiteral(red: 0.9098039216, green: 0.1960784314, blue: 0.1960784314, alpha: 1), #colorLiteral(red: 0.1294117647, green: 0.3607843137, blue: 0.6431372549, alpha: 1), #colorLiteral(red: 0.9843137255, green: 0.7843137255, blue: 0.1058823529, alpha: 1), #colorLiteral(red: 0.2274509804, green: 0.8470588235, blue: 0.4274509804, alpha: 1), #colorLiteral(red: 0.7647058824, green: 0.1019607843, blue: 0.9843137255, alpha: 1)]
        var result: [BarEntry] = []
        let value = (RO.orderAmount)
        let height: Float = Float(value!)!/Float(max+10)
        result.append(BarEntry(color: colors[index % colors.count], height: height, textValue: "\(String(describing: value!))", title: String(RO.restaurantName.prefix(8))))
        return result
    }
    
    func removeStaticsData(date:Date){
        
        getDataFromDate(date: date)
        basicBarChart.isHidden = true
        lblTotalAmout.text = "$0"
        lbl0.text = ""
        lbl20.text =  ""
        lbl40.text =  ""
        lbl80.text =  ""
        lbl100.text =  ""
        lblNodataFound.isHidden = false
    }
    
    func getDataFromDate(date:Date){
        
        let nxtDate = Date()
        let formatterYear = DateFormatter()
        let formatterMonth = DateFormatter()
        formatterYear.dateFormat = "YYYY"
        formatterMonth.dateFormat = "MMMM"
        let strDate = "\(formatterMonth.string(from: date)) "+"\(formatterYear.string(from: date))"
        lblDate.text = strDate
        if(strDate == "December 2018"){
            btnPrevious.isEnabled = false
        }
        else{
            btnPrevious.isEnabled = true
        }
        if(strDate == "\(formatterMonth.string(from: nxtDate)) "+"\(formatterYear.string(from: nxtDate))"){
            btnNext.isEnabled = false
        }
        else{
            btnNext.isEnabled = true
        }
        
    }
}

