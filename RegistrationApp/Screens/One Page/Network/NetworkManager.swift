//
//  NetworkManager.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 24.04.23.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case unableToComplete
    case invalidData
    case invalidDecoding
}

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func fetchLatestCategoryModel(urlString: String, completion: @escaping (Result<LatestData, NetworkError>) -> Void) {
        makeRequest(urlString: urlString, completion: completion)
    }
    
    func fetchBrandsModel(urlString: String, completion: @escaping (Result<FlashSaleData, NetworkError>) -> Void) {
        makeRequest(urlString: urlString, completion: completion)
    }
    
    func fetchFlashSalesModel(urlString: String, completion: @escaping (Result<FlashSaleData, NetworkError>) -> Void) {
        makeRequest(urlString: urlString, completion: completion)
    }
}

extension NetworkManager {
    private func makeRequest<Model: Decodable>(urlString: String, completion: @escaping (Result<Model, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(Model.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(.invalidDecoding))
            }
        }.resume()
    }
}
