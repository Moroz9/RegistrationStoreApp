//
//  NetworkFastSales.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 20.04.23.
//

import Foundation

class NetworkFastSales {

static let shared = NetworkFastSales()
    private init() {}
    
    func fetchFlashModel(urlString: String, responce: @escaping (FlashSaleData?, Error?) -> Void) {
        
        NetworkRequest.shared.requestData(urlString: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let categoty = try JSONDecoder().decode(FlashSaleData.self, from: data)
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
