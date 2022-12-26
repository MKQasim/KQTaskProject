//
//  AppGlobalSettings.swift
//  KQTaskProject
//
//  Created by KamsQue on 26/12/2022.
//

import Foundation


public struct AppGlobalSettings{
    
//   This  will Use When We will Connect to multiple Custom FramWorks To Intigrate Glabal Settings
    
    private static var shared: AppShared!
    private init() {
    }
    
    public enum  AppEnvironment : String{
        case Debug
        case Testing
        case Staging
        case Production
        case Release
    }
    
    public func setEnviroment(){
        var enviroment = ""
        #if Debug
        enviroment = AppEnvironment.Debug.rawValue
        #elseif Testing
        enviroment = AppEnvironment.Testing.rawValue
        #elseif Staging
        enviroment = AppEnvironment.Staging.rawValue
        #elseif Production
        enviroment = AppEnvironment.Production.rawValue
        #elseif Release
        enviroment = AppEnvironment.Release.rawValue
        #endif
        print(enviroment)
    }
}
