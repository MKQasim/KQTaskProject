//
//  TopMostController.swift
//  KQTaskProject
//
//  Created by KamsQue on 23/12/2022.
//

import Foundation
import UIKit

class TopMostVC {
    class func topMostViewController() -> UIViewController {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return UIViewController()
    }
}
