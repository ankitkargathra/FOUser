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
    
    //MARK: ----------------
    //MARK: Login And Register
    //MARK: ----------------
    
    func loginUser(login: Login, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        
        callWebservice(url: URLClass.kLogin, methodType: .post, parameter: login.toJsonDictionary(), encoding: JSONEncoding.default, header: false) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    
    func forgotPassword(email: String, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        
        callWebservice(url: URLClass.kForgotPassword, methodType: .post, parameter: ["email":email,"user_type":"user"], encoding: JSONEncoding.default, header: false) { (result, message, response) in
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
    
    func resendEmail(email: String, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        
        callWebservice(url: URLClass.kResendMail, methodType: .post, parameter: ["email":email], encoding: JSONEncoding.default, header: false) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    //MARK: ----------------
    //MARK: Food court And store
    //MARK: ----------------
    
    func getFoodCourt(location_id: String, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        
        callWebservice(url: URLClass.kgetFoodCourt, methodType: .post, parameter: ["location_id":location_id], encoding: JSONEncoding.default, header: true) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    func getFoodCourtStores(food_court_id: String, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        
        callWebservice(url: URLClass.kgetFoodCourtStore, methodType: .post, parameter: ["food_court_id":food_court_id], encoding: JSONEncoding.default, header: true) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    func getFoodStoreDetail(restaurant_id: String, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        
        callWebservice(url: URLClass.kgetFoodStoreMenu, methodType: .post, parameter: ["restaurant_id":restaurant_id], encoding: JSONEncoding.default, header: true) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    //MARK: ----------------
    //MARK: Notifications
    //MARK: ----------------
    
    func getNotifications(completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: [JSONDICTIONARY]?) -> Void)
    {
        
        callWebservice(url: URLClass.kgetNotifications, methodType: .post, parameter: nil, encoding: JSONEncoding.default, header: true) { (result, message, response) in
            completionHandler(result, message, response as? [JSONDICTIONARY])
        }
    }
    
    //MARK: ----------------
    //MARK: get and Edit profile
    //MARK: ----------------
    
    func getProfile(completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        
        callWebservice(url: URLClass.kGetProfile, methodType: .post, parameter: nil, encoding: JSONEncoding.default, header: true) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    func updateProfile(profile:ProfileData, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        
        callWebservice(url: URLClass.kUpdateProfile, methodType: .post, parameter: profile.toDictionary(), encoding: JSONEncoding.default, header: true) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    func updatePassword(oldPassword: String, newPassword: String, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        
        callWebservice(url: URLClass.kUpdatePassword, methodType: .post, parameter: ["old_password":oldPassword,"password":newPassword], encoding: JSONEncoding.default, header: true) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    
    //MARK: ----------------
    //MARK: AddOnds
    //MARK: ----------------
    
    func getAddOns(item_id: String, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        
        callWebservice(url: URLClass.kgetItemsAddOns, methodType: .post, parameter: ["item_id":item_id], encoding: JSONEncoding.default, header: true) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    //MARK: ----------------
    //MARK: Help and support
    //MARK: ----------------
    
    func getHelpAndSupport(topic: String, message: String, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        
        callWebservice(url: URLClass.khelpSupport, methodType: .post, parameter: ["topic":topic,"message":message], encoding: JSONEncoding.default, header: true) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    
    //MARK: ----------------
    //MARK: Voucher
    //MARK: ----------------
    
    func getVoucers(completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: [JSONDICTIONARY]?) -> Void)
    {
        
        callWebservice(url: URLClass.kgetUserVoucherList, methodType: .post, parameter: nil, encoding: JSONEncoding.default, header: true) { (result, message, response) in
            completionHandler(result, message, response as? [JSONDICTIONARY])
        }
    }
    
    //MARK: ----------------
    //MARK: Place Order
    //MARK: ----------------
    
    func sendOrder(cart:JSONDICTIONARY,completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void){
        Alamofire.request(URLClass.korder, method: .post, parameters: cart, encoding: JSONEncoding.prettyPrinted, headers: LoggedinUser.shared.getAuth()).responseJSON { (response) in
            DispatchQueue.main.async {
                
                if let data = response.result.value as? JSONDICTIONARY {
                    
                    print("Response = \(data)")
                    
                    if let status = data["status"], let message = data["message"] as? String {
                        if "\(status)" == "200" {
                            completionHandler(true, "\(message)" ,data["data"] as? JSONDICTIONARY)
                        } else {
                            completionHandler(false, message, nil)
                        }
                    } else {
                        completionHandler(false,"Something went wrong!",nil)
                    }
                    
                } else {
                    completionHandler(false,"Something went wrong!",nil)
                    TOAST.showToast(str: "Something went wrong!")
                }
            }

        }
        
//        callWebservice(url: URLClass.korder, methodType: .post, parameter: cart, encoding: JSONEncoding.prettyPrinted, header: true) { (result, message, response) in
//            completionHandler(result, message, response as? [JSONDICTIONARY])
//        }
    }
    
    //MARK: ----------------
    //MARK: Order & rating review api
    //MARK: ----------------

    func getmyOrders(completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        callWebservice(url: URLClass.kgetMyOrders, methodType: .post, parameter: nil, encoding: JSONEncoding.default, header: true) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    func getOrderDetails(orderId: String, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        callWebservice(url: URLClass.kgetOrderDetails, methodType: .post, parameter: ["order_id":orderId], encoding: JSONEncoding.default, header: true) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    func getDashBoardDetails(completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        callWebservice(url: URLClass.kgetDashboardDetails, methodType: .post, parameter: nil, encoding: JSONEncoding.default, header: true) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    func ratingReview(Params:JSONDICTIONARY, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        callWebservice(url: URLClass.kratingreview, methodType: .post, parameter: Params, encoding: JSONEncoding.default, header: true) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    func getStatisticsData(Params: JSONDICTIONARY, completionHandler:@escaping (_ result: Bool, _ message: String, _ returnData: JSONDICTIONARY?) -> Void)
    {
        callWebservice(url: URLClass.kgetStatistics, methodType: .post, parameter: Params, encoding: JSONEncoding.default, header: true) { (result, message, response) in
            completionHandler(result, message, response as? JSONDICTIONARY)
        }
    }
    
    //MARK: ----------------
    //MARK: Alamofire api controls app api
    //MARK: ----------------

    func callWebservice(url: String, methodType: HTTPMethod, parameter: JSONDICTIONARY?, encoding: ParameterEncoding, header: Bool = true, completion: @escaping (_ result: Bool, _ message: String, _ returnData: Any?) -> ()) {
        
        print("Request -> \(String(describing: parameter))")
        
        Alamofire.upload(multipartFormData:{ multipartFormData in
            
            if parameter != nil{
                for (key, value) in parameter! {
                    
                    if let img = value as? UIImage {
                        if let imageData = UIImageJPEGRepresentation(img , 0.6) {
                            multipartFormData.append(imageData, withName: key, fileName: "file.jpg", mimeType: "image/jpg")
                        }
                    } else {
                        multipartFormData.append(String.init(value as! NSString).data(using: String.Encoding.utf8)!, withName: key)
                    }
                    
                }
            }
            
        },
                         to:url,
                         method:.post,
                         headers:header ? LoggedinUser.shared.getAuth() : nil,
                         encodingCompletion: { encodingResult in
                            switch encodingResult {
                            case .success(let upload, _, _):
                                upload.responseJSON { response in
                                    DispatchQueue.main.async {
                                        print(response.result.value ?? "")
                                        if let data = response.result.value as? JSONDICTIONARY {
                                            
                                            print("Response = \(data)")
                                            
                                            if let status = data["status"], let message = data["message"] as? String {
                                                if "\(status)" == "200" {
                                                    completion(true, "\(message)" ,data["data"])
                                                } else {
                                                    completion(false, message, nil)
                                                }
                                            } else {
                                                completion(false,"Something went wrong!",nil)
                                            }
                                            
                                        } else {
                                            completion(false,response.error?.localizedDescription ?? "",nil)
                                            TOAST.showToast(str: response.error?.localizedDescription ?? "")
                                        }
                                    }
                                }
                            case .failure(_):
                                completion(false,"Something went wrong!",nil)
                                TOAST.showToast(str: "Something went wrong!")
                                break
                            }
        })
            
//        Alamofire.request(url, method: methodType, parameters: parameter, headers: header ? LoggedinUser.shared.getAuth() : nil).responseJSON { (response) in
//
//            DispatchQueue.main.async {
//                print(response.result.value)
//                if let data = response.result.value as? JSONDICTIONARY {
//
//                    print("Response = \(data)")
//
//                    if let status = data["status"], let message = data["message"] as? String {
//                        if "\(status)" == "200" {
//                            completion(true, "\(message)" ,data["data"])
//                        } else {
//                            completion(false, message, nil)
//                        }
//                    } else {
//                        completion(false,"Something went wrong!",nil)
//                    }
//
//                } else {
//                    completion(false,"Something went wrong!",nil)
//                    TOAST.showToast(str: "Something went wrong!")
//                }
//            }
//
//        }
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
}




