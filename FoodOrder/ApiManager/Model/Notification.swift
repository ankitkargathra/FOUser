//
//  Data.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on November 26, 2018

import Foundation


class Notification : NSObject, NSCoding{

    var id : String!
    var notification : String!
    var notificationDate : String!
    var notificationId : String!
    var notificationType : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        id = dictionary["id"] as? String
        notification = dictionary["notification"] as? String
        notificationDate = dictionary["notification_date"] as? String
        notificationId = dictionary["notification_id"] as? String
        notificationType = dictionary["notification_type"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if id != nil{
            dictionary["id"] = id
        }
        if notification != nil{
            dictionary["notification"] = notification
        }
        if notificationDate != nil{
            dictionary["notification_date"] = notificationDate
        }
        if notificationId != nil{
            dictionary["notification_id"] = notificationId
        }
        if notificationType != nil{
            dictionary["notification_type"] = notificationType
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        id = aDecoder.decodeObject(forKey: "id") as? String
        notification = aDecoder.decodeObject(forKey: "notification") as? String
        notificationDate = aDecoder.decodeObject(forKey: "notification_date") as? String
        notificationId = aDecoder.decodeObject(forKey: "notification_id") as? String
        notificationType = aDecoder.decodeObject(forKey: "notification_type") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if notification != nil{
            aCoder.encode(notification, forKey: "notification")
        }
        if notificationDate != nil{
            aCoder.encode(notificationDate, forKey: "notification_date")
        }
        if notificationId != nil{
            aCoder.encode(notificationId, forKey: "notification_id")
        }
        if notificationType != nil{
            aCoder.encode(notificationType, forKey: "notification_type")
        }
    }
}
