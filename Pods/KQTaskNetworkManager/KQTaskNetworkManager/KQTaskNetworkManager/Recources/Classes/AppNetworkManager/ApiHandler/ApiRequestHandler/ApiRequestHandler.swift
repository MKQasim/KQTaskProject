//
//  ApiRequestHandler.swift
//  KQTaskProject
//
//  Created by KamsQue on 22/12/2022.
//

import Foundation

public protocol RequestHandler {
    associatedtype RequestDataType
    func makeRequest(from data: RequestDataType) -> Request
}
//
//// MARK: - SetParameters
//
extension RequestHandler {
    
    /// prepares httpbody
    public func set(_ parameters: [String: Any], urlRequest: inout URLRequest) {
        // http body
        if parameters.count != 0 {
            if #available(iOS 13.0, *) {
                if let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: .withoutEscapingSlashes) {
                    urlRequest.httpBody = jsonData
                }
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
