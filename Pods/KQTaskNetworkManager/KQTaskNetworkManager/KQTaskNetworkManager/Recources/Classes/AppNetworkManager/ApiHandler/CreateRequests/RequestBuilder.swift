//
//  RequestBuilder.swift
//  KQTaskProject
//
//  Created by KamsQue on 22/12/2022.
//

import Foundation

public protocol RequestBuilder {
    func setHeaders(request: inout URLRequest)
}
