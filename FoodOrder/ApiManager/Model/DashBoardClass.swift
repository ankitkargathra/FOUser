//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 10, 2019

import Foundation


class DashboardClass : NSObject, NSCoding{

    var activities : [DSActivity]!
    var currentOrders : [DSCurrentOrder]!
    var recentScans : [RecentScan]!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        activities = [DSActivity]()
        if let activitiesArray = dictionary["activities"] as? [[String:Any]]{
            for dic in activitiesArray{
                let value = DSActivity(fromDictionary: dic)
                activities.append(value)
            }
        }
        currentOrders = [DSCurrentOrder]()
        if let currentOrdersArray = dictionary["current_orders"] as? [[String:Any]]{
            for dic in currentOrdersArray{
                let value = DSCurrentOrder(fromDictionary: dic)
                currentOrders.append(value)
            }
        }
        recentScans = [RecentScan]()
        if let recentScansArray = dictionary["recent_scans"] as? [[String:Any]]{
            for dic in recentScansArray{
                let value = RecentScan(fromDictionary: dic)
                recentScans.append(value)
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if activities != nil{
            var dictionaryElements = [[String:Any]]()
            for activitiesElement in activities {
                dictionaryElements.append(activitiesElement.toDictionary())
            }
            dictionary["activities"] = dictionaryElements
        }
        if currentOrders != nil{
            var dictionaryElements = [[String:Any]]()
            for currentOrdersElement in currentOrders {
                dictionaryElements.append(currentOrdersElement.toDictionary())
            }
            dictionary["currentOrders"] = dictionaryElements
        }
        if recentScans != nil{
            var dictionaryElements = [[String:Any]]()
            for recentScansElement in recentScans {
                dictionaryElements.append(recentScansElement.toDictionary())
            }
            dictionary["recentScans"] = dictionaryElements
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        activities = aDecoder.decodeObject(forKey: "activities") as? [DSActivity]
        currentOrders = aDecoder.decodeObject(forKey: "current_orders") as? [DSCurrentOrder]
        recentScans = aDecoder.decodeObject(forKey: "recent_scans") as? [RecentScan]
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if activities != nil{
            aCoder.encode(activities, forKey: "activities")
        }
        if currentOrders != nil{
            aCoder.encode(currentOrders, forKey: "current_orders")
        }
        if recentScans != nil{
            aCoder.encode(recentScans, forKey: "recent_scans")
        }
    }
}
