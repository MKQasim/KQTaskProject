//
//  SceneDelegate.swift
//  KQTaskProject
//
//  Created by KamsQue on 21/12/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        window.rootViewController = UINavigationController(rootViewController: KQHomeViewController())
        window.makeKeyAndVisible()
        self.window = window
    }
}

