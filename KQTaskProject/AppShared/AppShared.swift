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
    
    func getEnviroment(){
        var enviroment = ""
        #if Debug
        enviroment = AppGlobalSettings.AppEnvironment.Debug.rawValue
        #elseif Testing
        enviroment = AppGlobalSettings.AppEnvironment.Testing.rawValue
        #elseif Staging
        enviroment = AppGlobalSettings.AppEnvironment.Staging.rawValue
        #elseif Production
        enviroment = AppGlobalSettings.AppEnvironment.Production.rawValue
        #elseif Release
        enviroment = AppGlobalSettings.AppEnvironment.Release.rawValue
        #endif
        print(enviroment)
    }

}

