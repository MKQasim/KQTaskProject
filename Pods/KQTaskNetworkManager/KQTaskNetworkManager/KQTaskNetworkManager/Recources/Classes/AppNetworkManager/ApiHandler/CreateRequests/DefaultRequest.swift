//
//  DefaultRequest.swift
//  KQTaskProject
//
//  Created by KamsQue on 22/12/2022.
//

import Foundation

public class DefaultRequest: RequestBuilder {
    public init(){}
    public func setHeaders(request: inout URLRequest) {
        // header params
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
    }
}
