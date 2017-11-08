//
//  RvnavigationBar.swift
//  CustomNavigationBar
//
//  Created by Ravi Vora on 08/11/17.
//  Copyright © 2017 Ravi Vora. All rights reserved.
//

import Foundation
import UIKit


class RvnavigationBar {
    
    static let sharednavigationBar : RvnavigationBar = {
        let instance = RvnavigationBar()
        return instance
    }()
    
    
    func setNavigationBar(_ viewController:UIViewController?) {
        
        let className = NSStringFromClass(viewController!.classForCoder).components(separatedBy: ".").last
        let keyVC = className! as String
        
        let navDict : NSDictionary
        if let path = Bundle.main.path(forResource: AppConstants.NavigationBarPlist, ofType: "plist") {
            navDict = NSDictionary(contentsOfFile: path)!
            
            let dictionary1:Dictionary<String,Any> = navDict[className!] as! Dictionary<String,Any>
            
            viewController!.showCustomTopBar = (dictionary1[NavigationBarConstant.NavigationBarItems.showTopBar] as? Bool)!
            viewController!.topBarTitle = (dictionary1[NavigationBarConstant.NavigationBarItems.barTitle] as? String)!
            viewController!.topBarTitleTextColorAndFont = [NSAttributedStringKey.font:UIConstant.Fonts.FONT_HELVETICA_LIGHT(20), NSAttributedStringKey.foregroundColor:colorWithHexStringAndAlpha(UIConstant.NavigationBar.titleTextColor, alpha: 1.0)]
            
            
            let part2:NSDictionary = navDict[keyVC] as! NSDictionary
            
            var leftInputArray: Array<AnyObject> = Array<AnyObject>()
            leftInputArray = part2[NavigationBarConstant.NavigationBarItems.leftCustomBarButtons] as! Array<AnyObject>
            
            var leftoutputArrayList: Array<AnyObject> = Array<AnyObject>()
            
            for (_, element) in leftInputArray.enumerated() {
                let str = element as! String
                if str.range(of: NavigationBarConstant.NavigationBarComponents.isImage) != nil{
                    let arrLeft = str.split(separator: ".").map(String.init)
                    let imageName = arrLeft[0]
                    leftoutputArrayList.append(UIImage(named:imageName)!)
                }
            }
            
            
            var rightInputArray: Array<AnyObject> = Array<AnyObject>()
            rightInputArray = part2[NavigationBarConstant.NavigationBarItems.rightCustomBarButtons] as! Array<AnyObject>
            
            var rightoutputArrayList: Array<AnyObject> = Array<AnyObject>()
            
            for (_, element) in rightInputArray.enumerated() {
                let str = element as! String
                if str.range(of: NavigationBarConstant.NavigationBarComponents.isImage) != nil{
                    let arrRight = str.split(separator: ".").map(String.init)
                    let imageName = arrRight[0]
                    rightoutputArrayList.append(UIImage(named:imageName)!)
                }
                else
                {
                    rightoutputArrayList.append(str as AnyObject)
                    
                }
            }
            
            viewController!.leftCustomBarButtons = leftoutputArrayList
            viewController!.rightCustomBarButtons = rightoutputArrayList
            
            let navColor:String = navDict[NavigationBarConstant.NavigationBarItems.barColor] as! String
            
            viewController?.navigationController?.navigationBar.barTintColor = RvnavigationBar.sharednavigationBar.colorWithHexStringAndAlpha(navColor, alpha: 1.0)
            /*
             if #available(iOS 11.0, *) {
             viewController?.navigationController?.navigationBar.prefersLargeTitles = true
             } else {
             // Fallback on earlier versions
             }
                */
        }
        
    }
    
    func setnavigationBarImageAndStatusBarStyle() {
        
        UIApplication.shared.statusBarStyle = .lightContent
        
    }
    
    // MARK: UIColor Modification methods
    
    
    func colorWithHexStringAndAlpha(_ hexString: String, alpha:CGFloat) -> UIColor {
        
        // Convert hex string to an integer
        let hexint = Int(self.intFromHexString(hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        let alpha = alpha
        
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    
    func intFromHexString(_ hexStr: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexStr)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
    
    // MARK: Hide UI Components
    
    func hideNavigationbar(_ viewController:UIViewController,isHide:Bool) {
        
        if isHide == true {
            viewController.navigationController?.isNavigationBarHidden = true
        }
        else {
            viewController.navigationController?.isNavigationBarHidden = false
        }
    }
    
    func LoginViewController() -> UIViewController {
        let viewController = viewControllerForStoryboardId(TagIDConstant.storyBoardIDs.kLoginViewControllerID)
        return viewController
    }
    
    fileprivate func viewControllerForStoryboardId(_ storyboardId: String) -> UIViewController {
        let viewController: UIViewController = TagIDConstant.storyBoardIDs.storyboard.instantiateViewController(withIdentifier: storyboardId)
        return viewController
    }
}
