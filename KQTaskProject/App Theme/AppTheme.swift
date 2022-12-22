//
//  AppTheme.swift
//  KQTaskProject
//
//  Created by KamsQue on 22/12/2022.
//

import Foundation
import UIKit

enum UIUserInterfaceStyle: Int {
   case unspecified
   case light
   case dark
}


class AppTheme {
    
    static var shared = AppTheme()
    private init() {}
   
    let titleTextColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        switch traitCollection.userInterfaceStyle {
        case .unspecified:return UIColor.systemGray
        case.light: return UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        case .dark: return UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        default: return UIColor.systemGray
        }
    }
    
    let subTitleTextColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        switch traitCollection.userInterfaceStyle {
        case .unspecified:return UIColor.systemGray
        case.light: return UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        case .dark: return UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        default: return UIColor.systemGray
        }
    }
    
    let navTitleTextColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        switch traitCollection.userInterfaceStyle {
        case .unspecified:return UIColor.systemGray
        case.light: return UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        case .dark: return UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        default: return UIColor.systemGray
        }
    }
    
    let navTintColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        switch traitCollection.userInterfaceStyle {
        case .unspecified:return UIColor.systemGray
        case.light: return UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        case .dark: return UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        default: return UIColor.systemGray
        }
    }
    
    let navBackgroundColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        switch traitCollection.userInterfaceStyle {
        case .unspecified:return UIColor.systemGray
        case.light: return UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        case .dark: return UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        default: return UIColor.systemGray
        }
    }
    
    let statusBarBackgroundColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        switch traitCollection.userInterfaceStyle {
        case .unspecified:return UIColor.systemGray
        case.light: return UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        case .dark: return UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        default: return UIColor.systemGray
        }
    }
}
