//
//  KQHomePresenter.swift
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

protocol KQHomePresentationLogic
{
    func presentUsers(response: KQHome.HomeUsers.Response)
    func stopUrlSession(isCanceled: Bool)
    
}

class KQHomePresenter: KQHomePresentationLogic
{
    
    weak var viewController: KQHomeDisplayLogic?
    
    // MARK: Do something
    
    func presentUsers(response: KQHome.HomeUsers.Response)
    {
        let viewModel = KQHome.HomeUsers.ViewModel(users: response.homeUsers)
        viewController?.displayFetchedUsers(viewModel: viewModel)
    }
    
    func stopUrlSession(isCanceled:Bool){
        viewController?.stopUrlSession(isCanceled: isCanceled)
    }
}
