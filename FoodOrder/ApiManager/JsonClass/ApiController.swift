//
//  ApiController.swift
//  Deals en Route Business
//
//  Created by Ankit on 11/27/17.
//  Copyright © 2017 Solulab. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class ApiController {
    
    let kDeviceType = "iOS"
    var isLocalJson = false
    let kSystemVersion = UIDevice.current.systemVersion
    static let shared: ApiController = ApiController()
    
    lazy var kAppVersion: String = {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }()
    
    lazy var kDeviceID: String = {
        return UIDevice.current.identifierForVendor!.uuidString
    }()
    
    //MARK: Login with Email
    
    func loginUser(login: Login, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        
        callWebservice(url: URLClass.kLogin, methodType: .post, parameter: login.toJsonDictionary(), encoding: JSONEncoding.default, header: false) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    
    func forgotPassword(email: String, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        
        callWebservice(url: URLClass.kForgotPassword, methodType: .post, parameter: ["email":email], encoding: JSONEncoding.default, header: false) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    func registerUser(user: SignUp, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        
        callWebservice(url: URLClass.kregister, methodType: .post, parameter: user.toJsonDictionary(), encoding: JSONEncoding.default, header: false) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    func registerUserWithFb(user: SignUp, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        
        callWebservice(url: URLClass.kloginWithFB, methodType: .post, parameter: user.toJsonDictionary(), encoding: JSONEncoding.default, header: false) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    //MARK: ---------------

    func callWebservice(url: String, methodType: HTTPMethod, parameter: JSONDICTIONARY?, encoding: ParameterEncoding, header: Bool = true, completion: @escaping (_ result: Bool, _ message: String, _ returnData: Any?) -> ()) {
        
        print("Request -> \(parameter!)")
        
        Alamofire.request(url, method: methodType, parameters: parameter, headers: header ? LoggedinUser.shared.getAuth() : nil).responseJSON { (response) in
            
            DispatchQueue.main.async {
                print(response.result.value)
                if let data = response.result.value as? JSONDICTIONARY {
                    
                    print("Response = \(data)")
                    
                    if let status = data["status"], let message = data["message"] as? String {
                        if "\(status)" == "200" {
                            completion(true, "\(message)" ,data)
                        } else {
                            completion(false, message, nil)
                        }
                    } else {
                        completion(false,"Something went wrong!",nil)
                    }
                    
                } else {
                    completion(false,"Something went wrong!",nil)
                    TOAST.showToast(str: "Something went wrong!")
                }
            }
            
        }
    }
    
    //MARK: Local Api response Method
    
    func callLocalApiResponse(name: String) -> Any? {
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as Any
            } catch {
                // handle error
            }
        }
        return nil
    }
    
    /*
     
     //        let urlRequest = self.createRequestofType(type: .POST, url: URLClass.kLogin, bodyData: login.toJsonDictionary(), fileData: nil, isAppendDeviceData: false, auth: false)
     //        self.callWebRequest(request: urlRequest, completion: completionHandler)
     
     
    func callWebRequest(request: URLRequest, completion: @escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        if appDelegate.reachability.connection == .none {
            Alert.showNetworlAlert()
        }
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: request) { (returnData, response, error) in
            
            DispatchQueue.main.async {
                if let data = returnData
                {
                    do{
                        
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as! JSONDICTIONARY
                        print(json)
                        
                        if let httpResponse = response as? HTTPURLResponse {
                            if httpResponse.statusCode != 200 {
                                completion(false, "Please try again.", nil)
                                return
                            }
                        }
                        
                        if let status = json["status"] as? String {
                            if status == "success" {
                                if let message = json["message"] as? String {
                                    completion(true, message, json)
                                } else {
                                    completion(true, "", json)
                                }
                            } else {
                                if let message = json["message"] as? String {
                                    if message == "Unauthenticated." {
                                        
                                    } else {
                                        completion(false, message, json)
                                    }
                                }
                            }
                        } else {
                            completion(false, "", json)
                        }
                    }
                    catch
                    {
                        let string1 = String.init(data: data, encoding: String.Encoding.utf8)
                        print("return Response : \(String(describing: string1))")
                        completion(false, "Something went wrong", nil)
                    }
                }
                
                if let er = error
                {
                    completion(false, er.localizedDescription, nil)
                    print("Error in \(er)")
                }
            }
            
            }.resume()
    }
 
    func createRequestofType(type: MethodType, url: String, bodyData: JSONDICTIONARY?, fileData: Data?, isAppendDeviceData: Bool, auth:Bool) -> URLRequest
    {
        
        
//        print("Request Date - \(bodyData)")
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = type.rawValue
        var receivedData = bodyData
        
        if auth == true {
            if let token = LoggedinUser.shared.token {
                request.addValue(token, forHTTPHeaderField: "Authorization")
            }
        }
        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        request.addValue("application/json-patch+json", forHTTPHeaderField: "Content-Type")
        
        if type == .GET {
            return request
        }
        
        if isAppendDeviceData
        {
            receivedData?["device_type"] = kDeviceType as AnyObject
            receivedData?["device_version"] = kSystemVersion as AnyObject
            receivedData?["app_version"] = kAppVersion as AnyObject
            
            if let token = UserDefaults.standard.object(forKey: "") as? String {
                receivedData?["device_token"] = token
            }
        }
        
        //        if (receivedData != nil) || (fileData != nil)
        //        {
        let boundary = "Boundary-\(UUID().uuidString)"
        
//        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        
        request.httpBody = self.createBody(parameters: receivedData,
                                           boundary: boundary,
                                           data: fileData,
                                           mimeType: "image/png",
                                           filename: "MyImage.png")
        
        //        }
        return request
    }
    
    func createBody(parameters: JSONDICTIONARY?, boundary: String, data: Data?, mimeType: String, filename: String) -> Data
    {
        let body = NSMutableData()
        let boundaryPrefix = "--\(boundary)\r\n"
        if parameters != nil
        {
            for (key, value) in parameters! {
                if let img = value as? UIImage {
                    body.appendString(boundaryPrefix)
                    body.appendString("Content-Disposition: form-data; name=\"\(key)\"; filename=\"app-icon-3.png\"\r\n")
                    body.appendString("Content-Type: \(mimeType)\r\n\r\n")
                    body.append(UIImagePNGRepresentation(img)!)
                    body.appendString("\r\n")
                } else {
                    body.appendString(boundaryPrefix)
                    body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                    body.appendString("\(value)\r\n")
                }
                
            }
        }
        
//        if let imageData = data
//        {
//
//        }
        
        body.appendString("--".appending(boundary.appending("--")))
        
        return body as Data
    }*/
}

extension NSMutableData {
    func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
        append(data!)
    }
}




