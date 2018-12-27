//
//  FoodCourtDetailVC.swift
//  FoodOrder
//
//  Created by Rohan on 30/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

enum CellStoreType {
    case Header
    case Recomanded
    case Normal
}

class FoodCourtDetailVC: BaseVC, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var catView: UIView!
    @IBOutlet var fullCatView: UIView!
    @IBOutlet var tblCat: TableViewCategory!
    @IBOutlet var constraintHeight: NSLayoutConstraint!
    @IBOutlet var constraintHeightCartView: NSLayoutConstraint!
    var isWhiteNav = false
    var storeData = StoreData()
    var searchStoreData = StoreData()
    var foodCourt: Restaurants!
    @IBOutlet var lblCartItem: LabelAveNirNextProDemiWhite!
    var cart = JSONDICTIONARY()
    var totalValue: Int32! =  0
    var searchStr: String! = ""
    var searchEnable = false
    
    override func viewDidLoad() {
        self.setNavigationButton(type: .BackSearchWhite, selector: #selector(self.btnSearchPress))
        self.addTitleView(title: nil, subtitle: nil, isTextField: true)
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "CellMainHeader" , bundle: nil), forCellWithReuseIdentifier: "CellMainHeader")
        collectionView.register(UINib(nibName: "CellRecommendedItem" , bundle: nil), forCellWithReuseIdentifier: "CellRecommendedItem")
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        collectionView.register(UINib(nibName: "CellFoodCourtItem" , bundle: nil), forCellWithReuseIdentifier: "CellFoodCourtItem")
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "collectionHeaderID")

        //
        // Do any additional setup after loading the view.
        
        self.collectionView.backgroundColor = UIColor.white
        catView.clipsToBounds = false
        catView.layer.shadowColor = UIColor.black.cgColor
        catView.layer.shadowOpacity = 0.7
        catView.layer.shadowOffset = CGSize.init(width: 0, height: 3)
        catView.layer.shadowRadius = 6
//        catView.layer.shadowPath = UIBezierPath(roundedRect: catView.bounds, cornerRadius: 19).cgPath
        catView.layer.cornerRadius = 19
        //catView.
