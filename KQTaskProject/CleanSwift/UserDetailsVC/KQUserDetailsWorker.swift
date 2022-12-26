//
//  KQUserDetailsWorker.swift
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

class KQUserDetailsWorker
{
    func validateRequest(request:KQUserDetailsModels.Model.Request,completion:@escaping((_ isValidate:Bool) -> ()))
    {
        if request.loginId != nil && request.loginId != "" {
            completion(true)
        }else{
            completion(false)
        }
    }
}
