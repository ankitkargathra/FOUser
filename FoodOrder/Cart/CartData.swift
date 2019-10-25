//
//  CartData.swift
//  FoodOrder
//
//  Created by Rohan on 25/12/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import Foundation

class CartData {
    
    static let shared: CartData! = CartData()
    
    var image: String?
    var name: String?
    var address: String?
    var voucherDiscount: String? = "0.0"
    
    var restaurent_id: String?
    var order_type: String?
    var voucher_id: String?
    var special_cooking_instructions: String?
    var sub_total: String?
    var tax: String?
    var discount: String? = "0"
    var grand_total: String?
    var table_number: String?
    var payment_method:String?
    var items = [MenuData]()
    var orderItems = [OrderItem]()
    var itemsAddOn = [AddOn]()
    var orderItemJson = [JSONDICTIONARY]()
    
    func toJsonDict() -> JSONDICTIONARY {
        
        var dict: JSONDICTIONARY = [:]
        
        if let restaurent_id = restaurent_id { dict["restaurent_id"] = restaurent_id }
        if let order_type = order_type { dict["order_type"] = order_type }
        
        if let voucher_id = voucher_id { dict["voucher_id"] = voucher_id }
        if let special_cooking_instructions = special_cooking_instructions { dict["special_cooking_instructions"] = special_cooking_instructions }
        if let sub_total = sub_total { dict["sub_total"] = sub_total }
        if let tax = tax { dict["tax"] = tax }
        if let discount = discount { dict["discount"] = discount }
        if let grand_total = grand_total { dict["grand_total"] = grand_total }
        if let table_number = table_number { dict["table_number"] = table_number }
        if let payment_method = payment_method { dict["payment_method"] = payment_method }
        
        
        var orders = [JSONDICTIONARY]()
        var addOnsObj = [JSONDICTIONARY]()
        
        for item in items {
            let cartItem = OrderItem()
            
            if item.customizeOptions != nil {

                let dict = item.customizeOptions.toDictionary()
                
                for heaer in item.customizeOptions.header {
                    if let addOns = dict[heaer] as? [JSONDICTIONARY] {
                        if heaer == "Add Ons" {
                            for ons in addOns {
                                if ons["selected"] as? Bool == true {
                                    var onsDict = JSONDICTIONARY()
                                    onsDict["add_on_id"] = ons["id"] as? String
                                    onsDict["quantity"] = "\(item.addedInCartValue!)"
                                    onsDict["price"] = ons["price"] as? String
                                    onsDict["order_item_id"] = ons["item_id"] as? String
                                    addOnsObj.append(onsDict)
                                }
                            }
                        } else {
                            for ons in addOns {
                                if ons["selected"] as? Bool == true {
                                    cartItem.customize_id = ons["item_customize_id"] as? String
                                    cartItem.customize_value = ons["id"] as? String
                                }
                            }
                        }
                    }
                }
            }
            
            cartItem.item_id = item.id!
            cartItem.quantity = "\(item.addedInCartValue!)"
            cartItem.price = item.itemPrice!
            orders.append(cartItem.toJsonDict())
        }
        
        dict["order_items"] = orders
        dict["items_add_on"] = addOnsObj
        print(dict)
        return dict
    }
    
    func removeCart() {
        image = nil
        name = nil
        address = nil
        voucherDiscount = "0.0"
        restaurent_id = nil
        order_type = nil
        voucher_id = nil
        special_cooking_instructions = nil
        sub_total = nil
        tax = nil
        discount = "0"
        grand_total = nil
        table_number = nil
        payment_method = nil
        self.items.removeAll()
        orderItems = [OrderItem]()
        itemsAddOn = [AddOn]()
        orderItemJson = [JSONDICTIONARY]()
    }
}


class OrderItem {
    
    var item_id: String?
    var customize_id: String?
    var customize_value: String?
    var quantity: String?
    var price: String?
    
    func toJsonDict() -> JSONDICTIONARY {
        var dict: JSONDICTIONARY = [:]
        if let item_id = item_id { dict["item_id"] = item_id }
        if let customize_id = customize_id { dict["customize_id"] = customize_id }
        if let customize_value = customize_value { dict["customize_value"] = customize_value }
        if let quantity = quantity { dict["quantity"] = quantity }
        if let price = price { dict["price"] = price }
        return dict
    }
}


class AddOn {

    var add_on_id: String?
    var quantity: String?
    var price: String?
    
    func toJsonDict() -> JSONDICTIONARY {
        var dict: JSONDICTIONARY = [:]
        if let add_on_id = add_on_id { dict["add_on_id"] = add_on_id }
        if let quantity = quantity { dict["quantity"] = quantity }
        if let price = price { dict["price"] = price }
        return dict
    }
}
