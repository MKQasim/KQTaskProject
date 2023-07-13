//
//  ApiLoader.swift
//  KQTaskProject
//
//  Created by KamsQue on 22/12/2022.
//


import Foundation

public class APILoader<T: APIHandler> {
    
    public let apiRequest: T
    public let urlSession: URLSession
    public let reachibility: Reachability
    
    public init(apiRequest: T, urlSession: URLSession = .shared, reachibility: Reachability = Reachability()!) {
        self.apiRequest = apiRequest
        self.urlSession = urlSession
        self.reachibility = reachibility
    }
    
   public func loadAPIRequest(requestData: T.RequestDataType,
                        completionHandler: @escaping (_ result: Result<T.ResponseDataType?,Error>) -> Void)  {
        if reachibility.connection == .none {
            return completionHandler(.failure(NetworkError(message: "No Internet Connection")))
        }
        urlSession.dataTask(with: apiRequest.makeRequest(from: requestData).urlRequest.url!) { data, response, error in
            guard let dataResponse = data , error == nil else {
                return
            }
            do {
                let parsedResponse = try self.apiRequest.parseResponse(data: dataResponse)
                return completionHandler(.success(parsedResponse))
            } catch let parsingError {
                return completionHandler(.failure(parsingError))
            }
        }.resume()
    }
    
    public func cancelApiRequest(){
        urlSession.invalidateAndCancel()
    }
    
}
