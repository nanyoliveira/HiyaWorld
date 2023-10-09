//
// HiyaRequestAble.swift
//
//
//  Created by Ariane Clarke on 25/04/2023.
//

import Foundation

protocol HiyaRequestAble {
    func requestCountries<T:Codable>(path:String, type:T.Type, result: @escaping(_ data:T?, _ error:Error?) -> () )
}

extension HiyaRequestAble {
    func requestCountries<T:Codable>(path:String, type:T.Type, result: @escaping(_ data:T?, _ error:Error?) -> () ) {
        guard let url = URL(string: path) else {
            result(nil, HiyaRequestAbleError(error: "no URL path given"))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dataTask:URLSessionDataTask = URLSession.shared.dataTask(with: urlRequest) { _data, _response, _error in
            
            DispatchQueue.main.async {
                guard let availableData = _data else {
                    result(nil, HiyaRequestAbleError(error: "The request data is not available"))
                    return
                }
                do {
                    let decodedData =  try JSONDecoder().decode(T.self, from: availableData)
                    result(decodedData, nil)
                } catch {
                    result(nil, HiyaRequestAbleError(error:  error.localizedDescription))
                }
            }
        }
        
        dataTask.resume()
    }
}

struct HiyaRequestAbleError:Error {
    var error:String
}
