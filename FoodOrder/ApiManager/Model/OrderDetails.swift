//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 10, 2019

import Foundation


class OrderDetails : NSObject{

    var discount : String!
    var grandTotal : String!
    var items : [ItemOrderDetails]!
    var orderDate : String!
    var orderId : String!
    var orderNumber : String!
    var orderQueue : String!
    var orderStatus : String!
    var paymentMethod : String!
    var picture : String!
    var ratings : Int!
    var restaurantAddress : String!
    var restaurantName : String!
    var restaurentId : String!
    var subTotal : String!
    var tableNumber : String!
    var tax : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        discount = dictionary["discount"] as? String
        grandTotal = dictionary["grand_total"] as? String
        orderDate = dictionary["order_date"] as? String
        orderId = dictionary["order_id"] as? String
        orderNumber = dictionary["order_number"] as? String
        orderQueue = dictionary["order_queue"] as? String
        orderStatus = dictionary["order_status"] as? String
        paymentMethod = dictionary["payment_method"] as? String
        picture = dictionary["picture"] as? String
        ratings = dictionary["ratings"] as? Int
        restaurantAddress = dictionary["restaurant_address"] as? String
        restaurantName = dictionary["restaurant_name"] as? String
        restaurentId = dictionary["restaurent_id"] as? String
        subTotal = dictionary["sub_total"] as? String
        tableNumber = dictionary["table_number"] as? String
        tax = dictionary["tax"] as? String
        items = [ItemOrderDetails]()
        if let itemsArray = dictionary["items"] as? [[String:Any]]{
            for dic in itemsArray{
                let value = ItemOrderDetails(fromDictionary: dic)
                items.append(value)
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if discount != nil{
            dictionary["discount"] = discount
        }
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
        if paymentMethod != nil{
            dictionary["payment_method"] = paymentMethod
        }
        if picture != nil{
            dictionary["picture"] = picture
        }
        if ratings != nil{
            dictionary["ratings"] = ratings
        }
        if restaurantAddress != nil{
            dictionary["restaurant_address"] = restaurantAddress
        }
        if restaurantName != nil{
            dictionary["restaurant_name"] = restaurantName
        }
        if restaurentId != nil{
            dictionary["restaurent_id"] = restaurentId
        }
        if subTotal != nil{
            dictionary["sub_total"] = subTotal
        }
        if tableNumber != nil{
            dictionary["table_number"] = tableNumber
        }
        if tax != nil{
            dictionary["tax"] = tax
        }
        if items != nil{
            var dictionaryElements = [[String:Any]]()
            for itemsElement in items {
                dictionaryElements.append(itemsElement.toDictionary())
            }
            dictionary["items"] = dictionaryElements
        }
        return dictionary
    }
}
