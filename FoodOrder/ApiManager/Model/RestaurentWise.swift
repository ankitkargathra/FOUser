//
//  RestaurentWise.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 20, 2019

import Foundation


class RestaurentWise : NSObject, NSCoding{

    var orderAmount : String!
    var restaurantName : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        orderAmount = dictionary["order_amount"] as? String
        restaurantName = dictionary["restaurant_name"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if orderAmount != nil{
            dictionary["order_amount"] = orderAmount
        }
        if restaurantName != nil{
            dictionary["restaurant_name"] = restaurantName
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        orderAmount = aDecoder.decodeObject(forKey: "order_amount") as? String
        restaurantName = aDecoder.decodeObject(forKey: "restaurant_name") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if orderAmount != nil{
            aCoder.encode(orderAmount, forKey: "order_amount")
        }
        if restaurantName != nil{
            aCoder.encode(restaurantName, forKey: "restaurant_name")
        }
    }
}
