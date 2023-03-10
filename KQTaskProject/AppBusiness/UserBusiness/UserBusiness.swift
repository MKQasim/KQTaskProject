//
//  UserBusiness.swift
//  KQTaskProject
//
//  Created by KamsQue on 23/12/2022.
//

import Foundation

protocol UserBusinessProtocol {
    func userDetailsApiCall(parameters: [String : Any],completion:@escaping((_ userDetails:UserDetails?,_ error:Error?) -> ()))
    func userstopApiCallStart(completion:@escaping((_ isCanceled : Bool) -> ()))
}

class UserBusiness : UserBusinessProtocol{
     // MARK: - UserServices
    private lazy var userServices = UserServices()
    // MARK: - User Api Call

    func userDetailsApiCall(parameters: [String : Any],completion:@escaping((_ userDetails:UserDetails?,_ error:Error?) -> ())){
        userServices.usersDetails(parameters:parameters) { userDetails, error in
            completion(userDetails,error)
        }
    }
    
    func userstopApiCallStart(completion:@escaping((_ isCanceled : Bool) -> ())){
       
        if userServices.urlSession != nil{
            userServices.urlSession?.invalidateAndCancel()
            completion(true)
        }else{
            completion(false)
        }
    }
    
}
