//
//  Voucher.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on December 27, 2018

import Foundation


class Voucher : NSObject, NSCoding{

    var giftId : String!
    var voucherCode : String!
    var discount : String!
    var startDate : String!
    var endDate : String!
    var voucherName : String!
    var descriptionField : String!
    var isActive : String!
    var restId : String!
    var restaurantName : String!
    var restaurantAddress : String!
    var picture : String!
    var isReedem: String!
    var perPersonOnce: String!
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        descriptionField = dictionary["description"] as? String
        discount = dictionary["discount"] as? String
        endDate = dictionary["end_date"] as? String
        giftId = dictionary["gift_id"] as? String
        isActive = dictionary["is_active"] as? String
        picture = dictionary["picture"] as? String
        restId = dictionary["rest_id"] as? String
        restaurantAddress = dictionary["restaurant_address"] as? String
        restaurantName = dictionary["restaurant_name"] as? String
        startDate = dictionary["start_date"] as? String
        voucherCode = dictionary["voucher_code"] as? String
        voucherName = dictionary["voucher_name"] as? String
        isReedem = dictionary["is_reedem"] as? String
        perPersonOnce = dictionary["per_person_once"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if descriptionField != nil{
            dictionary["description"] = descriptionField
        }
        if discount != nil{
            dictionary["discount"] = discount
        }
        if endDate != nil{
            dictionary["end_date"] = endDate
        }
        if giftId != nil{
            dictionary["gift_id"] = giftId
        }
        if isActive != nil{
            dictionary["is_active"] = isActive
        }
        if picture != nil{
            dictionary["picture"] = picture
        }
        if restId != nil{
            dictionary["rest_id"] = restId
        }
        if restaurantAddress != nil{
            dictionary["restaurant_address"] = restaurantAddress
        }
        if restaurantName != nil{
            dictionary["restaurant_name"] = restaurantName
        }
        if startDate != nil{
            dictionary["start_date"] = startDate
        }
        if voucherCode != nil{
            dictionary["voucher_code"] = voucherCode
        }
        if voucherName != nil{
            dictionary["voucher_name"] = voucherName
        }
        if isReedem != nil{
            dictionary["is_reedem"] = isReedem
        }
        if perPersonOnce != nil{
            dictionary["per_person_once"] = perPersonOnce
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        descriptionField = aDecoder.decodeObject(forKey: "description") as? String
        discount = aDecoder.decodeObject(forKey: "discount") as? String
        endDate = aDecoder.decodeObject(forKey: "end_date") as? String
        giftId = aDecoder.decodeObject(forKey: "gift_id") as? String
        isActive = aDecoder.decodeObject(forKey: "is_active") as? String
        picture = aDecoder.decodeObject(forKey: "picture") as? String
        restId = aDecoder.decodeObject(forKey: "rest_id") as? String
        restaurantAddress = aDecoder.decodeObject(forKey: "restaurant_address") as? String
        restaurantName = aDecoder.decodeObject(forKey: "restaurant_name") as? String
        startDate = aDecoder.decodeObject(forKey: "start_date") as? String
        voucherCode = aDecoder.decodeObject(forKey: "voucher_code") as? String
        voucherName = aDecoder.decodeObject(forKey: "voucher_name") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if discount != nil{
            aCoder.encode(discount, forKey: "discount")
        }
        if endDate != nil{
            aCoder.encode(endDate, forKey: "end_date")
        }
        if giftId != nil{
            aCoder.encode(giftId, forKey: "gift_id")
        }
        if isActive != nil{
            aCoder.encode(isActive, forKey: "is_active")
        }
        if picture != nil{
            aCoder.encode(picture, forKey: "picture")
        }
        if restId != nil{
            aCoder.encode(restId, forKey: "rest_id")
        }
        if restaurantAddress != nil{
            aCoder.encode(restaurantAddress, forKey: "restaurant_address")
        }
        if restaurantName != nil{
            aCoder.encode(restaurantName, forKey: "restaurant_name")
        }
        if startDate != nil{
            aCoder.encode(startDate, forKey: "start_date")
        }
        if voucherCode != nil{
            aCoder.encode(voucherCode, forKey: "voucher_code")
        }
        if voucherName != nil{
            aCoder.encode(voucherName, forKey: "voucher_name")
        }
    }
}
