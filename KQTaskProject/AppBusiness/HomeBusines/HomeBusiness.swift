//
//  UserBusiness.swift
//  TaskProjectDemo
//
//  Created by Muhammad Qasim Muhammad Mubeen on 28/01/2022.
//

import Foundation

protocol HomeBusinessProtocol {
    func fetchUsers(parameters: [String : Any],completion:@escaping((_ usermodel:Users?,_ error:Error?) -> ()))
    func homestopApiCallStart(completion:@escaping((_ isCanceled : Bool) -> ()))
}

class HomeBusiness: HomeBusinessProtocol {
     // MARK: - HomeServices
    private lazy var homeServices = HomeServices()
    // MARK: - Home Api Call

    func fetchUsers(parameters: [String : Any],completion:@escaping((_ usermodel:Users?,_ error:Error?) -> ())){
        homeServices.usersList(parameters:parameters) { userModel, error in
            if error == nil{
                completion(userModel,error)
            }else{
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
    func homestopApiCallStart(completion:@escaping((_ isCanceled : Bool) -> ())){
       
        if homeServices.urlSession != nil{
            homeServices.urlSession?.invalidateAndCancel()
            completion(true)
        }else{
            completion(false)
        }
    }
    
}
