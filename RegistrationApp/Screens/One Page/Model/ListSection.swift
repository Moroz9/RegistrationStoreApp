//
//  ListSection.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 17.04.23.
//

import Foundation

enum ListSection {
    case category([ListItem])
    case latest([ListItem])
    case flashSale([ListItem])
    case brands([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .category(let items),
                .latest(let items),
                .flashSale(let items),
                .brands(let items):
            return items
        }
    }
    var count: Int {
        return items.count
    }
    var title: String {
        switch self {
        case .category:
            return ""
        case .latest:
            return "latest"
        case .flashSale(_):
            return "Flash Sale"
        case .brands(_):
            return "Brands"
        }
    }
    
}
