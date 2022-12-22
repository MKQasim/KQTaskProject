//
//  ApiLoader.swift
//  KQTaskProject
//
//  Created by KamsQue on 22/12/2022.
//


import Foundation

class APILoader<T: APIHandler> {

    let apiRequest: T
    let urlSession: URLSession
    let reachibility: Reachability

    init(apiRequest: T, urlSession: URLSession = .shared, reachibility: Reachability = Reachability()!) {
        self.apiRequest = apiRequest
        self.urlSession = urlSession
        self.reachibility = reachibility
    }

    func loadAPIRequest(requestData: T.RequestDataType,
                        completionHandler: @escaping (_ result: Result<T.ResponseDataType?,Error>) -> Void)  {
        if reachibility.connection == .none {
            return completionHandler(.failure(NetworkError(message: "No Internet Connection")))
        }
        // prepare url request
        let urlRequest = apiRequest.makeRequest(from: requestData).urlRequest
        urlSession.dataTask(with: urlRequest) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do {
                let parsedResponse = try self.apiRequest.parseResponse(data: dataResponse)
                return completionHandler(.success(parsedResponse))
            } catch let parsingError {
                return completionHandler(.failure(parsingError))
            }
        }.resume()
    }
}
