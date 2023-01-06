//
//  HomeService.swift
//  TaskProjectDemo
//
//  Created by Apple on 10/30/19.
//  Copyright (c) 2019 Apple. All rights reserved.
//

import Foundation
import KQTaskNetworkManager

class HomeServices {
    
    var urlSession : URLSession?
    // MARK: - Post List
    
    func usersList(parameters: [String: Any], completion: @escaping (Users?, Error?) -> ()) {
        // api
        let api = HomeApiHandler()
        // api loader
        urlSession = APILoader(apiRequest: api).urlSession
        let apiTaskLoader = APILoader(apiRequest: api)
        apiTaskLoader.loadAPIRequest(requestData: parameters) { (result) in
            switch result{
            case  .success(let users):
                completion(users,nil)
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
