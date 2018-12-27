//
//  Pizza.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on November 25, 2018

import Foundation


class MenuData : NSObject, NSCoding{

    var categoryId : String!
    var createdAt : String!
    var id : String!
    var isActive : String!
    var isAvailable : String!
    var isDeleted : String!
    var isVeg : String!
    var itemName : String!
    var itemPicture : String!
    var itemPrice : String!
    var restaurentId : String!
    var updateAt : String!
    var customizeOption : Bool!
    var addedInCartValue: Int! = 0
    var totalPrice: Double! = 0
    var customizeOptions = [AddOns]()
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    override init() {}
    
    init(fromDictionary dictionary: [String:Any]){
        categoryId = dictionary["category_id"] as? String
        createdAt = dictionary["created_at"] as? String
        id = dictionary["id"] as? String
        isActive = dictionary["is_active"] as? String
        isAvailable = dictionary["is_available"] as? String
        isDeleted = dictionary["is_deleted"] as? String
        isVeg = dictionary["is_veg"] as? String
        itemName = dictionary["item_name"] as? String
        itemPicture = dictionary["item_picture"] as? String
        itemPrice = dictionary["item_price"] as? String
        restaurentId = dictionary["restaurent_id"] as? String
        updateAt = dictionary["update_at"] as? String
        customizeOption = dictionary["customize_option"] as? Bool
        
        if let totalPrice = dictionary["totalPrice"] as? Double {
            self.totalPrice = totalPrice
        }
        if let addedInCartValue = dictionary["addedInCartValue"] as? Int {
            self.addedInCartValue = addedInCartValue
        }
        
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if categoryId != nil{
            dictionary["category_id"] = categoryId
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if id != nil{
            dictionary["id"] = id
        }
        if isActive != nil{
            dictionary["is_active"] = isActive
        }
        if isAvailable != nil{
            dictionary["is_available"] = isAvailable
        }
        if isDeleted != nil{
            dictionary["is_deleted"] = isDeleted
        }
        if isVeg != nil{
            dictionary["is_veg"] = isVeg
        }
        if itemName != nil{
            dictionary["item_name"] = itemName
        }
        if itemPicture != nil{
            dictionary["item_picture"] = itemPicture
        }
        if itemPrice != nil{
            dictionary["item_price"] = itemPrice
        }
        if restaurentId != nil{
            dictionary["restaurent_id"] = restaurentId
        }
        if updateAt != nil{
            dictionary["update_at"] = updateAt
        }
        if customizeOption != nil{
            dictionary["customize_option"] = customizeOption
        }
        if totalPrice != nil{
            dictionary["totalPrice"] = totalPrice
        }
        if addedInCartValue != nil{
            dictionary["addedInCartValue"] = addedInCartValue
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        categoryId = aDecoder.decodeObject(forKey: "category_id") as? String
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        isActive = aDecoder.decodeObject(forKey: "is_active") as? String
        isAvailable = aDecoder.decodeObject(forKey: "is_available") as? String
        isDeleted = aDecoder.decodeObject(forKey: "is_deleted") as? String
        isVeg = aDecoder.decodeObject(forKey: "is_veg") as? String
        itemName = aDecoder.decodeObject(forKey: "item_name") as? String
        itemPicture = aDecoder.decodeObject(forKey: "item_picture") as? String
        itemPrice = aDecoder.decodeObject(forKey: "item_price") as? String
        restaurentId = aDecoder.decodeObject(forKey: "restaurent_id") as? String
        updateAt = aDecoder.decodeObject(forKey: "update_at") as? String
        customizeOption = aDecoder.decodeObject(forKey: "customize_option") as? Bool
        totalPrice = aDecoder.decodeObject(forKey: "totalPrice") as? Double
        addedInCartValue = aDecoder.decodeObject(forKey: "addedInCartValue") as? Int
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if categoryId != nil{
            aCoder.encode(categoryId, forKey: "category_id")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if isActive != nil{
            aCoder.encode(isActive, forKey: "is_active")
        }
        if isAvailable != nil{
            aCoder.encode(isAvailable, forKey: "is_available")
        }
        if isDeleted != nil{
            aCoder.encode(isDeleted, forKey: "is_deleted")
        }
        if isVeg != nil{
            aCoder.encode(isVeg, forKey: "is_veg")
        }
        if itemName != nil{
            aCoder.encode(itemName, forKey: "item_name")
        }
        if itemPicture != nil{
            aCoder.encode(itemPicture, forKey: "item_picture")
        }
        if itemPrice != nil{
            aCoder.encode(itemPrice, forKey: "item_price")
        }
        if restaurentId != nil{
            aCoder.encode(restaurentId, forKey: "restaurent_id")
        }
        if updateAt != nil{
            aCoder.encode(updateAt, forKey: "update_at")
        }
        if customizeOption != nil{
            aCoder.encode(customizeOption, forKey: "customize_option")
        }
        if totalPrice != nil{
            aCoder.encode(totalPrice, forKey: "totalPrice")
        }
        if addedInCartValue != nil{
            aCoder.encode(addedInCartValue, forKey: "addedInCartValue")
        }
    }
}
