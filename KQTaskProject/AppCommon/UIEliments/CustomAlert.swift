//
//  CustomAlert.swift
//  KQTaskProject
//
//  Created by KamsQue on 23/12/2022.
//

import Foundation
import UIKit

class AlertHelper {
    
    class func showOkAlert(_ title: String? = "", message: String?, action:((UIAlertAction) -> Void)? = nil) {
        showAlert(title, message: message, style: .alert, actionTitles: ["OK"], showCancel: false, action: action)
    }
    
    class func showAlert(_ alertTitle: String? = "", message: String?, style: UIAlertController.Style, actionTitles: [String?], autoDismiss: Bool? =  false  , dismissDuration: Int? = 0 , showCancel: Bool, _ target: UIViewController? = nil, _ sender: Any? = nil, action:((UIAlertAction) -> Void)?) {
        
        let alertController = UIAlertController(title: alertTitle, message: message, preferredStyle: style)
        
        for (_, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: action)
            alertController.addAction(action)
        }
        
        if autoDismiss ?? false {
            DispatchQueue.delay(.seconds(dismissDuration ?? 1)) {
                alertController.dismiss(animated: true)
            }
        }
        
        if showCancel {
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
        }
        
        if style == UIAlertController.Style.actionSheet {
            alertController.view.tintColor = #colorLiteral(red: 0.4078176022, green: 0.407827884, blue: 0.4078223705, alpha: 1)
        }
        
        if let target = target {
            target.present(alertController, animated: true, completion: nil)
        } else {
            TopMostVC.topMostViewController().present(alertController, animated: true, completion: nil)
        }
        
        
    }
}

extension DispatchQueue {
    static func delay(_ delay: DispatchTimeInterval, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: closure)
    }
}
