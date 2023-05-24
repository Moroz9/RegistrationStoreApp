//
//  PersonsModel.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 24.05.23.
//

import Foundation
import UIKit

struct PersonsModel {
    let name: String
    let changeName: String
    let image: UIImage
}

extension PersonsModel {
    static var exampleList: [PersonsModel] = [
        PersonsModel(name: "Name", changeName: "Change photo", image: UIImage())
    ]
}
