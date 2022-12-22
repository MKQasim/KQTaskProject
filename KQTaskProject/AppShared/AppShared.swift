//
//  AppShared.swift
//  KQTaskProject
//
//  Created by KamsQue on 22/12/2022.
//

import Foundation
import UIKit

final class AppShared {

    // MARK: - Singleton
    
    private static var shared: AppShared!
    private init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    static func shared(userDefaults: UserDefaults = .standard) -> AppShared {
        if self.shared == nil {
            self.shared = AppShared(userDefaults: userDefaults)
        }
        return self.shared
    }
    let userDefaults: UserDefaults
  
    
    // MARK: - Properties

}

