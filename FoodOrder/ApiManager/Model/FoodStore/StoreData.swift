//
//  Data.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on November 25, 2018

import Foundation


class StoreData : NSObject, NSCoding{

    var banners : [Banner]!
    var categories : [Category]!
    var categoriesString : String!
    var createdAt : String!
    var foodCourtId : String!
    var id : String!
    var isOpen : String!
    var menu = Menu()
    var picture : String!
    var ratings : Int!
    var restaurantAddress : String!
    var restaurantCity : String!
    var restaurantCountry : String!
    var restaurantName : String!
    var restaurantPhone : String!
    var restaurantState : String!
    var restaurantZip : String!
    var selfService : String!
    var updatedAt : String!
    var userId : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    
    override init() {
        
    }
    
    init(fromDictionary dictionary: [String:Any]){
        createdAt = dictionary["created_at"] as? String
        foodCourtId = dictionary["food_court_id"] as? String
        id = dictionary["id"] as? String
        isOpen = dictionary["is_open"] as? String
        picture = dictionary["picture"] as? String
        ratings = dictionary["ratings"] as? Int
        restaurantAddress = dictionary["restaurant_address"] as? String
        restaurantCity = dictionary["restaurant_city"] as? String
        restaurantCountry = dictionary["restaurant_country"] as? String
        restaurantName = dictionary["restaurant_name"] as? String
        restaurantPhone = dictionary["restaurant_phone"] as? String
        restaurantState = dictionary["restaurant_state"] as? String
        restaurantZip = dictionary["restaurant_zip"] as? String
        selfService = dictionary["self_service"] as? String
        updatedAt = dictionary["updated_at"] as? String
        userId = dictionary["user_id"] as? String
        if let menuData = dictionary["menu"] as? [String:Any]{
            menu = Menu(fromDictionary: menuData)
        }
        banners = [Banner]()
        if let bannersArray = dictionary["banners"] as? [[String:Any]]{
            for dic in bannersArray{
                let value = Banner(fromDictionary: dic)
                banners.append(value)
            }
        }
        categories = [Category]()
        var catArr = [String]()
        if let categoriesArray = dictionary["categories"] as? [[String:Any]]{
            for dic in categoriesArray{
                let value = Category(fromDictionary: dic)
                categories.append(value)
                catArr.append(value.name)
            }
            if catArr.count > 0 {
                categoriesString = catArr.joined(separator: ", ")
            }
        }
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
        if foodCourtId != nil{
            dictionary["food_court_id"] = foodCourtId
        }
        if id != nil{
            dictionary["id"] = id
        }
        if isOpen != nil{
            dictionary["is_open"] = isOpen
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
        if restaurantCity != nil{
            dictionary["restaurant_city"] = restaurantCity
        }
        if restaurantCountry != nil{
            dictionary["restaurant_country"] = restaurantCountry
        }
        if restaurantName != nil{
            dictionary["restaurant_name"] = restaurantName
        }
        if restaurantPhone != nil{
            dictionary["restaurant_phone"] = restaurantPhone
        }
        if restaurantState != nil{
            dictionary["restaurant_state"] = restaurantState
        }
        if restaurantZip != nil{
            dictionary["restaurant_zip"] = restaurantZip
        }
        if selfService != nil{
            dictionary["self_service"] = selfService
        }
        if updatedAt != nil{
            dictionary["updated_at"] = updatedAt
        }
        if userId != nil{
            dictionary["user_id"] = userId
        }
        if menu != nil{
            dictionary["menu"] = menu.toDictionary()
        }
        if banners != nil{
            var dictionaryElements = [[String:Any]]()
            for bannersElement in banners {
                dictionaryElements.append(bannersElement.toDictionary())
            }
            dictionary["banners"] = dictionaryElements
        }
        if categories != nil{
            var dictionaryElements = [[String:Any]]()
            for categoriesElement in categories {
                dictionaryElements.append(categoriesElement.toDictionary())
            }
            dictionary["categories"] = dictionaryElements
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        banners = aDecoder.decodeObject(forKey: "banners") as? [Banner]
        categories = aDecoder.decodeObject(forKey: "categories") as? [Category]
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        foodCourtId = aDecoder.decodeObject(forKey: "food_court_id") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        isOpen = aDecoder.decodeObject(forKey: "is_open") as? String
        menu = aDecoder.decodeObject(forKey: "menu") as! Menu
        picture = aDecoder.decodeObject(forKey: "picture") as? String
        ratings = aDecoder.decodeObject(forKey: "ratings") as? Int
        restaurantAddress = aDecoder.decodeObject(forKey: "restaurant_address") as? String
        restaurantCity = aDecoder.decodeObject(forKey: "restaurant_city") as? String
        restaurantCountry = aDecoder.decodeObject(forKey: "restaurant_country") as? String
        restaurantName = aDecoder.decodeObject(forKey: "restaurant_name") as? String
        restaurantPhone = aDecoder.decodeObject(forKey: "restaurant_phone") as? String
        restaurantState = aDecoder.decodeObject(forKey: "restaurant_state") as? String
        restaurantZip = aDecoder.decodeObject(forKey: "restaurant_zip") as? String
        selfService = aDecoder.decodeObject(forKey: "self_service") as? String
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
        userId = aDecoder.decodeObject(forKey: "user_id") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if banners != nil{
            aCoder.encode(banners, forKey: "banners")
        }
        if categories != nil{
            aCoder.encode(categories, forKey: "categories")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if foodCourtId != nil{
            aCoder.encode(foodCourtId, forKey: "food_court_id")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if isOpen != nil{
            aCoder.encode(isOpen, forKey: "is_open")
        }
        if menu != nil{
            aCoder.encode(menu, forKey: "menu")
        }
        if picture != nil{
            aCoder.encode(picture, forKey: "picture")
        }
        if ratings != nil{
            aCoder.encode(ratings, forKey: "ratings")
        }
        if restaurantAddress != nil{
            aCoder.encode(restaurantAddress, forKey: "restaurant_address")
        }
        if restaurantCity != nil{
            aCoder.encode(restaurantCity, forKey: "restaurant_city")
        }
        if restaurantCountry != nil{
            aCoder.encode(restaurantCountry, forKey: "restaurant_country")
        }
        if restaurantName != nil{
            aCoder.encode(restaurantName, forKey: "restaurant_name")
        }
        if restaurantPhone != nil{
            aCoder.encode(restaurantPhone, forKey: "restaurant_phone")
        }
        if restaurantState != nil{
            aCoder.encode(restaurantState, forKey: "restaurant_state")
        }
        if restaurantZip != nil{
            aCoder.encode(restaurantZip, forKey: "restaurant_zip")
        }
        if selfService != nil{
            aCoder.encode(selfService, forKey: "self_service")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "user_id")
        }
    }
}
