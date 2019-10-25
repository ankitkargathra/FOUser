//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 20, 2019

import Foundation


class StatisticsClass : NSObject, NSCoding{

    var restaurentWise : [RestaurentWise]!
    var totalSpent : Double!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        totalSpent = dictionary["total_spent"] as? Double
        restaurentWise = [RestaurentWise]()
        if let restaurentWiseArray = dictionary["restaurent_wise"] as? [[String:Any]]{
            for dic in restaurentWiseArray{
                let value = RestaurentWise(fromDictionary: dic)
                restaurentWise.append(value)
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if totalSpent != nil{
            dictionary["total_spent"] = totalSpent
        }
        if restaurentWise != nil{
            var dictionaryElements = [[String:Any]]()
            for restaurentWiseElement in restaurentWise {
                dictionaryElements.append(restaurentWiseElement.toDictionary())
            }
            dictionary["restaurentWise"] = dictionaryElements
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        restaurentWise = aDecoder.decodeObject(forKey: "restaurent_wise") as? [RestaurentWise]
        totalSpent = aDecoder.decodeObject(forKey: "total_spent") as? Double
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if restaurentWise != nil{
            aCoder.encode(restaurentWise, forKey: "restaurent_wise")
        }
        if totalSpent != nil{
            aCoder.encode(totalSpent, forKey: "total_spent")
        }
    }
}
