//
//  Constant.swift
//  CustomNavigationBar
//
//  Created by Ravi Vora on 18/03/16.
//  Copyright © 2016 Ravi Vora. All rights reserved.
//

import Foundation
import UIKit



class AppConstants  {
    
    static let APP_NAME = "RvnavigationBar"
    static let deviceTypeValue = "ios"
    static let NavigationBarPlist = "RvNavigationbarItems"
   
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    enum UIUserInterfaceIdiom : Int {
        case unspecified
        case phone
        case pad
    }
    
    struct ScreenSize {
        static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    
    struct DeviceType {
        static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 480.0
        static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    }

    
    struct globalFunctions {
        static func GET_IMAGE(_ imageName:String) -> UIImage
        {
            let imageN: UIImage = UIImage(named: imageName)!
            return imageN
        }
    }

}

