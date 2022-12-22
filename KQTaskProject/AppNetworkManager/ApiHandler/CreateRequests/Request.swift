//
//  Request.swift
//  KQTaskProject
//
//  Created by KamsQue on 22/12/2022.
//

import Foundation


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






