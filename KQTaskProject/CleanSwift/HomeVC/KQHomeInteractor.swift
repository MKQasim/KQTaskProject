//
//  KQHomeInteractor.swift
//  KQTaskProject
//
//  Created by KamsQue on 22/12/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol KQHomeBusinessLogic
{
    func fetchUsers(request: KQHome.HomeUsers.Request)
    func checkApiUrlSerssion()
}

protocol KQHomeDataStore
{
    var selectedUser: User? { get set }
}

class KQHomeInteractor: KQHomeBusinessLogic, KQHomeDataStore
{
    
    var selectedUser: User?
    var homeList: [User]?
    var presenter: KQHomePresentationLogic?
    var worker: KQHomeWorker?
    var homeBusiness: HomeBusinessProtocol
    
    init(homeBusiness: HomeBusinessProtocol =  HomeBusiness(),
         presenter: KQHomePresentationLogic?) {
        self.homeBusiness = homeBusiness
        self.presenter = presenter
    }
    
    // MARK: fetch Users Api Call
    
    func fetchUsers(request: KQHome.HomeUsers.Request) {
        let parameters = ["": ""]
        self.homeBusiness.fetchUsers(parameters: parameters, completion: {(users, error) in
            if users != nil{
                let response = KQHome.HomeUsers.Response(homeUsers: users)
                self.presenter?.presentUsers(response: response)
            }else{
                self.presenter?.presenApiNetworkError(message: error?.localizedDescription)
            }
        })
    }
    
    func checkApiUrlSerssion(){
        self.homeBusiness.homestopApiCallStart { isCanceled in
            self.presenter?.checkApiUrlSerssion(isCanceled: isCanceled)
        }
    }
}
