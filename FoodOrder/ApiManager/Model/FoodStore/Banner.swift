//
//  Banner.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on November 25, 2018

import Foundation


class Banner : NSObject, NSCoding{

    var id : String!
    var picture : String!
    var restaurantId : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        id = dictionary["id"] as? String
        picture = dictionary["picture"] as? String
        restaurantId = dictionary["restaurant_id"] as? String
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
        if picture != nil{
            dictionary["picture"] = picture
        }
        if restaurantId != nil{
            dictionary["restaurant_id"] = restaurantId
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
        picture = aDecoder.decodeObject(forKey: "picture") as? String
        restaurantId = aDecoder.decodeObject(forKey: "restaurant_id") as? String
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
        if picture != nil{
            aCoder.encode(picture, forKey: "picture")
        }
        if restaurantId != nil{
            aCoder.encode(restaurantId, forKey: "restaurant_id")
        }
    }
}