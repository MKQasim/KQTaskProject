//
//  ViewController.swift
//  ProjectTask
//
//  Created by KamsQue on 20/12/2022.
//

import UIKit

public class KQSuperVC: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setStatusBar(color: AppTheme.shared.statusBarBackgroundColor)
        self.navigationController?.navigationBar.backgroundColor = AppTheme.shared.navBackgroundColor
        self.navigationController?.navigationBar.tintColor = AppTheme.shared.navTintColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:AppTheme.shared.navTitleTextColor]
        view.isAccessibilityElement = true
    }
    
   public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

public extension UIViewController {
    func setStatusBar(color: UIColor) {
        let tag = 12321
        if let taggedView = self.view.viewWithTag(tag){
            taggedView.removeFromSuperview()
        }
        let overView = UIView()
        overView.frame = UIApplication.shared.statusBarFrame
        overView.backgroundColor = color
        overView.tag = tag
        self.view.addSubview(overView)
    }
}
