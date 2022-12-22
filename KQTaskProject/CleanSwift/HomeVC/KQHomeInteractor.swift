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
    func homeApiCall(request: KQHome.Api.Request)
}

protocol KQHomeDataStore
{
    var selectedUser: Post? { get set }
}

class KQHomeInteractor: KQHomeBusinessLogic, KQHomeDataStore
{

    var selectedUser: Post?
    var homeList: [Post]?
    var presenter: KQHomePresentationLogic?
    var worker: KQHomeWorker?
    var homeBusiness = HomeBusiness()
    
    
    // MARK: Home Api Call
    
    func homeApiCall(request: KQHome.Api.Request) {
        let parameters = ["api-key": "=NklDh6oq4hHAAK1v8nH8j3Ggc1PagBZG"]
        
        self.homeBusiness.homeApiCall(parameters: parameters, completion: {(users, error) in
            self.worker = KQHomeWorker()
            let response = KQHome.Api.Response(code: nil, message: error?.localizedDescription, homeUsers: users)
            self.presenter?.presentSomething(response: response)
        })
    }
}
