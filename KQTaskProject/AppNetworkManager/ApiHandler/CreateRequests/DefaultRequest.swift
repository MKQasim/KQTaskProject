//
//  DefaultRequest.swift
//  KQTaskProject
//
//  Created by KamsQue on 22/12/2022.
//

import Foundation

class DefaultRequest: RequestBuilder {

    func setHeaders(request: inout URLRequest) {
        // header params
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    }
}
