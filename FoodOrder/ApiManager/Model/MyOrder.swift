//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 9, 2019

import Foundation


class MyOrder : NSObject{

    var currentOrders : [CurrentOrder]!
    var pastOrder : [PastOrder]!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        currentOrders = [CurrentOrder]()
        if let currentOrdersArray = dictionary["current_orders"] as? [[String:Any]]{
            for dic in currentOrdersArray{
                let value = CurrentOrder(fromDictionary: dic)
                currentOrders.append(value)
            }
        }
        pastOrder = [PastOrder]()
        if let pastOrdersArray = dictionary["past_orders"] as? [[String:Any]]{
            for dic in pastOrdersArray{
                let value = PastOrder(fromDictionary: dic)
                pastOrder.append(value)
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if currentOrders != nil{
            var dictionaryElements = [[String:Any]]()
            for currentOrdersElement in currentOrders {
                dictionaryElements.append(currentOrdersElement.toDictionary())
            }
            dictionary["currentOrders"] = dictionaryElements
        }
        if pastOrder != nil{
            var dictionaryElements = [[String:Any]]()
            for pastOrdersElement in pastOrder {
                dictionaryElements.append(pastOrdersElement.toDictionary())
            }
            dictionary["pastOrders"] = dictionaryElements
        }
        return dictionary
    }
}
