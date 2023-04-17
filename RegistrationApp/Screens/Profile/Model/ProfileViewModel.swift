//
//  ProfileViewModel.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 14.04.23.
//

import UIKit
// MARK: - enum Section

enum Section {
    case idProfileChangePhotoCell(items: [PersonsModel])
    case idProfileButtonCell(items: [UpLoadItemButtonModel])
    case idProfileButtonSettingsCell(items: [ProfileButtonSettingsModel])
}
// MARK: - struct CellIdentifier

struct CellIdentifier {
    static var idProfileChangePhotoCell = "ProfileChangePhotoViewCell"
    static var idProfileButtonCell = "ButtonUpLoadTableViewCell"
    static var idProfileButtonSettingsCell = "ProfileButtonSettingsViewCell"
}
// MARK: - struct ProfileButtonSettingsModel

struct ProfileButtonSettingsModel {
    let leftIconName: String
    let primaryText: String
    let secondaryText: String?
    let withArrow: Bool = false
}
extension ProfileButtonSettingsModel {
    static var exampleList: [ProfileButtonSettingsModel] {
        let tradeStore = ProfileButtonSettingsModel(leftIconName: "Folder",
                        primaryText: "Trade store", secondaryText: nil)
        let paymentMethod =  ProfileButtonSettingsModel(leftIconName: "Folder",
                        primaryText: "Payment method", secondaryText: nil)
        let balance = ProfileButtonSettingsModel(leftIconName: "Folder",
                        primaryText: "Balance", secondaryText: "$1593")
        let tradeHistory = ProfileButtonSettingsModel(leftIconName: "Folder",
                        primaryText: "Trade history", secondaryText: nil)
        let restorePychase = ProfileButtonSettingsModel(leftIconName: "Restore",
                        primaryText: "Resrote Pychase", secondaryText: nil)
        let help = ProfileButtonSettingsModel(leftIconName: "Help",
                        primaryText: "Help", secondaryText: "")
        let logOut =  ProfileButtonSettingsModel(leftIconName: "LogOut",
                        primaryText: "Log Out", secondaryText: "")
        return [tradeStore, paymentMethod, balance, tradeHistory, restorePychase, help, logOut ]
    }
}

// MARK: - struct ProfileButtonSettingsModel

struct PersonsModel {
    var name: String
    var changeName: String
    var image: UIImage
}
//   swiftlint:disable all
extension PersonsModel {
    
    static var exampleList: [PersonsModel] {
        let person = PersonsModel(name: "Name", changeName: "Change photo", image: UIImage())
        return [person]
    }
}
//   swiftlint:disable all
// MARK: - struct UpLoadItemButtonModel

struct UpLoadItemButtonModel {
    var name: String
    var image: String
}
extension UpLoadItemButtonModel {
    static var exampleList: [UpLoadItemButtonModel] {
        let char01 = UpLoadItemButtonModel(name: "Upload", image: "image-11")
        return [char01]
    }
}
