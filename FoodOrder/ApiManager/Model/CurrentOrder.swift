//
//  CurrentOrder.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 9, 2019

import Foundation


class CurrentOrder : NSObject{

    var grandTotal : String!
    var orderDate : String!
    var orderId : String!
    var orderItems : [MyOrderItem]!
    var orderNumber : String!
    var orderQueue : String!
    var orderStatus : String!
    var picture : String!
    var isRate : String!
    var ratings : String!
    var restaurantName : String!
    var restaurentId : String!
    var restaurentAddress : String!

    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        grandTotal = dictionary["grand_total"] as? String
        orderDate = dictionary["order_date"] as? String
        orderId = dictionary["order_id"] as? String
        orderNumber = dictionary["order_number"] as? String
        orderQueue = dictionary["order_queue"] as? String
        orderStatus = dictionary["order_status"] as? String
        picture = dictionary["picture"] as? String
        ratings = dictionary["rating"] as? String
        isRate = dictionary["is_rate"] as? String
        restaurantName = dictionary["restaurant_name"] as? String
        restaurentAddress = dictionary["address"] as? String
        restaurentId = dictionary["restaurent_id"] as? String
        orderItems = [MyOrderItem]()
        if let orderItemsArray = dictionary["order_items"] as? [[String:Any]]{
            for dic in orderItemsArray{
                let value = MyOrderItem(fromDictionary: dic)
                orderItems.append(value)
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if grandTotal != nil{
            dictionary["grand_total"] = grandTotal
        }
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
        if ratings != nil{
            dictionary["rating"] = ratings
        }
        if restaurantName != nil{
            dictionary["restaurant_name"] = restaurantName
        }
        if restaurentId != nil{
            dictionary["restaurent_id"] = restaurentId
        }
        if restaurentAddress != nil{
            dictionary["address"] = restaurentAddress
        }
        if isRate != nil{
            dictionary["is_rate"] = isRate
        }
        if orderItems != nil{
            var dictionaryElements = [[String:Any]]()
            for orderItemsElement in orderItems {
                dictionaryElements.append(orderItemsElement.toDictionary())
            }
            dictionary["orderItems"] = dictionaryElements
        }
        return dictionary
    }
}
