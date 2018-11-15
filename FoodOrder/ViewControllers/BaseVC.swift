//
//  ViewController.swift
//  FoodOrder
//
//  Created by Rohan on 28/08/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController


class BaseVC: UIViewController {
    
    enum ButtonType {
        case NIL
        case BackGreen
        case BackBlack
        case Menu
        case MenuCart
        case BackCart
        case BackSearchWhite
        case BackSearchBlack
    }
    
    var titleView = UIStackView.init()
    var btnSearch: UIButton!
    var btnBack: UIButton!
    var txtField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.addTitleView(title: nil, subtitle: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setNavigationButton(type: ButtonType) {
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        switch type {
        case .NIL:
            self.setLeftBArButtonNIl()
            break
        case .BackGreen:
            self.setLeftBackBarButtonItem(isGreen: true)
            break
        case .BackBlack:
            self.setLeftBackBarButtonItem(isGreen: false)
            break
        case .Menu:
            self.setMenuButton()
            break
        case .MenuCart:
            self.setMenuButton()
            self.setCartButton()
            break
        case .BackCart:
            self.setLeftBackBarButtonItem(isGreen: false)
            self.setCartButton()
            break
        case .BackSearchWhite:
            self.setLeftBackBarButtonItem(isBlack: true)
            self.setSearchButton(isblack: false)
            break
        case .BackSearchBlack:
            self.setLeftBackBarButtonItem(isGreen: false)
            self.setSearchButton(isblack: true)
            break
        }
        
    }

    func setLeftBackBarButtonItem(isGreen: Bool) {
        let backBtn = UIButton.init()
        NSLayoutConstraint.activate([
            backBtn.heightAnchor.constraint(equalToConstant: 44),
            backBtn.widthAnchor.constraint(equalToConstant: 35)
            ])
        backBtn.setImage(UIImage.init(named: isGreen ? "back_green" : "back_black"), for: .normal)
        backBtn.imageEdgeInsets = (isGreen ? UIEdgeInsetsMake(14.5, 0, 14.5, 17) : UIEdgeInsetsMake(14.5, 0.35, 14.5, 16.35))
        backBtn.addTarget(self, action: #selector(self.popTo), for: UIControlEvents.touchUpInside)
        self.navigationItem.setLeftBarButton(UIBarButtonItem.init(customView: backBtn), animated: true)
    }
    
    func setRightBarButtonItem(title: String, selector: Selector) {
        
        let btn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 70, height: 30))
        btn.titleLabel?.font = Font.setAveNirNextPro(font: .Medium, size: getProportionalFont(size: 15.7))
        btn.titleLabel?.textAlignment = .right
        btn.setTitleColor(UIColor.setGreenColor(), for: .normal)
        btn.setTitle(title, for: .normal)
        btn.addTarget(self, action: selector, for: UIControlEvents.touchUpInside)
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 70, height: 30))
        view.addSubview(btn)
        self.navigationItem.setRightBarButton(UIBarButtonItem.init(customView: view), animated: true)
        
    }
    
    func setLeftBArButtonNIl() {
        self.navigationItem.setLeftBarButton(UIBarButtonItem.init(customView: UIView()), animated: true)
    }
    
    func setMenuButton() {
        let backBtn = UIButton.init()
        backBtn.setImage(UIImage.init(named: "menu"), for: .normal)
        backBtn.adjustsImageSizeForAccessibilityContentSizeCategory = false
        NSLayoutConstraint.activate([
            backBtn.heightAnchor.constraint(equalToConstant: 44),
            backBtn.widthAnchor.constraint(equalToConstant: 35)
            ])
        backBtn.imageEdgeInsets = UIEdgeInsetsMake(14, 0, 14, 12)
        backBtn.addTarget(self, action: #selector(self.toggleLeftSideMenutapped(_:)), for: UIControlEvents.touchUpInside)
        self.navigationItem.setLeftBarButton(UIBarButtonItem.init(customView: backBtn), animated: true)
    }
    
    func setCartButton() {
        let backBtn = UIButton.init()
        backBtn.adjustsImageSizeForAccessibilityContentSizeCategory = false
        NSLayoutConstraint.activate([
            backBtn.heightAnchor.constraint(equalToConstant: 44),
            backBtn.widthAnchor.constraint(equalToConstant: 35)
            ])
        backBtn.setImage(UIImage.init(named: "cart"), for: .normal)
        backBtn.imageEdgeInsets = UIEdgeInsetsMake(12, 9.5, 12, 0)
        backBtn.addTarget(self, action: #selector(self.btnCartPress), for: UIControlEvents.touchUpInside)
        self.navigationItem.setRightBarButton(UIBarButtonItem.init(customView: backBtn), animated: true)
    }
    
    func setSearchButton(isblack: Bool) {
        btnSearch = UIButton.init()
        btnSearch.adjustsImageSizeForAccessibilityContentSizeCategory = false
        NSLayoutConstraint.activate([
            btnSearch.heightAnchor.constraint(equalToConstant: 44),
            btnSearch.widthAnchor.constraint(equalToConstant: 35)
            ])
        btnSearch.setImage(UIImage.init(named: isblack ? "search_black" : "search_white"), for: .normal)
        btnSearch.imageEdgeInsets = UIEdgeInsetsMake(12, 8, 12, 8)
        btnSearch.addTarget(self, action: #selector(self.btnCartPress), for: UIControlEvents.touchUpInside)
        self.navigationItem.setRightBarButton(UIBarButtonItem.init(customView: btnSearch), animated: true)
    }
    
    func setLeftBackBarButtonItem(isBlack: Bool) {
        btnBack = UIButton.init()
        NSLayoutConstraint.activate([
            btnBack.heightAnchor.constraint(equalToConstant: 44),
            btnBack.widthAnchor.constraint(equalToConstant: 35)
            ])
        btnBack.setImage(UIImage.init(named: isBlack ? "back_white" : "back_black"), for: .normal)
        btnBack.imageEdgeInsets = (UIEdgeInsetsMake(14.5, 0.35, 14.5, 16.35))
        btnBack.addTarget(self, action: #selector(self.popTo), for: UIControlEvents.touchUpInside)
        self.navigationItem.setLeftBarButton(UIBarButtonItem.init(customView: btnBack), animated: true)
    }
    
    func setNavigationImage(isBlack: Bool) {
        btnSearch.setImage(UIImage.init(named: isBlack ? "search_black" : "search_white"), for: .normal)
        btnBack.setImage(UIImage.init(named: isBlack ? "back_black" : "back_white"), for: .normal)
    }
    
    
    //MARK: NAvigation left title with subtitle
    
    func addTitleView(title: String?, subtitle: String?, isTextField: Bool = false) {
        
        
        if isTextField == true {
            txtField = UITextField()
            txtField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                txtField.widthAnchor.constraint(equalToConstant: kPresentedViewWidth - 125),
                txtField.heightAnchor.constraint(equalToConstant: 35)
                ])
            txtField.text = "Dominoz"
            txtField.font = Font.setAveNirNextPro(font: .Demi, size: 17, isChangeAsPerDevice: false)
            self.navigationItem.titleView = txtField
            return
        }
        
        if let titleStr = title {
            titleView.axis = .vertical
//            titleView.distribution = .
            
            titleView.translatesAutoresizingMaskIntoConstraints = false
            titleView.backgroundColor = UIColor.red
            let lblTitle = LabelAveNirNextProBlackDemi.init(frame: CGRect.zero)
            lblTitle.font = Font.setAveNirNextPro(font: .Demi, size: 17, isChangeAsPerDevice: false)
            lblTitle.textColor = UIColor.customBlackColor()
            lblTitle.text = titleStr
            titleView.addArrangedSubview(lblTitle)
            NSLayoutConstraint.activate([
                titleView.widthAnchor.constraint(equalToConstant: kPresentedViewWidth - 125),
                titleView.heightAnchor.constraint(equalToConstant: 35)
                ])
            self.navigationItem.titleView = titleView
        }
        
        if let subtitleStr = subtitle {
            let lblTitle = LabelAveNirNextProGrayMedium.init(frame: CGRect.zero)
            lblTitle.font = Font.setAveNirNextPro(font: .Medium, size: 11.3)
            lblTitle.textColor = UIColor.colorGray()
            lblTitle.text = subtitleStr
            titleView.addArrangedSubview(lblTitle)
        }
        
        
        
        
        
        
    }
    //MARK:--
    
    @objc func popTo() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func pushTo(viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    //MARK: GO To Sigin In
    
    @objc func btnSignUpPress() {
        let signUpVC = STORYBOARD_LOGIN.instantiateViewController(withIdentifier: "SignUpVC")
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    //MARK: SideMenuToggle
    
    @IBAction func toggleRightSideMenutapped(_ sender: AnyObject) {
        SJSwiftSideMenuController.toggleRightSideMenu()
    }
    // left menu toggle
    @IBAction func toggleLeftSideMenutapped(_ sender: AnyObject) {
        SJSwiftSideMenuController.toggleLeftSideMenu()
    }
    
    //Cart Screen
    //
    @objc func btnCartPress() {
        let cartVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "MyCartVC")
        self.navigationController?.pushViewController(cartVC, animated: true)
    }
    
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
}
