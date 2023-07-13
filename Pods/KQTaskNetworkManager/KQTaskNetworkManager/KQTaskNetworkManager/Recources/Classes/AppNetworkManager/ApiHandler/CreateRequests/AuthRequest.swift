//
//  AuthRequest.swift
//  KQTaskProject
//
//  Created by KamsQue on 22/12/2022.
//

import Foundation


public class AuthRequest: DefaultRequest {
    public override init() {}
    public override func setHeaders(request: inout URLRequest) {

       super.setHeaders(request: &request)
//        let nameAndToken = Defaults.getUserIdAndAuthToken()
//        let token = "Bearer "+nameAndToken.authToken
//        // Auth Headers
        request.setValue(nil, forHTTPHeaderField: "Authorization")

    }
}
