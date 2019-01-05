//
//  CustomizeOption.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on December 25, 2018

import Foundation


class CustomizeOption : NSObject, NSCoding{

    var createdAt : String!
    var id : String!
    var isDeleted : String!
    var itemCustomizeId : String!
    var itemId : String!
    var name : String!
    var price : String!
    var slug : String!
    var title : String!
    var updateAt : String!
    var selected: Bool! = false

    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        createdAt = dictionary["created_at"] as? String
        id = dictionary["id"] as? String
        isDeleted = dictionary["is_deleted"] as? String
        itemCustomizeId = dictionary["item_customize_id"] as? String
        itemId = dictionary["item_id"] as? String
        name = dictionary["name"] as? String
        price = dictionary["price"] as? String
        slug = dictionary["slug"] as? String
        title = dictionary["title"] as? String
        updateAt = dictionary["update_at"] as? String
        selected = dictionary["selected"] as? Bool
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if id != nil{
            dictionary["id"] = id
        }
        if isDeleted != nil{
            dictionary["is_deleted"] = isDeleted
        }
        if itemCustomizeId != nil{
            dictionary["item_customize_id"] = itemCustomizeId
        }
        if itemId != nil{
            dictionary["item_id"] = itemId
        }
        if name != nil{
            dictionary["name"] = name
        }
        if price != nil{
            dictionary["price"] = price
        }
        if slug != nil{
            dictionary["slug"] = slug
        }
        if title != nil{
            dictionary["title"] = title
        }
        if updateAt != nil{
            dictionary["update_at"] = updateAt
        }
        if selected != nil{
            dictionary["selected"] = selected
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        isDeleted = aDecoder.decodeObject(forKey: "is_deleted") as? String
        itemCustomizeId = aDecoder.decodeObject(forKey: "item_customize_id") as? String
        itemId = aDecoder.decodeObject(forKey: "item_id") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        price = aDecoder.decodeObject(forKey: "price") as? String
        slug = aDecoder.decodeObject(forKey: "slug") as? String
        title = aDecoder.decodeObject(forKey: "title") as? String
        updateAt = aDecoder.decodeObject(forKey: "update_at") as? String
        selected = aDecoder.decodeObject(forKey: "selected") as? Bool
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if isDeleted != nil{
            aCoder.encode(isDeleted, forKey: "is_deleted")
        }
        if itemCustomizeId != nil{
            aCoder.encode(itemCustomizeId, forKey: "item_customize_id")
        }
        if itemId != nil{
            aCoder.encode(itemId, forKey: "item_id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if price != nil{
            aCoder.encode(price, forKey: "price")
        }
        if slug != nil{
            aCoder.encode(slug, forKey: "slug")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if updateAt != nil{
            aCoder.encode(updateAt, forKey: "update_at")
        }
        if selected != nil{
            aCoder.encode(selected, forKey: "selected")
        }
    }
}
