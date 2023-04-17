//
//  MockData.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 17.04.23.
//

import Foundation

struct MockData {
    static let shared = MockData()
    
    private let category: ListSection = {
        .category([.init(title: "Phones", image: ""),
                  .init(title: "Headphones", image: ""),
                  .init(title: "Games", image: ""),
                  .init(title: "Cars", image: ""),
                  .init(title: "Furniture", image: ""),
                  .init(title: "Kids", image: "")])
    }()
    private let latest: ListSection = {
        .latest([.init(title: "Kids", image: ""),
                  .init(title: "Games", image: ".1"),
                  .init(title: "Kids", image: ""),
                  .init(title: "Piece", image: ".1"),
                  .init(title: "Seven", image: "")])
    }()
    private let flashSale: ListSection = {
        .flashSale([.init(title: "Kids", image: ""),
                     .init(title: "Games ", image: ""),
                     .init(title: "Phones", image: ""),
                     .init(title: "Idea", image: ""),
                     .init(title: "Car", image: "")])
    }()
    private let brands: ListSection = {
        .brands([.init(title: "Kids", image: ""),
                 .init(title: "Games ", image: ""),
                 .init(title: "Phones", image: ""),
                 .init(title: "Idea", image: ""),
                 .init(title: "Car", image: "")])
    }()
    var pageData: [ListSection] {
        [category, latest, flashSale, brands]
    }
}
