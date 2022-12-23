//
//  UniversalLoader.swift
//  KQTaskProject
//
//  Created by KamsQue on 23/12/2022.
//

import Foundation
import UIKit


public class LoadingOverlay{

var overlayView = UIView()
var activityIndicator = UIActivityIndicatorView()

class var shared: LoadingOverlay {
    struct Static {
        static let instance: LoadingOverlay = LoadingOverlay()
    }
    return Static.instance
}

    public func showOverlay(view: UIView) {

        overlayView.frame = CGRectMake(0, 0, 200, 200)
        overlayView.center = view.center
        overlayView.backgroundColor = AppTheme.shared.subTitleTextColor.withAlphaComponent(0.3)
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 10
        activityIndicator.frame = CGRectMake(0, 0, 200, 200)
        activityIndicator.color = .orange
        activityIndicator.style = .large
        activityIndicator.center = CGPointMake(overlayView.bounds.width / 2, overlayView.bounds.height / 2)
        overlayView.addSubview(activityIndicator)
        view.addSubview(overlayView)
        activityIndicator.startAnimating()
    }

    public func hideOverlayView() {
        activityIndicator.stopAnimating()
        overlayView.removeFromSuperview()
    }
}
