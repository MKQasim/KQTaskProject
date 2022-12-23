//
//  ImageViewExtension.swift
//  KQTaskProject
//
//  Created by KamsQue on 22/12/2022.
//

import Foundation
import UIKit

extension UIImageView {
    public func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
