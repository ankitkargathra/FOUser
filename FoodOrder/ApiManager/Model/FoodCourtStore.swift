//
//  FoodCourtStore.swift
//  FoodOrder
//
//  Created by Rohan on 25/11/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import Foundation

class FoodCourtStore {
    
    var id: String?
    var name: String?
    var address: String?
    var location_id: String?
    var total_stores: String?
    var restaurants = [Restaurants]()
    
    func populateJson(dict: JSONDICTIONARY) {
        
        if let id = dict["id"] as? String {
            self.id = id
        }
        
        if let name = dict["name"] as? String {
            self.name = name
        }
        
        if let address = dict["address"] as? String {
            self.address = address
        }
        
        if let location_id = dict["location_id"] as? String {
            self.location_id = location_id
        }
        
        if let total_stores = dict["total_stores"] as? String {
            self.total_stores = total_stores
        }
        
        if let restaurantsArr = dict["restaurants"] as? [JSONDICTIONARY] {
            var restaurentArr = [Restaurants]()
            for reasturent in restaurantsArr {
                let restaurentObj = Restaurants()
                restaurentObj.populateJson(dict: reasturent)
                restaurentArr.append(restaurentObj)
            }
            self.restaurants = restaurentArr
        }
    }
    
}

class Restaurants {
    var id: String?
    var restaurant_name: String?
    var self_service: Bool?
    var is_open: String?
    var waiting: String?
    var ratings: String?
    var categories = [Categories]()
    var categoriesString: String?
    var item_picture: String?
    
    func populateJson(dict: JSONDICTIONARY) {
        
        if let id = dict["id"] as? String {
            self.id = id
        }
        
        if let restaurant_name = dict["restaurant_name"] as? String {
            self.restaurant_name = restaurant_name
        }
        
        if let self_service = dict["self_service"] {
            self.self_service = Bool.init(exactly: NSNumber.init(value: Double.init("\(self_service)")!))
        }
        
        if let is_open = dict["is_open"] as? String {
            self.is_open = is_open
        }
        
        if let waiting = dict["waiting"] {
            self.waiting = "\(waiting)"
        }
        
        if let ratings = dict["ratings"] {
            self.ratings = "\(ratings)"
        }
        
        if let item_picture = dict["picture"] {
            self.item_picture = "\(item_picture)"
        }
        
        if let categoryArr = dict["categories"] as? [JSONDICTIONARY] {
            
            var arrCategory = [Categories]()
            var catStr = [String]()
            for category in categoryArr {
                let categoryObj = Categories()
                categoryObj.populateJson(dict: category)
                arrCategory.append(categoryObj)
                catStr.append(categoryObj.name!)
            }
            self.categories = arrCategory
            self.categoriesString = catStr.joined(separator: ", ")
        }
        
    }
    
}

class Categories {
    var id: String?
    var name: String?
    
    func populateJson(dict: JSONDICTIONARY) {
        
        if let id = dict["id"] as? String {
            self.id = id
        }
        
        if let name = dict["name"] as? String {
            self.name = name
        }
        
    }
}
