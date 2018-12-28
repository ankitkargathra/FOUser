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
    var items = [MenuData]()
    var orderItems = [OrderItem]()
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
        
        
        var orders = [JSONDICTIONARY]()
        for item in items {
            let cartItem = OrderItem()
            cartItem.item_id = item.id!
            cartItem.quantity = "\(item.addedInCartValue!)"
            cartItem.price = item.itemPrice!
            orders.append(cartItem.toJsonDict())
        }
        dict["order_items"] = orders
        
        print(dict)
        return dict
    }
    
    func removeCart() {
        self.items.removeAll()
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
