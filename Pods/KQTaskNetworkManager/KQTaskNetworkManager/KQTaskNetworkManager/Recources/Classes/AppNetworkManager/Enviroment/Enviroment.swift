//
//  Enviroment.swift
//  KQTaskProject
//
//  Created by KamsQue on 22/12/2022.
//


import Foundation

public enum Environment {
    
    case debug
    case release
    case testing
    case staging
    case production
    
    
    
    
#if Debug
    
#elseif Testing
    
#elseif Staging
    
#elseif Production
    
#elseif Release
    
#endif
    
    
    func baseURL() -> String {
        return "\(urlProtocol())://\(subdomain()).\(domain())\(route())"
    }
    
    func urlProtocol() -> String {
        switch self {
        case .production:
            return "https"
        default:
            return "https"
        }
    }
    
    func subdomain() -> String {
        switch self {
        case .debug:
            return "api"
        case .staging:
            return "stag.subdomain"
        case .production:
            return "api"
        case .release:
            return "api"
        case .testing:
            return "api"
        }
    }
    
    func domain() -> String {
        switch self {
        case .debug, .staging, .production , .release  :
            return "github.com"
        case .testing:
            return "new/github.com"
        }
    }
    
    func route() -> String {
        return "/users"
    }
}

extension Environment {
    func host() -> String {
        return "\(self.subdomain()).\(self.domain())"
    }
}


// MARK:- APIs

#if DEBUG
let environment: Environment = Environment.debug
#else
let environment: Environment = Environment.staging
#endif


//#if Debug
//var environment: Environment = Environment.debug
//#elseif Testing
//var environment: Environment = Environment.testing
//#elseif Staging
//var environment: Environment = Environment.staging
//#elseif Production
//var environment: Environment = Environment.production
//#elseif Release
//var environment: Environment = Environment.staging
//#endif


let baseUrl = environment.baseURL()

public struct Path {
    public init() {}
    public struct Users {
        public init() {}
        public var getMostViewedUsers : (String) -> String = { api_Key  in
            return "\(baseUrl)"
        }
        
        public var getUserDetails : (String) -> String = { api_Key  in
            return "\(baseUrl)/\(api_Key)"
        }
    }
}

/*
 
 baseUrl
 
 Path().login
 
 Path.User().getProfile
 
 Path.User().deleteUser(525)
 
 Path.User.Task().getTaskDetail(525, 2)
 
 */
