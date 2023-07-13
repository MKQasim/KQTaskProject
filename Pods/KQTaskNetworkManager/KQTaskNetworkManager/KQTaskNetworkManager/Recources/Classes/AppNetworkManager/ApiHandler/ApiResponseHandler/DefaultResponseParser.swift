//
//  DefaultResponseParser.swift
//  KQTaskProject
//
//  Created by KamsQue on 22/12/2022.
//

import Foundation
// MARK: - Default Response Handler


extension ResponseHandler {
    /// generic response data parser
    public func defaultParseResponse<T: Response>(data: Data) throws -> T {

        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .useDefaultKeys
        if let body = try? jsonDecoder.decode(T.self, from: data){
            return body
        } else if let errorResponse = try? jsonDecoder.decode(ServiceError.self, from: data) {
            throw errorResponse
        } else {
            throw UnknownParseError()
        }
    }
}

