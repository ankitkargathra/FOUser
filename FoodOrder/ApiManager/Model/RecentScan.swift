//
//  RecentScan.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 10, 2019

import Foundation


class RecentScan : NSObject, NSCoding{

    var foodCourtId : String!
    var name : String!
    var updatedAt : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        foodCourtId = dictionary["food_court_id"] as? String
        name = dictionary["name"] as? String
        updatedAt = dictionary["updated_at"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if foodCourtId != nil{
            dictionary["food_court_id"] = foodCourtId
        }
        if name != nil{
            dictionary["name"] = name
        }
        if updatedAt != nil{
            dictionary["updated_at"] = updatedAt
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        foodCourtId = aDecoder.decodeObject(forKey: "food_court_id") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if foodCourtId != nil{
            aCoder.encode(foodCourtId, forKey: "food_court_id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
    }
}