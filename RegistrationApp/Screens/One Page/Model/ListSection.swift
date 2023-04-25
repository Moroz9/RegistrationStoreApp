//
//  ListSection.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 17.04.23.
//

import Foundation

// MARK: - List Section

enum ListSection {
    case category([Category])
    case latest([LatestElement])
    case flashSale([FlashSaleElement])

    var items: [Any] {
        switch self {
        case .category(let categories):
            return categories
        case .latest(let latest):
            return latest
        case .flashSale(let flashSale):
            return flashSale
        }
    }

    var title: String {
        switch self {
        case .category:
            return "Categories"
        case .latest:
            return "Latest"
        case .flashSale:
            return "Flash Sale"
        }
    }
}
