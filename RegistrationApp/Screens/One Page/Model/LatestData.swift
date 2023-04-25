//
//  LatestData.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 20.04.23.
//
//   swiftlint:disable all

import Foundation

// MARK: - Latest

struct LatestData: Decodable {
    let latest: [LatestElement]
}

// MARK: - LatestElement

struct LatestElement: Decodable {
    let category, name: String
    let price: Double
    let image_url: String

    enum CodingKeys: String, CodingKey {
        case category, name, price
        case image_url = "image_url"
    }
}
//   swiftlint:disable all
