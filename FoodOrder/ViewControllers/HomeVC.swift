//
//  HomeVC.swift
//  FoodOrder
//
//  Created by Rohan on 24/09/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit
import AVFoundation
import QRCodeReader

class HomeVC: BaseVC{
    
    //MARK: Variable
    @IBOutlet var btnScan: UIButton!
    @IBOutlet var tblHome: TableViewHome!
    var previewView: QRCodeReaderView?
    @IBOutlet var cameraView: UIView!
    @IBOutlet var QRView: UIView!
    @IBOutlet var viewPopup: UIView!
    @IBOutlet var txtCode: TextFieldGreenPlaceHolder!
    lazy var reader: QRCodeReader = QRCodeReader()
    
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
            $0.showTorchButton = true
        }
        return QRCodeReaderViewController(builder: builder)
    }()
    
    let foodCourt = FoodCourt()
    var couponCode: String?
    @IBOutlet weak var lblfoodCourtName: LabelAveNirNextProBlackDemi!
    @IBOutlet weak var lblFoodCourtAddress: LabelAveNirNextProGrayMedium!
    
    
    private func checkScanPermissions() -> Bool {
        do {
            return try QRCodeReader.supportsMetadataObjectTypes()
        } catch let error as NSError {
            let alert: UIAlertController
            
            switch error.code {
            case -11852:
                alert = UIAlertController(title: "Error", message: "This app is not authorized to use Back Camera.", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Setting", style: .default, handler: { (_) in
                    DispatchQueue.main.async {
                        if let settingsURL = URL(string: "\(UIApplicationOpenSettingsURLString)") {
                            UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
                        }
                    }
                }))
                
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            default:
                alert = UIAlertController(title: "Error", message: "Reader not supported by the current device", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            }
            
            present(alert, animated: true, completion: nil)
            
            return false
        }
    }
    
    override func viewDidLoad() {
        self.setNavigationButton(type: .MenuCart)
        NotificationCenter.default.post(name: kUpdateUserData, object: nil)
        super.viewDidLoad()
        QRView.isHidden = true
        // Do any additional setup after loading the view.
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.init(uptimeNanoseconds: 1)) {
            //            self.pushToOrderDetailVC()
        }
        DispatchQueue.main.async {
            self.btnScan.setCornerRadius()
            self.btnScan.dropShadow()
            //            self.showPopup()
        }
        txtCode.delegate = self
        
        self.tblHome.blockTableViewDidSelectAtIndexPath = { (indexpath, cellType) in
            
            switch cellType {
            case .Status:
                let orderDtl = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "OrderDetailVC") as! OrderDetailVC
                orderDtl.orderId = self.tblHome.arrCurrentOrder[indexpath.row].orderId
                self.navigationController?.pushViewController(orderDtl, animated: true)
                break
            case .Statestic:
                let orderDtl = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "StatisticsVC") as! StatisticsVC
                self.navigationController?.pushViewController(orderDtl, animated: true)
                break
            case .RecentOrder:
                let orderDtl = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "OrderDetailVC") as! OrderDetailVC
                orderDtl.orderId = self.tblHome.arrActivity[indexpath.row].orderId
                self.navigationController?.pushViewController(orderDtl, animated: true)
                break
            }
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getDashboardDetails()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        reader.stopScanning()
        QRView.isHidden = true
        self.hidePopup()
    }
    
    @IBAction func startScanning() {
        
        QRView.isHidden = false
        if previewView == nil {
            previewView = QRCodeReaderView()
            previewView?.frame = cameraView.bounds
            cameraView.addSubview(previewView!)
            previewView?.setupComponents(showCancelButton: false, showSwitchCameraButton: false, showTorchButton: false, showOverlayView: true, reader: reader)
        }
        
        
        self.cameraView.isHidden = false
        guard checkScanPermissions(), !reader.isRunning else { return }
        reader.didFindCode = { result in
            let code = result.value
            DispatchQueue.main.async {
                //                let alert = UIAlertController(
                //                    title: kAppName,
                //                    message: "",
                //                    preferredStyle: .alert
                //                )
                //                let noAction = UIAlertAction.init(title: "NO", style: .default, handler: { (action) in
                //                    self.reader.startScanning()
                //                })
                //
                //                let okAction = UIAlertAction.init(title: "YES", style: .default, handler: { (action) in
                self.couponCode = code
                self.getFoodCourtDetail()
                //                })
                //                alert.addAction(noAction)
                //                alert.addAction(okAction)
                //                self.present(alert, animated: true, completion: nil)
            }
            self.reader.stopScanning()
        }
        reader.startScanning()
        
    }
    
    @IBAction func hidePopup() {
        //        self.startScanning()
        self.viewPopup.removeFromSuperview()
    }
    
    
    @IBAction func btnProcessedPress() {
        let cartVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "FoodCourtVC") as! FoodCourtVC
        cartVC.foodCourt = self.foodCourt
        self.navigationController?.pushViewController(cartVC, animated: true)
    }
    
    @IBAction func benScamAgainPress() {
        self.hidePopup()
    }
    
    @IBAction func unwindBackToHome(segue:UIStoryboardSegue) { }
    @IBAction func unwindBackToOrderDetail(segue:UIStoryboardSegue) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.init(uptimeNanoseconds: 1000000000)) {
            let orderDtl = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "OrderDetailVC") as! OrderDetailVC
            self.navigationController?.pushViewController(orderDtl, animated: true)
        }
    }
}


