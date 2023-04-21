//
//  FlashSaleModel.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 20.04.23.
//

import Foundation

// MARK: - FlashSale
struct FlashSaleData: Codable {
    let flashSale: [FlashSaleElement]

    enum CodingKeys: String, CodingKey {
        case flashSale
    }
}

// MARK: - FlashSaleElement
struct FlashSaleElement: Codable {
    let category, name: String
    let price: Double
    let discount: Int
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case category, name, price, discount
        case imageURL
    }
}
