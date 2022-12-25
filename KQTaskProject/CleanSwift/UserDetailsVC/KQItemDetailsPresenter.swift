//
//  KQItemDetailsPresenter.swift
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

protocol KQItemDetailsPresentationLogic
{
    func presentUserDetails(response: KQItemDetails.Model.Response)
    func presentRequestValidationError(isValidated:Bool)
    func stopApiCallSuccess(isCanceled: Bool)
}

class KQItemDetailsPresenter: KQItemDetailsPresentationLogic
{
    
    weak var viewController: KQItemDetailsDisplayLogic?
    
    // MARK: present User Details
    
    func presentUserDetails(response: KQItemDetails.Model.Response)
    {
        let viewModel = KQItemDetails.Model.ViewModel(selectedUser : response.selectedUser , userDetails: response.userDetails)
        viewController?.displayUserDetails(viewModel: viewModel)
    }
    
    func presentRequestValidationError(isValidated: Bool) {
        viewController?.displayValidationError(isValidated: isValidated)
    }
    
    func stopApiCallSuccess(isCanceled:Bool){
        viewController?.stopApiCallSuccess(isCanceled: isCanceled)
    }
}
