//
//  CurrentOrder.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 10, 2019

import Foundation


class DSCurrentOrder : NSObject, NSCoding{

    var orderDate : String!
    var orderId : String!
    var orderNumber : String!
    var orderQueue : String!
    var orderStatus : String!
    var picture : String!
    var restaurantName : String!
    var restaurentId : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        orderDate = dictionary["order_date"] as? String
        orderId = dictionary["order_id"] as? String
        orderNumber = dictionary["order_number"] as? String
        orderQueue = dictionary["order_queue"] as? String
        orderStatus = dictionary["order_status"] as? String
        picture = dictionary["picture"] as? String
        restaurantName = dictionary["restaurant_name"] as? String
        restaurentId = dictionary["restaurent_id"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if orderDate != nil{
            dictionary["order_date"] = orderDate
        }
        if orderId != nil{
            dictionary["order_id"] = orderId
        }
        if orderNumber != nil{
            dictionary["order_number"] = orderNumber
        }
        if orderQueue != nil{
            dictionary["order_queue"] = orderQueue
        }
        if orderStatus != nil{
            dictionary["order_status"] = orderStatus
        }
        if picture != nil{
            dictionary["picture"] = picture
        }
        if restaurantName != nil{
            dictionary["restaurant_name"] = restaurantName
        }
        if restaurentId != nil{
            dictionary["restaurent_id"] = restaurentId
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        orderDate = aDecoder.decodeObject(forKey: "order_date") as? String
        orderId = aDecoder.decodeObject(forKey: "order_id") as? String
        orderNumber = aDecoder.decodeObject(forKey: "order_number") as? String
        orderQueue = aDecoder.decodeObject(forKey: "order_queue") as? String
        orderStatus = aDecoder.decodeObject(forKey: "order_status") as? String
        picture = aDecoder.decodeObject(forKey: "picture") as? String
        restaurantName = aDecoder.decodeObject(forKey: "restaurant_name") as? String
        restaurentId = aDecoder.decodeObject(forKey: "restaurent_id") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if orderDate != nil{
            aCoder.encode(orderDate, forKey: "order_date")
        }
        if orderId != nil{
            aCoder.encode(orderId, forKey: "order_id")
        }
        if orderNumber != nil{
            aCoder.encode(orderNumber, forKey: "order_number")
        }
        if orderQueue != nil{
            aCoder.encode(orderQueue, forKey: "order_queue")
        }
        if orderStatus != nil{
            aCoder.encode(orderStatus, forKey: "order_status")
        }
        if picture != nil{
            aCoder.encode(picture, forKey: "picture")
        }
        if restaurantName != nil{
            aCoder.encode(restaurantName, forKey: "restaurant_name")
        }
        if restaurentId != nil{
            aCoder.encode(restaurentId, forKey: "restaurent_id")
        }
    }
}
