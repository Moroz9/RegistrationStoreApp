//
//  LatestData.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 20.04.23.
//
//   swiftlint:disable all

import Foundation

// MARK: - Latest

//   swiftlint:disable all


struct LatestData: Decodable {
    let сategories: [LatestElement]
}

// MARK: - Сategory
struct LatestElement: Decodable {
    let id: Int
    let name: String
    let image_url: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case image_url = "image_url"
    }
}
