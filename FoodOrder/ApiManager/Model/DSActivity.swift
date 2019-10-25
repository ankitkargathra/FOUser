//
//  Activity.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 10, 2019

import Foundation


class DSActivity : NSObject, NSCoding{

    var items : [DSOrderItem]!
    var orderDate : String!
    var orderId : String!
    var orderStatus : String!
    var picture : String!
    var restaurantName : String!
    var restaurantAddress : String!
    var restaurentId : String!
    var isRate : String!
    var rating : Float!
    var grandTotal : String!

    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        orderDate = dictionary["order_date"] as? String
        orderId = dictionary["order_id"] as? String
        orderStatus = dictionary["order_status"] as? String
        picture = dictionary["picture"] as? String
        restaurantName = dictionary["restaurant_name"] as? String
        restaurantAddress = dictionary["restaurant_address"] as? String
        restaurentId = dictionary["restaurent_id"] as? String
        isRate = dictionary["is_rate"] as? String
        rating = dictionary["rating"] as? Float
        grandTotal = dictionary["grand_total"] as? String
        items = [DSOrderItem]()
        if let itemsArray = dictionary["items"] as? [[String:Any]]{
            for dic in itemsArray{
                let value = DSOrderItem(fromDictionary: dic)
                items.append(value)
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()
        if orderDate != nil{
            dictionary["order_date"] = orderDate
        }
        if orderId != nil{
            dictionary["order_id"] = orderId
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
        if items != nil{
            var dictionaryElements = [[String:Any]]()
            for itemsElement in items {
                dictionaryElements.append(itemsElement.toDictionary())
            }
            dictionary["items"] = dictionaryElements
        }
        if isRate != nil{
            dictionary["is_rate"] = isRate
        }
        if rating != nil{
            dictionary["rating"] = rating
        }
        if grandTotal != nil{
            dictionary["grand_total"] = grandTotal
        }
        if restaurantAddress != nil{
            dictionary["restaurant_address"] = restaurantAddress
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        items = aDecoder.decodeObject(forKey: "items") as? [DSOrderItem]
        orderDate = aDecoder.decodeObject(forKey: "order_date") as? String
        orderId = aDecoder.decodeObject(forKey: "order_id") as? String
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
        if items != nil{
            aCoder.encode(items, forKey: "items")
        }
        if orderDate != nil{
            aCoder.encode(orderDate, forKey: "order_date")
        }
        if orderId != nil{
            aCoder.encode(orderId, forKey: "order_id")
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
