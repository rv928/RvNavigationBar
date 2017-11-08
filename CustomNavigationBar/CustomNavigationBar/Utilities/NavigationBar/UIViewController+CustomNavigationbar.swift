//
//  UIViewController+CustomNavigationbar.swift
//  CustomNavigationBar
//
//  Created by Ravi Vora on 23/02/16.
//  Copyright © 2016 Ravi Vora. All rights reserved.
//

import UIKit

extension UIViewController{
    
    // MARK: Predefined Structure -
    
    struct TobBarSize{
        static let x = CGFloat(0.0)
        static let y = CGFloat(0.0)
        static let width = CGFloat(0.0)
        static let height = CGFloat(64.0)
        
    }
    
    struct LeftBarItemsSize{
        static let x = 0.0
        static let y = 0.0
        static let width = 40.0
        static let height = 40.0
        
    }
    
    struct RightBarItemsSize{
        static let x = 0.0
        static let y = 0.0
        static let width = 40.0
        static let height = 40.0
    }
    
    struct FixedSpace{
        static let fixedSpacebetweenBarItem = CGFloat(20.0)
    }
    
    // MARK: TopBar Methods -
    // MARK: TopBar Display
    var showCustomTopBar : Bool {
        set {
            if(newValue)
            {
                if(self.navigationController == nil)
                {
                    let navigationBar = UINavigationBar(frame: CGRect(x: TobBarSize.x,y: TobBarSize.y,width: self.view.frame.size.width,height: TobBarSize.height)) // Offset by 20 pixels vertically to take the status bar into account
                    self.view.addSubview(navigationBar)
                    
                }else{
                    self.navigationController?.isNavigationBarHidden = false
                }
            }else{
               self.navigationController?.isNavigationBarHidden = true
             }
        }
        get{
        return self.showCustomTopBar
      }
    }
    // MARK: TopBar Color
    var topBarColor : UIColor {
        set {
            self.navigationController?.navigationBar.barTintColor = newValue
        }
        get
        {
            return self.topBarColor
        }
    }
    // MARK: TopBar Title
    var topBarTitle : String {
        set {
            self.navigationController?.navigationBar.topItem?.title = newValue
        }
        get
        {
            return self.topBarTitle
        }
    }
    // MARK: TopBar TitleTextColorAndFont
    var topBarTitleTextColorAndFont : NSDictionary {
        set {
            self.navigationController?.navigationBar.titleTextAttributes = newValue as? [NSAttributedStringKey : Any]
        }
        get
        {
            return self.topBarTitleTextColorAndFont
        }
    }
    
    
    // MARK: TopBar Background Image
    
    var topBarBackgroundImage : UIImage {
        set {
            let navBackgroundImage:UIImage! = newValue
            UINavigationBar.appearance().setBackgroundImage(navBackgroundImage, for: .default)
        }
        get
        {
            return self.topBarBackgroundImage
            
        }
    }

    // MARK: TopBar Title Image
    var topBarTitleImage : UIImage {
        set {
            let imageView = UIImageView(image:newValue)
            self.navigationItem.titleView = imageView
        }
        get
        {
            return self.topBarTitleImage
            
        }
    }
    // MARK: TopBar Prompt
    var topBarPrompt : String {
        set {
            self.navigationItem.prompt = newValue
        }
        get
        {
            return self.topBarPrompt
        }
    }
    
