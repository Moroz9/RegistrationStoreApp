//
//  FlashSaleData.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 20.04.23.
//

import Foundation

// MARK: - FlashSale

struct FlashSaleData: Decodable {
    let flashSale: [FlashSaleElement]

    enum CodingKeys: String, CodingKey {
        case flashSale = "flash_sale"
    }
}

// MARK: - FlashSaleElement

struct FlashSaleElement: Decodable {
    let category: String
    let name: String
    let price: Double
    let discount: Double
    let imageUrl: String

    enum CodingKeys: String, CodingKey {
        case category, name, price, discount
        case imageUrl = "image_url"
    }
}
