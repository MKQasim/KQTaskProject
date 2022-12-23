//
//  Enviroment.swift
//  KQTaskProject
//
//  Created by KamsQue on 22/12/2022.
//


import Foundation

enum Environment {

    case development
    case staging
    case production
    
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
        case .development:
            return "api"
        case .staging:
            return "test.subdomain"
        case .production:
            return "prod.subdomain"
        }
    }
    
    func domain() -> String {
        switch self {
        case .development, .staging, .production:
            return "github.com"
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
let environment: Environment = Environment.development
#else
let environment: Environment = Environment.staging
#endif

let baseUrl = environment.baseURL()

struct Path {
   
    struct Users {
        var getMostViewedUsers : (String) -> String = { api_Key  in
            return "\(baseUrl)"
        }
        
        var getUserDetails : (String) -> String = { api_Key  in
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
