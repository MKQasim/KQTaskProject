//
//  HomeApiHandler.swift
//  KQTaskProject
//
//  Created by KamsQue on 22/12/2022.
//

import Foundation

struct HomeApiHandler: APIHandler {
    
    func makeRequest(from parameters: [String: Any]) -> Request {
        // prepare url
        let url = URL(string:Path.Users().getMostViewedUsers(AppShared.shared().token) )
        print(url)
        var urlRequest = URLRequest(url: url!)
        // set http method type
        urlRequest.httpMethod = "POST"
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
   
    func parseResponse(data: Data) throws -> HomeModel? {

        return try defaultParseResponse(data: data)
    }
}

