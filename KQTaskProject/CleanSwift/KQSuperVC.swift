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
        self.navigationController?.navigationBar.isAccessibilityElement = true
        self.navigationController?.navigationBar.accessibilityLabel = "navigationBar"
    }
    
   public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
