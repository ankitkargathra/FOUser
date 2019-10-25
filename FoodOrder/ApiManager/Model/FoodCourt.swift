//
//  FoodCourt.swift
//  FoodOrder
//
//  Created by Rohan on 25/11/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import Foundation

class FoodCourt {
    var id: String?
    var name: String?
    var address: String?
    var location_id: String?
    
    
    func populateWithJson(dict: JSONDICTIONARY) {
        
        if let id = dict["id"] as? String{
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
    }
}
