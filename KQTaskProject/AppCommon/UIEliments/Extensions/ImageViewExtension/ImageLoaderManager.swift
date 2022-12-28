//
//  ImageLoaderManager.swift
//  KQTaskProject
//
//  Created by KamsQue on 28/12/2022.
//

import Foundation
import UIKit
import Combine

class ImageLoaderManager {
    
    static let shared = ImageLoaderManager()
    var cancellable: AnyCancellable?
    var animator: UIViewPropertyAnimator?
    
    private init(){}
    
    func showImage(animator:UIViewPropertyAnimator? = UIViewPropertyAnimator(), imageView: UIImageView,image: UIImage?) {
        var currentAnimator : UIViewPropertyAnimator? = UIViewPropertyAnimator()
        currentAnimator = animator
        imageView.alpha = 0.0
        currentAnimator?.stopAnimation(false)
        imageView.image = image
        currentAnimator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            imageView.alpha = 1.0
        })
    }
    
    func loadImage(for url: String?) -> AnyPublisher<UIImage?, Never> {
        return Just(url)
            .flatMap({ url -> AnyPublisher<UIImage?, Never> in
                let url = URL(string: url ?? "")!
                return ImageLoader.shared.loadImage(from: url)
            })
            .eraseToAnyPublisher()
    }
}
