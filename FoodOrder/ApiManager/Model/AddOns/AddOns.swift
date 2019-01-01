//
//  AddOns.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on December 25, 2018

import Foundation


class AddOns : NSObject{

    var customizeOptions = [[CustomizeOption]]()
    var header = [String]()
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    
    override init() {}
    
    init(fromDictionary dictionary: [String:Any]){
        print(dictionary)
        header = [String]()
        let tmpHeader = Array(dictionary.keys)
        print(header)
        customizeOptions = [[CustomizeOption]]()
        
        for key in tmpHeader {
            
            if let customizeOptionsArray = dictionary[key] as? [[String:Any]] {
                var option = [CustomizeOption]()
                for dic in customizeOptionsArray{
                    let value = CustomizeOption(fromDictionary: dic)
                    option.append(value)
                }
                customizeOptions.append(option)
                header.append(key)
//                if option.count > 0 {
//
//                } else {
//
//                }
                
            }
        }        
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        
        if customizeOptions != nil{
            var dictionaryElements = [String:Any]()
            
            for i in 0..<customizeOptions.count {
                
                var addOnsObj = [JSONDICTIONARY]()
                let str = header[i]
                for obj in customizeOptions[i]{
                    addOnsObj.append(obj.toDictionary())
                }
                dictionary[str] = addOnsObj
            }
//            dictionary["customizeOptions"] = dictionaryElements
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        
        customizeOptions = aDecoder.decodeObject(forKey: "customize_options") as! [[CustomizeOption]]
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        
        if customizeOptions != nil{
            aCoder.encode(customizeOptions, forKey: "customize_options")
        }
    }
}
