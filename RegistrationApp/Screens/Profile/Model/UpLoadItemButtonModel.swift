//
//  UpLoadItemButtonModel.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 24.05.23.
//

import Foundation

struct UpLoadItemButtonModel {
    let name: String
    let image: String
}

extension UpLoadItemButtonModel {
    static var exampleList: [UpLoadItemButtonModel] = [
        UpLoadItemButtonModel(name: "Upload", image: "image-11")
    ]
}
