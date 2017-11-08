//
//  NavigationBarConstant.swift
//  CustomNavigationBar
//
//  Created by Ravi Vora on 18/07/16.
//  Copyright © 2016 Ravi Vora. All rights reserved.
//

import UIKit

class NavigationBarConstant {
    
    struct NavigationBarItems {
        static let barColor =  "BarColor"
        static let barImage =  "BarImage"
        static let showTopBar = "showTopBar"
        static let barTitle = "BarTitle"
        static let leftCustomBarButtons = "leftCustomBarButtons"
        static let rightCustomBarButtons = "rightCustomBarButtons"
    }
    
    struct NavigationBarComponents {
        static let isImage =  "UIImage"
    }

    
    //MARK: - Navigation Bar Enum -

    enum NavigationBarImage : String {
        
        case sideNavIcon    = "sidemenu_icon"
        case backNavIcon    = "back_arrow"
        case alertIcon    = "alert_icon"
        case itemNavIcon    = "itemNavIcon"
        case onlineNavIcon  = "onlineNavIcon"
        
    }
    
    enum LeftNavigationBarButtonIndex: Int{
        
        case sideMenu   = 200
        case back   = 201
        
    }
    
    enum RightNavigationBarButtonIndex: Int{
        
        case sort  = 300
        case search  = 301
        case refresh  = 302

    }
    
    enum NavigationBarButtonTitle: String {
        
        case Back           = "Back"
        case FixedSpace     = "FixedSpace"
        
    }
    
    //MARK: - Conditional Constant for iPhone and iPad
    //MARK: - Navigation Bar Color And Font Constant -
    
    struct NavigationBar{
        
        func setTopBarTitle() -> NSDictionary {
            var aColorAndFont : NSDictionary
            //*********** iPad **************
            if (AppConstants.DeviceType.IS_IPAD ){
                aColorAndFont =
                    [NSAttributedStringKey.foregroundColor : UIColor.white,
                     NSAttributedStringKey.font : UIFont.systemFont(ofSize: 19.0)
                    ] as NSDictionary
                
            }else{
                
                //*********** iPhone ***********
                aColorAndFont =
                    [NSAttributedStringKey.foregroundColor : UIColor.white,
                     NSAttributedStringKey.font : UIFont.systemFont(ofSize: 19.0)
                    ] as NSDictionary
                
            }
            return aColorAndFont
        }
    }
    
    
    
}
