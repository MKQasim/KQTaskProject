//
//  UserApiHandler.swift
//  KQTaskProject
//
//  Created by KamsQue on 23/12/2022.
//

import Foundation
import KQTaskNetworkManager

protocol UserApiHandlerProtocole {
    func makeRequest(from parameters: [String: Any]) -> Request
    func parseResponse(data: Data) throws -> UserDetails?
}

struct UserApiHandler: APIHandler , UserApiHandlerProtocole {
    
    func makeRequest(from parameters: [String: Any]) -> Request {
        let loginId : String = parameters["loginId"] as? String ?? ""
        // prepare url
        let url = URL(string:Path.Users().getUserDetails(loginId))
        var urlRequest = URLRequest(url: url!)
        // set http method type
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        do {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        // HTTP Headers
        // set body params
        set(parameters, urlRequest: &urlRequest)
        // prepares request (sets header params, any additional configurations)
        let request = Request(urlRequest: urlRequest, requestBuilder: DefaultRequest())
        return request
    }
 
    func parseResponse(data: Data) throws -> UserDetails? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        lazy var jsonDecoder: JSONDecoder = {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
                let container = try decoder.singleValueContainer()
                let dateStr = try container.decode(String.self)
                var date: Date? = nil
                date = formatter.date(from: dateStr)
                guard let date_ = date else {
                    throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string \(dateStr)")
                }
                return date_
            })
            return decoder
        }()
        return try jsonDecoder.decode(UserDetails.self, from: data)
    }
}

extension JSONDecoder.DateDecodingStrategy {
    static func custom(_ formatterForKey: @escaping (CodingKey) throws -> DateFormatter?) -> JSONDecoder.DateDecodingStrategy {
        return .custom({ (decoder) -> Date in
            guard let codingKey = decoder.codingPath.last else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "No Coding Path Found"))
            }

            guard let container = try? decoder.singleValueContainer(),
                let text = try? container.decode(String.self) else {
                    throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Could not decode date text"))
            }

            guard let dateFormatter = try formatterForKey(codingKey) else {
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "No date formatter for date text")
            }

            if let date = dateFormatter.date(from: text) {
                return date
            } else {
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string \(text)")
            }
        })
    }
}
