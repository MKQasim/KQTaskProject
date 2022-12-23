//
//  UserApiHandler.swift
//  KQTaskProject
//
//  Created by KamsQue on 23/12/2022.
//

import Foundation

struct UserApiHandler: APIHandler {
    
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
        //HTTP Headers
        // set body params
        set(parameters, urlRequest: &urlRequest)
        // prepares request (sets header params, any additional configurations)
        let request = Request(urlRequest: urlRequest, requestBuilder: DefaultRequest())
        
        return request
    }
   
    func parseResponse(data: Data) throws -> UserDetails? {
        let jsonDecoder = JSONDecoder()
        return try jsonDecoder.decode(UserDetails.self, from: data)
    }
}


