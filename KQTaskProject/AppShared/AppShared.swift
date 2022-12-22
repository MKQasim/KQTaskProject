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
    static func shared(userDefaults: UserDefaults = .standard) -> AppShared {

        if self.shared == nil {
            self.shared = AppShared(userDefaults: userDefaults)
        }
        return self.shared
    }

    private static var shared: AppShared!

    private init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }

    // MARK: - Properties

    // Constants
    private let authTokenKey = "AuthorizationToken"
    private let localAuthenticationKey = "localAuthenticationKey"

    let userDefaults: UserDefaults

    var token: String = "=NklDh6oq4hHAAK1v8nH8j3Ggc1PagBZG"

    func clearSharedData() {

    }

}