extension HomeVC{
    func getFoodCourtDetail() {//dashboard
        UtilityClass.showHUD()
        ApiController.shared.getFoodCourt(location_id: "\(self.couponCode!)") { (success, message, response) in
            UtilityClass.hideHUD()
            if success {
                if response != nil{
                    self.foodCourt.populateWithJson(dict: response!)
                    self.showPopup()
                    self.txtCode.text = ""
                } else {
                    self.startScanning()
                    TOAST.showToast(str: message)
                }
            } else {
                self.startScanning()
                TOAST.showToast(str: message)
            }
        }
    }
    
    func getDashboardDetails() {//dashboard
        UtilityClass.showHUD()
        ApiController.shared.getDashBoardDetails{ (success, message, response) in
            UtilityClass.hideHUD()
            if success {
                if response != nil{
                    
                    self.tblHome.arrActivity.removeAll()
                    self.tblHome.arrRecentScan.removeAll()
                    self.tblHome.arrCurrentOrder.removeAll()
                    self.tblHome.sectionArray.removeAll()
                    let dashboard = DashboardClass.init(fromDictionary: response!)
                    if dashboard.currentOrders.count == 0{
                        for obj in dashboard.recentScans{
                            self.tblHome.arrRecentScan.append(obj)
                            self.tblHome.sectionArray.append(.Status)
                        }
                    }else{
                        for obj in dashboard.currentOrders{
                            self.tblHome.arrCurrentOrder.append(obj)
                            self.tblHome.sectionArray.append(.Status)
                        }
                    }
                    self.tblHome.sectionArray.append(.Statestic)
                    for obj in dashboard.activities{
                        self.tblHome.arrActivity.append(obj)
                        self.tblHome.sectionArray.append(.RecentOrder)
                    }
                    DispatchQueue.main.async {
                        self.tblHome.reloadData()
                    }
                    //self.getsectionData()
                }else{
                    self.tblHome.arrActivity.removeAll()
                    self.tblHome.arrRecentScan.removeAll()
                    self.tblHome.arrCurrentOrder.removeAll()
                    self.tblHome.sectionArray.removeAll()
                    print("********** NIL *************")
                }
            }
        }
    }
    
    //    func getsectionData(){
    //        if self.tblHome.arrCurrentOrder.count == 0{
    //            for _ in self.tblHome.arrRecentScan{
    //                self.tblHome.sectionArray.append(.Status)
    //            }
    //        }else{
    //            for _ in self.tblHome.arrCurrentOrder{
    //                self.tblHome.sectionArray.append(.Status)
    //            }
    //        }
    //        self.tblHome.sectionArray.append(.Statestic)
    //        for _ in self.tblHome.arrActivity{
    //            self.tblHome.sectionArray.append(.RecentOrder)
    //        }
    //        DispatchQueue.main.async {
    //            self.tblHome.reloadData()
    //        }
    //    }
    
    //MARK: POPUP Method
    
    func showPopup() {
        self.viewPopup.frame = kDeviceFrame
        self.lblfoodCourtName.text = checkNULL(str: foodCourt.name)
        self.lblFoodCourtAddress.text = checkNULL(str: foodCourt.address)
        self.view.addSubview(self.viewPopup)
        self.stopScanning()
    }
    
    func pushToOrderDetailVC() {
        let cartVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "RatePopupVC")
        //        cartVC.modalPresentationStyle = .custom
        self.navigationController?.pushViewController(cartVC, animated: true)
        //        self.navigationController?.present(cartVC, animated: true, completion: nil)
    }
    
    @objc func stopScanning() {
        reader.stopScanning()
    }
}
extension HomeVC:QRCodeReaderViewControllerDelegate{
    // MARK: - QRCodeReader Delegate Methods
    
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()
    }
    
    func reader(_ reader: QRCodeReaderViewController, didSwitchCamera newCaptureDevice: AVCaptureDeviceInput) {
        print("Switching capturing to: \(newCaptureDevice.device.localizedName)")
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()
    }
    
}
extension HomeVC:UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.text?.trim().count != 0 {
            self.couponCode = self.txtCode.text!
            self.getFoodCourtDetail()
        }
    }
}
