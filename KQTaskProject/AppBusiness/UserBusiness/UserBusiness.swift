//
//  UserBusiness.swift
//  KQTaskProject
//
//  Created by KamsQue on 23/12/2022.
//

import Foundation


import Foundation

class UserBusiness {
     // MARK: - UserServices
    private lazy var userServices = UserServices()
    // MARK: - User Api Call

    func userDetailsApiCall(parameters: [String : Any],completion:@escaping((_ userDetails:UserDetails?,_ error:Error?) -> ())){
        userServices.usersDetails(parameters:parameters) { userDetails, error in
            if error == nil{
                completion(userDetails,error)
            }else{
                print(error?.localizedDescription ?? "")
            }
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