//        catView.clipsToBounds = true
        fullCatView.frame = kDeviceFrame
        fullCatView.isHidden = true
        self.navigationController?.view.addSubview(fullCatView)
        
        getFoodCourtMenu()
        
        self.txtField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.setupCart), name: NSNotification.Name(rawValue: "setupCart"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.isStatusBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.isStatusBarHidden = false
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.storeData.menu.searchHeader.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.storeData.menu.searchFoodType[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellMainHeader", for: indexPath)  as! CellMainHeader
                cell.lblRate.text = "\(self.storeData.ratings!)"
                cell.lblReasturantName.text = checkNULL(str: self.storeData.restaurantName)
                cell.lblCategories.text = checkNULL(str: self.storeData.categoriesString)
                cell.setBannerData(baner: self.storeData.banners)
                
                if self.storeData.menu.foodType[0].count == 0 {
                    cell.lblHeader.text = ""
                } else {
                    cell.lblHeader.text = "Recommended"
                }
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellRecommendedItem", for: indexPath)  as! CellRecommendedItem
                if indexPath.row%2 != 0 {
                    cell.leftConstraint.constant = getProportionalWidth(width: 20)
                    cell.rightConstraint.constant = 0
                } else {
                    cell.leftConstraint.constant = 0
                    cell.rightConstraint.constant = getProportionalWidth(width: 20)
                }
                cell.backgroundColor = UIColor.white
                return cell
            }
        } else {
            let menu = self.storeData.menu.searchFoodType[indexPath.section][indexPath.item]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellFoodCourtItem", for: indexPath)  as! CellFoodCourtItem
            cell.menuData = menu
            if menu.customizeOption! == true {
                cell.lblName.text = checkNULL(str: menu.itemName + " (c)")
                if let itemCount = CartData.shared.items.filter({ (menuData) -> Bool in
                    return "\(menu.id!)" == "\(menuData.id!)"
                }) as [MenuData]? {
                    cell.valueSteper.valueLabel.text = "\(itemCount.count)"
                } else {

                }
            } else {
                cell.lblName.text = checkNULL(str: menu.itemName)
                cell.valueSteper.valueLabel.text = "\(menu.addedInCartValue!)"
            }
            cell.valueSteper.valueLabel.text = "\(menu.addedInCartValue!)"
            cell.lblPrice.text = checkNULL(str: menu.itemPrice).add$Tag()
            cell.imgVagNonVeg.image = menu.isVeg == "1" ? UIImage.init(named: "veg") : UIImage.init(named: "non_veg")
            
        
            if cell.valueSteper.valueLabel.text == "0" {
                cell.btnAdd.isHidden = false
            } else {
                cell.btnAdd.isHidden = true
                cell.valueSteper.value = Double.init(menu.addedInCartValue!)
            }
            
            func getAddOnsData() {
                ApiController.shared.getAddOns(item_id: menu.id!, completionHandler: { (success, message, response) in
                    if success == true {
                        if response != nil {
                            let addon = AddOns.init(fromDictionary: response!)
                            let rateView = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "RatePopupVC") as! RatePopupVC
                            rateView.isRate = false
                            rateView.modalPresentationStyle = .custom
                            rateView.addOn = addon
                            rateView.item = menu
                            self.present(rateView, animated: true, completion: nil)
                        }
                    }
                })
            }
            
            
            cell.blockTableViewDidSelectAtIndexPath = { (button) in
                
                CartData.shared.address = self.storeData.restaurantAddress!
                CartData.shared.name = self.storeData.restaurantName!
                CartData.shared.image = self.storeData.picture!
                CartData.shared.restaurent_id = self.storeData.foodCourtId!
                
                self.constraintHeightCartView.constant = 57.7
                
                print("Customization Avaliable \(menu.customizeOption!)")
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.view.layoutIfNeeded()
                })
                
                if menu.customizeOption! == true {
                    getAddOnsData()
                } else {
                    
                    if let cItem = CartData.shared.items.first(where: { (data) -> Bool in
                        return "\(menu.id!)" == "\(data.id!)"
                    }) {
                        cItem.addedInCartValue = Int.init(cell.valueSteper.value)
                    } else {
                        menu.addedInCartValue = Int.init(cell.valueSteper.value)
                        CartData.shared.items.append(menu)
                    }
                    self.setupCart()
                }
            }
            
            cell.blockTableViewSteperPlusPress = { (steper) in
                
                if menu.addedInCartValue! != Int.init(steper.value) {
                    
                        if let cItem = CartData.shared.items.first(where: { (itemOBj) -> Bool in
                            return "\(menu.id!)" == "\(itemOBj.id!)"
                        }) {
                            if menu.customizeOption! == false {
                                cItem.addedInCartValue = Int.init(steper.value)
                                if steper.value == 0 {
                                    if let index = CartData.shared.items.firstIndex(where: { (itemData) -> Bool in
                                        return "\(itemData.id!)" == "\(cItem.id!)"
                                    }) {
                                        CartData.shared.items.remove(at: index)
                                    }
                                }
                            } else {
                                getAddOnsData()
                            }
                            
                        } else {
                            if menu.customizeOption! == false {
                                menu.addedInCartValue = Int.init(steper.value)
                                CartData.shared.items.append(menu)
                            } else {
                                getAddOnsData()
                            }
                        }
                }
                self.setupCart()
            }
            
            cell.blockTableViewSteperMinusPress = { (steper) in
                if let cItem = CartData.shared.items.first(where: { (itemOBj) -> Bool in
                    return "\(menu.id!)" == "\(itemOBj.id!)"
                }) {
                    
                    cItem.addedInCartValue = Int.init(steper.value)
                    if steper.value == 0 {
                        if let index = CartData.shared.items.firstIndex(where: { (itemData) -> Bool in
                            return "\(itemData.id!)" == "\(cItem.id!)"
                        }) {
                            CartData.shared.items.remove(at: index)
                        }
                    }
                    
                }
                self.setupCart()
            }
            
            return cell
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return CGSize(width: collectionView.frame.size.width, height: getProportionalWidth(width: 340))
            } else {
                let width = collectionView.frame.size.width / 2
                return CGSize.init(width: width - 10, height: collectionView.frame.size.width / 2)
            }
        } else {
            let width = collectionView.frame.size.width
            return CGSize.init(width: width, height: 50)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: collectionView.frame.width, height: 0) //add your height here
        } else {
            return CGSize(width: collectionView.frame.width, height: 13.7 + 22 + 10) //add your height here
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionElementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "collectionHeaderID", for: indexPath)
            headerView.clipsToBounds = true
            headerView.backgroundColor = UIColor.setColor(red: 244, green: 244, blue: 244)
            let whiteView = UIView()
            whiteView.frame = CGRect.init(x: 0, y: 13.7, width: kPresentedViewWidth, height: 22 + 30)
            whiteView.backgroundColor = UIColor.white
            headerView.addSubview(whiteView)
            
            let lblheader = UILabel()
            lblheader.text = storeData.menu.foodHeader[indexPath.section]
            lblheader.font = Font.setAveNirNextPro(font: .Bold, size: 17)
            lblheader.frame = CGRect.init(x: getProportionalWidth(width: 18.7), y: 20, width: 200, height: 30)
            lblheader.textColor = UIColor.black
            headerView.addSubview(lblheader)
            
            return headerView
            
        default:
            return UICollectionReusableView()
            //assert(false, "Unexpected element kind")
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        NSLog("Table view scroll detected at offset: %f", scrollView.contentOffset.y)
        
        
        if let vc = self.collectionView.parentViewController {
            
            
            
            if txtField.isFirstResponder {
                
                setheader(vc: vc)
                return
            }
            
            if scrollView.contentOffset.y > 50 {
                
                if isWhiteNav == false {
                    isWhiteNav = true
                }
                setheader(vc: vc)
//                self.addTitleView(title: "Domino’s Pizza", subtitle: "")
                
            } else {
                vc.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                vc.navigationController?.navigationBar.shadowImage = UIImage()
                self.setNavigationImage(isBlack: false)
                self.txtField.text = ""
            }
        }
    }
    func setheader(vc: UIViewController) {
        vc.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        vc.navigationController?.navigationBar.shadowImage = nil
        self.setNavigationImage(isBlack: true)
        self.txtField.text = searchStr.count == 0 ? checkNULL(str: self.storeData.restaurantName) : searchStr
    }
    
    @IBAction func btnCategoryPress() {
        fullCatView.isHidden = false
        fullCatView.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.fullCatView.alpha = 1
        }) { (copmletion) in
        }
    }
    
    @IBAction func btnViewCartPress() {
        let cartVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "MyCartVC") as! MyCartVC
        if self.cart.count > 0 {
            cartVC.hideViewEmpty = true
        }
        self.navigationController?.pushViewController(cartVC, animated: true)
    }

    func getFoodCourtMenu() {
        UtilityClass.showHUD()//foodCourt.id!
        ApiController.shared.getFoodStoreDetail(restaurant_id: "\(1)") { (success, message, response) in
            UtilityClass.hideHUD()
            if success {
                if response != nil {
                    self.storeData = StoreData.init(fromDictionary: response!)
                    self.storeData.menu.searchHeader = self.storeData.menu.foodHeader
                    self.storeData.menu.searchFoodType = self.storeData.menu.foodType
                    self.collectionView.reloadData()
                    
                    if self.storeData.categories != nil {
                        self.tblCat.arrCateory = self.storeData.categories!
                        self.tblCat.reloadData()
                        self.constraintHeight.constant = CGFloat(40 * 7) + 30.0
                        self.tblCat.blockTableViewDidSelectAtIndexPath = { (indexPath, str) in
                            self.fullCatView.alpha = 1
                            UIView.animate(withDuration: 0.5, animations: {
                                self.fullCatView.alpha = 0
                            }) { (copmletion) in
                                self.fullCatView.isHidden = true
                            }
                            self.tblCat.arrCateory[indexPath.row].isSelected = true
                            self.tblCat.reloadData()
                            
                            if let index = self.storeData.menu.foodHeader.firstIndex(where: { (strHeader) -> Bool in
                                return strHeader == str
                            }) {
                                print(index)
                                self.collectionView.scrollToItem(at: IndexPath.init(row: 0, section: index), at: UICollectionViewScrollPosition.bottom, animated: true)
                            }
                        }
                    }
                }
            }
            
            if self.storeData.menu.searchHeader.count == 0 {
                self.popTo()
            }
            
        }
    }
    
    //MARK: SearchPress
    
    @objc func btnSearchPress() {
        
        if self.txtField.isFirstResponder {
            txtField.resignFirstResponder()
            txtField.text = searchStr.count == 0 ? checkNULL(str: self.storeData.restaurantName) : searchStr
        } else {
            txtField.becomeFirstResponder()
            searchEnable = true
            isWhiteNav = true
            setheader(vc: self)
            txtField.text = searchStr.count == 0 ? "" : searchStr
        }
    }
    
    @objc func setupCart() {
        
        var totalItem: Int! = 0
        var totalPrice: Double! = 0
        for itemObj in CartData.shared.items {
            let count = itemObj.addedInCartValue!
            totalItem =  totalItem + itemObj.addedInCartValue!
            totalPrice = totalPrice + ((Double.init(count) * Double.init(itemObj.itemPrice!)!))
            itemObj.totalPrice = totalPrice
        }
        
        let item = totalItem == 1 ? "item" : "items"
        self.lblCartItem.text = "\(totalItem!) \(item) | " + "\(String.init(format: "%.2f", totalPrice!))".add$Tag()
        if CartData.shared.items.count == 0 {
            self.constraintHeightCartView.constant = 0
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            })
        }
        self.collectionView.reloadData()
    }
}


extension FoodCourtDetailVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        searchStr = newText
        self.storeData.menu.searchDataWithDict(str: searchStr)
        self.collectionView.reloadData()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == self.storeData.restaurantName {
            textField.text = ""
        }
    }
}
