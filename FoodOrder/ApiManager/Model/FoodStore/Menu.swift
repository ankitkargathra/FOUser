//
//  Menu.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on November 25, 2018

import Foundation


class Menu : NSObject, NSCoding{

    var panini : [AnyObject]!
    var foodType = [[MenuData]]()
    var sides : [AnyObject]!
    var foodHeader = [String]()
    
    var searchHeader = [String]()
    var searchFoodType = [[MenuData]]()

    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    
    override init() {
        
    }
    
    init(fromDictionary dictionary: [String:Any]){
        
        foodType = [[MenuData]]()
        foodHeader = [String]()
        foodHeader = Array(dictionary.keys)
        foodHeader.insert("Recommended", at: 0)
        
        if let recommended = dictionary["Recommended"] as? [[String:Any]] {
            if recommended.count == 0 {
                foodType.append([MenuData()])
            } else {
                
            }
        } else {
            foodType.append([MenuData()])
        }
        
        for type in foodHeader {
            if let pizzaArray = dictionary[type] as? [[String:Any]]{
                var food = [MenuData]()
                if pizzaArray.count > 0 {
                    for dic in pizzaArray {
                        let value = MenuData(fromDictionary: dic)
                        food.append(value)
                    }
                    foodType.append(food)
                } else {
                    foodType.append(food)
                }
            }
        }
    }

    func searchDataWithDict(str: String) {
        
        self.searchHeader.removeAll()
        self.searchFoodType.removeAll()
        searchHeader.insert("Recommended", at: 0)
        searchFoodType.append([MenuData()])
        
        if str == "" {
            self.searchHeader = self.foodHeader
            self.searchFoodType = self.foodType
            return
        }
        
        for header in self.foodHeader {
            
            if header != "Recommended" {
                if let index = self.foodHeader.firstIndex(where: { (strHeader) -> Bool in
                    return header == strHeader
                }) {
//                    rint(index)
//                    print(self.foodType[index])
//                    print(self.foodType[index].count)
                    let filterD = self.foodType[index].filter({ (dataObj) -> Bool in
                        print("\(str.lowercased())-\(((dataObj.itemName == nil) ? "" : dataObj.itemName!).lowercased())")
                        
                        return ((dataObj.itemName == nil) ? "" : dataObj.itemName!).lowercased().contains(str.lowercased())
                    })
                    print("Filter Arr \(filterD)")
                    if filterD.count > 0 {
                        self.searchHeader.append(header)
                        self.searchFoodType.append(filterD)
                    }
                }
            }
        }
        
        
        
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
//        if pizza != nil{
//            var dictionaryElements = [[String:Any]]()
//            for pizzaElement in pizza {
//                dictionaryElements.append(pizzaElement.toDictionary())
//            }
//            dictionary["pizza"] = dictionaryElements
//        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
//        panini = aDecoder.decodeObject(forKey: "panini") as? [AnyObject]
//        pizza = aDecoder.decodeObject(forKey: "pizza") as? [MenuData]
//        sides = aDecoder.decodeObject(forKey: "sides") as? [AnyObject]
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
//        if panini != nil{
//            aCoder.encode(panini, forKey: "panini")
//        }
//        if pizza != nil{
//            aCoder.encode(pizza, forKey: "pizza")
//        }
//        if sides != nil{
//            aCoder.encode(sides, forKey: "sides")
//        }
    }
}
