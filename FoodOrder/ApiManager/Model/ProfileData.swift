//
//  ProfileDataRootClass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on November 29, 2018

import Foundation
import UIKit

class ProfileData : NSObject, NSCoding{

    var address : String!
    var dob : String!
    var email : String!
    var fullname : String!
    var phone : String!
    var picture : String!
    var userId : String!
    var image : UIImage!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        address = dictionary["address"] as? String
        dob = dictionary["dob"] as? String
        email = dictionary["email"] as? String
        fullname = dictionary["fullname"] as? String
        phone = dictionary["phone"] as? String
        picture = dictionary["picture"] as? String
        userId = dictionary["user_id"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if address != nil{
            dictionary["address"] = address
        }
        if dob != nil{
            dictionary["dob"] = dob
        }
//        if email != nil{
//            dictionary["email"] = email
//        }
        if fullname != nil{
            dictionary["fullname"] = fullname
        }
        if phone != nil{
            dictionary["phone"] = phone
        }
        if picture != nil{
            dictionary["picture"] = picture
        } else {
            dictionary["picture"] = image
        }
        
//        if userId != nil{
//            dictionary["user_id"] = userId
//        }
        
        
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        address = aDecoder.decodeObject(forKey: "address") as? String
        dob = aDecoder.decodeObject(forKey: "dob") as? String
        email = aDecoder.decodeObject(forKey: "email") as? String
        fullname = aDecoder.decodeObject(forKey: "fullname") as? String
        phone = aDecoder.decodeObject(forKey: "phone") as? String
        picture = aDecoder.decodeObject(forKey: "picture") as? String
        userId = aDecoder.decodeObject(forKey: "user_id") as? String
        image = aDecoder.decodeObject(forKey: "image") as? UIImage
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if address != nil{
            aCoder.encode(address, forKey: "address")
        }
        if dob != nil{
            aCoder.encode(dob, forKey: "dob")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if fullname != nil{
            aCoder.encode(fullname, forKey: "fullname")
        }
        if phone != nil{
            aCoder.encode(phone, forKey: "phone")
        }
        if picture != nil{
            aCoder.encode(picture, forKey: "picture")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "user_id")
        }
        if image != nil{
            aCoder.encode(image, forKey: "image")
        }
    }
}
