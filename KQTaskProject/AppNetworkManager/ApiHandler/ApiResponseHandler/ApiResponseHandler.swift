//
//  ApiResponseHandler.swift
//  KQTaskProject
//
//  Created by KamsQue on 22/12/2022.
//

import Foundation


protocol ResponseHandler {
    associatedtype ResponseDataType:Decodable
     func parseResponse(data: Data) throws -> ResponseDataType?
}

// MARK: - Response
protocol Response: Codable {
    var code: Int?{get set}
    var message: String?{get set}
}

