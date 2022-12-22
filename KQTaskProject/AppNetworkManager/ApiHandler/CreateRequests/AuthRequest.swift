//
//  AuthRequest.swift
//  KQTaskProject
//
//  Created by KamsQue on 22/12/2022.
//

import Foundation


class AuthRequest: DefaultRequest {
    override func setHeaders(request: inout URLRequest) {

        super.setHeaders(request: &request)
//        let nameAndToken = Defaults.getUserIdAndAuthToken()
//        let token = "Bearer "+nameAndToken.authToken
//        print(token)
//        // Auth Headers
//        withoutEscapingSlashes
        request.setValue(nil, forHTTPHeaderField: "Authorization")
//        print(token)
    }
}
