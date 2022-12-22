//
//  Request.swift
//  KQTaskProject
//
//  Created by KamsQue on 22/12/2022.
//

import Foundation


public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

class Request {

    private var request: URLRequest

    init(urlRequest: URLRequest, requestBuilder: RequestBuilder) {
        self.request = urlRequest
        // do configuration
        requestBuilder.setHeaders(request: &self.request)
    }

    var urlRequest: URLRequest {
        return request
    }
}






