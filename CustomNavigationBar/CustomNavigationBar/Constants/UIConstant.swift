//
//  UIConstant.swift
//  CustomNavigationBar
//
//  Created by Ravi Vora on 17/08/16.
//  Copyright © 2016 Ravi Vora. All rights reserved.
//

import Foundation
import UIKit

class UIConstant  {

    static let appTextColor = "#152F3C"
    static let placeHolderColor = "#717171"
    static let detailTextColor = "#717171"
    static let appBgColor = "#EEF1F5"

    
    struct NavigationBar {
        
        static let titleTextColor = "#FFFFFF"

    }
    
    struct Fonts {
    
        static func FONT_HELVETICA_REGULAR(_ _size:CGFloat) -> UIFont
        {
            let font: UIFont = UIFont(name: "Helvetica", size: _size)!
            return font
        }
        
        static func FONT_HELVETICA_LIGHT(_ _size:CGFloat) -> UIFont
        {
            let font: UIFont = UIFont(name: "Helvetica-Light", size: _size)!
            return font
        }
        
        static func FONT_HELVETICA_BOLD(_ _size:CGFloat) -> UIFont
        {
            let font: UIFont = UIFont(name: "Helvetica-Bold", size: _size)!
            return font
        }
        
        static func FONT_HELVETICA_OBLIQUE(_ _size:CGFloat) -> UIFont
        {
            let font: UIFont = UIFont(name: "Helvetica-Oblique", size: _size)!
            return font
        }
    }

    
    struct Images {
        static let navigationBarImage = "navbg"
        static let sideArrowIcon = "arrow"
    }

}
