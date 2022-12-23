//
//  UserServices.swift
//  KQTaskProject
//
//  Created by KamsQue on 23/12/2022.
//

import Foundation

class UserServices {
    
    var urlSession : URLSession?
    // MARK: - Post List
    
    func usersDetails(parameters: [String: Any], completion: @escaping (UserDetails?, Error?) -> ()) {
        // api
        let api = UserApiHandler()
        // api loader
        urlSession = APILoader(apiRequest: api).urlSession
        let apiTaskLoader = APILoader(apiRequest: api)
        apiTaskLoader.loadAPIRequest(requestData: parameters) { (result) in
            switch result{
            case  .success(let userDetails):
                completion(userDetails,nil)
            case .failure(let error):
                completion(nil,error)
            }
        }
    }
    
    func cancelAPiCall()-> Bool{
        urlSession?.invalidateAndCancel()
        return true
    }
}