    // MARK: -
    // MARK: Left Bar Methods -
    var leftBarButtons : Array<AnyObject> {
        
        set
        {
            var array = [UIBarButtonItem]()
            
            for (index, title) in newValue.enumerated()
            {
                if title is String
                {
                    let b = UIBarButtonItem(title: title as? String, style: .plain, target: self, action: #selector(UIViewController.leftAction(_:)))
                    b.tag = index
                    array.append(b)
                }
                    
                else if title is UIImage
                {
                    let b = UIBarButtonItem(image: title as? UIImage, style: .plain, target: self, action: #selector(UIViewController.leftAction(_:)))
                    b.tag = index
                    array.append(b)
                }
                else if title is Int
                {
                    let b = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.bookmarks , target: self, action: #selector(UIViewController.leftAction(_:)))
                    b.tag = index
                    array.append(b)
                    
                }
                else
                {
                    array.append(title as! UIBarButtonItem)
                    (title as! UIBarButtonItem).tag = index
                }
            }
            self.navigationItem.leftBarButtonItems = array
        }
        get
        {
            return self.leftBarButtons
        }
    }

    
    
    var leftCustomBarButtons : Array<AnyObject> {
        
        set {
            var array = [UIBarButtonItem]()
        
            for (index, title) in newValue.enumerated()
            {
                if title is String
                {
                    
                    if title as! String == NavigationBarConstant.NavigationBarButtonTitle.FixedSpace.rawValue {
                        
                        let fixedSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
                        
                        if (AppConstants.DeviceType.IS_IPAD){
                            fixedSpace.width = FixedSpace.fixedSpacebetweenBarItem
                        }else{
                            fixedSpace.width = 0
                        }
                        array.append(fixedSpace)
                        
                    }else{
                        
                        let btnName = UIButton()
                        btnName.setTitle(title as? String, for: UIControlState())
                        btnName.frame = CGRect(x: LeftBarItemsSize.x, y: LeftBarItemsSize.y, width: LeftBarItemsSize.width, height: LeftBarItemsSize.height)
                        btnName.addTarget(self, action: #selector(UIViewController.leftAction(_:)), for: .touchUpInside)
                        let leftBarButton = UIBarButtonItem()
                        leftBarButton.customView = btnName
                        btnName.sizeToFit()
                        btnName.tag = self.getLeftBarButtonIndex(index)
                        array.append(leftBarButton)
                    }
                    
                    
                }
                else if title is UIImage
                {
                    let btnName = UIButton()
                    btnName.setImage(title as? UIImage, for: UIControlState())
                    btnName.frame = CGRect(x: LeftBarItemsSize.x, y: LeftBarItemsSize.y, width: LeftBarItemsSize.width, height: LeftBarItemsSize.height)
                    btnName.addTarget(self, action: #selector(UIViewController.leftAction(_:)), for: .touchUpInside)
                    let leftBarButton = UIBarButtonItem()
                    leftBarButton.customView = btnName
                    btnName.tag = self.getLeftBarButtonIndex(index)
                    array.append(leftBarButton)
                    btnName.sizeToFit()

                }
                else
                {
                    let leftBarButton = UIBarButtonItem()
                    leftBarButton.customView = title as? UIView
                    array.append(leftBarButton)
                }
            }
            self.navigationItem.leftBarButtonItems = array
        }
        get
        {
            return self.leftCustomBarButtons
            
        }
    }
    
     @objc func leftAction(_ button : UIButton) -> Void
    {
        self.leftCustomButtonClicked(button.tag)
    }
    func leftCustomButtonClicked(_ index : NSInteger) -> Void
    {
    }
    
    // MARK: -
    // MARK: Right Bar Methods -
    
    var rightBarButtons : Array<AnyObject> {
        
        set
        {
            var array = [UIBarButtonItem]()
            
            for (index, title) in newValue.enumerated()
            {
                if title is String
                {
                    let b = UIBarButtonItem(title: title as? String, style: .plain, target: self, action: #selector(UIViewController.rightAction(_:)))
                    b.tag = index
                    array.append(b)
                }
                    
                else if title is UIImage
                {
                    let b = UIBarButtonItem(image: title as? UIImage, style: .plain, target: self, action: #selector(UIViewController.rightAction(_:)))
                    b.tag = index
                    array.append(b)
                }
                else if title is Int
                {
                    let b = UIBarButtonItem(barButtonSystemItem:title as! UIBarButtonSystemItem, target: self, action: #selector(UIViewController.rightAction(_:)))
                    b.tag = index
                    array.append(b)
                }
                else
                {
                    array.append(title as! UIBarButtonItem)
                    (title as! UIBarButtonItem).tag = index
                }
            }
            self.navigationItem.rightBarButtonItems = array
        }
        
        get
        {
            return self.rightBarButtons
        }
        
    }

    var rightCustomBarButtons : Array<AnyObject> {
        
        set {
            
            var array = [UIBarButtonItem]()
            for (index, title) in newValue.enumerated()
            {
                if title is String
                {
                    
                    if title as! String == NavigationBarConstant.NavigationBarButtonTitle.FixedSpace.rawValue {
                        
                        let fixedSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
                        
                        if (AppConstants.DeviceType.IS_IPAD)
                        {
                            fixedSpace.width = FixedSpace.fixedSpacebetweenBarItem
                        }else{
                            
                            fixedSpace.width = 0
                        }
                        array.append(fixedSpace)
                        
                    }else{
                        
                        let btnName = UIButton()
                        
                        btnName.setTitle(title as? String, for: UIControlState())
                        btnName.frame = CGRect(x: RightBarItemsSize.x, y: RightBarItemsSize.y, width: RightBarItemsSize.width, height: RightBarItemsSize.height)
                        btnName.addTarget(self, action: #selector(UIViewController.rightAction(_:)), for: .touchUpInside)
                        //btnName.tag = index
                        btnName.tag = self.getRightBarButtonIndex(index)
                        let rightBarButton = UIBarButtonItem()
                        rightBarButton.customView = btnName
                        btnName.sizeToFit()
                        array.append(rightBarButton)
                        
                    }
                    
                }
                else if title is UIImage
                {
                        let btnName = UIButton()
                        
                        btnName.setImage(title as? UIImage, for: UIControlState())
                        btnName.frame = CGRect(x: RightBarItemsSize.x, y: RightBarItemsSize.y, width: RightBarItemsSize.width, height: RightBarItemsSize.height)
                        btnName.addTarget(self, action: #selector(UIViewController.rightAction(_:)), for: .touchUpInside)
                        btnName.tag = self.getRightBarButtonIndex(index)
                        let rightBarButton = UIBarButtonItem()
                        rightBarButton.customView = btnName
                        array.append(rightBarButton)
                        btnName.sizeToFit()
                }
                else
                {
                    let rightBarButton = UIBarButtonItem()
                    rightBarButton.customView = title as? UIView
                    array.append(rightBarButton)
                }
                
            }
            self.navigationItem.rightBarButtonItems = array
        }
        get
        {
            return self.rightCustomBarButtons
            
        }
    }
    
    @objc func rightAction(_ button : UIButton) -> Void
    {
        self.rightCustomButtonClicked(button.tag)
    }
    
    func rightCustomButtonClicked(_ index : NSInteger) -> Void
    {
        
    }
    
    // MARK: -
    // MARK: Get Index Methods -
    
    func getRightBarButtonIndex(_ Index:Int) -> Int {
        
        var buttonIndex : Int
        buttonIndex = 0
        
        switch Index {
            
        case 0:
            buttonIndex = NavigationBarConstant.RightNavigationBarButtonIndex.sort.rawValue
            break
            
        case 1:
            buttonIndex = NavigationBarConstant.RightNavigationBarButtonIndex.search.rawValue
        case 2:
            buttonIndex = NavigationBarConstant.RightNavigationBarButtonIndex.refresh.rawValue
            break
        default:
            break
            
        }
        
        return buttonIndex
    }
    
    func getLeftBarButtonIndex(_ Index:Int) -> Int {
        
        var buttonIndex : Int
        buttonIndex = 0
        
        switch Index {
            
        case 0:
            buttonIndex = NavigationBarConstant.LeftNavigationBarButtonIndex.sideMenu.rawValue
            break
            
        case 1:
            buttonIndex = NavigationBarConstant.LeftNavigationBarButtonIndex.back.rawValue
            break
            
        default:
            break
            
        }
        
        return buttonIndex
    }
    
    
}
