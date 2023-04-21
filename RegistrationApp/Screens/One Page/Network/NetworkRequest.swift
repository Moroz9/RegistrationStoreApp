//
//  NetworkRequest.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 20.04.23.
//

import Foundation

class NetworkRequest {
    
    static let shared = NetworkRequest()
    
    private init() {}
    
    func requestData(urlString: String, completion: @escaping(Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, errore in
            DispatchQueue.main.async {
                if let errore = errore {
                    completion(.failure(errore))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }
        .resume()
    }
}
