//
//  Item.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 10, 2019

import Foundation


class DSOrderItem : NSObject, NSCoding{

    var itemName : String!
    var itemPrice : String!
    var quantity : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        itemName = dictionary["item_name"] as? String
        itemPrice = dictionary["item_price"] as? String
        quantity = dictionary["quantity"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if itemName != nil{
            dictionary["item_name"] = itemName
        }
        if itemPrice != nil{
            dictionary["item_price"] = itemPrice
        }
        if quantity != nil{
            dictionary["quantity"] = quantity
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        itemName = aDecoder.decodeObject(forKey: "item_name") as? String
        itemPrice = aDecoder.decodeObject(forKey: "item_price") as? String
        quantity = aDecoder.decodeObject(forKey: "quantity") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if itemName != nil{
            aCoder.encode(itemName, forKey: "item_name")
        }
        if itemPrice != nil{
            aCoder.encode(itemPrice, forKey: "item_price")
        }
        if quantity != nil{
            aCoder.encode(quantity, forKey: "quantity")
        }
    }
}
