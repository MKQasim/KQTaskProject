//
//  HomeService.swift
//  TaskProjectDemo
//
//  Created by Apple on 10/30/19.
//  Copyright (c) 2019 Apple. All rights reserved.
//

import Foundation

class HomeServices {


    // MARK: - Post List

    func usersList(parameters: [String: Any], completion: @escaping (HomeModel?, Error?) -> ()) {
        // api
        let api = HomeApiHandler()
        // api loader
        let apiTaskLoader = APILoader(apiRequest: api)
        apiTaskLoader.loadAPIRequest(requestData: parameters) { (result) in
            switch result{
            case  .success(let homeModel):print("HomeModel")
                completion(homeModel,nil)
            case .failure(let error):
                completion(nil,error)
            }
        }
    }
}
