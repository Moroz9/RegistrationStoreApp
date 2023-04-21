//
//  NetworkDataFetch.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 20.04.23.
//

import Foundation

class NetworkDataFetch {

static let shared = NetworkDataFetch()
    private init() {}
    
    func fetchCategoryModel(urlString: String, responce: @escaping (LatestData?, Error?) -> Void) {
        
        NetworkRequest.shared.requestData(urlString: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let categoty = try JSONDecoder().decode(LatestData.self, from: data)
                    responce( categoty, nil)
                } catch let jsonError {
                    print("Fail to decode Json", jsonError)
                }
            case .failure(let error):
                print("Error ")
                responce( nil, error)
            }
        }
    }
}
