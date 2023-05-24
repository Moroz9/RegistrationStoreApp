//
//  CellIdentifier.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 24.05.23.
//

import Foundation

struct CellIdentifier {
    static let idProfileChangePhotoCell = "ProfileChangePhotoViewCell"
    static let idProfileButtonCell = "ButtonUpLoadTableViewCell"
    static let idProfileButtonSettingsCell = "ProfileButtonSettingsViewCell"
}

enum Section {
    case idProfileChangePhotoCell(items: [PersonsModel])
    case idProfileButtonCell(items: [UpLoadItemButtonModel])
    case idProfileButtonSettingsCell(items: [ProfileButtonSettingsModel])
}
