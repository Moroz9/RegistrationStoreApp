//
//  ProfileButtonSettingsModel.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 14.04.23.
//

import UIKit

struct ProfileButtonSettingsModel {
    let leftIconName: String
    let primaryText: String
    let secondaryText: String?
    let withArrow: Bool = false
}

extension ProfileButtonSettingsModel {
    static var exampleList: [ProfileButtonSettingsModel] = [
        ProfileButtonSettingsModel(leftIconName: "Folder", primaryText: "Trade store", secondaryText: nil),
        ProfileButtonSettingsModel(leftIconName: "Folder", primaryText: "Payment method", secondaryText: nil),
        ProfileButtonSettingsModel(leftIconName: "Folder", primaryText: "Balance", secondaryText: "$1593"),
        ProfileButtonSettingsModel(leftIconName: "Folder", primaryText: "Trade history", secondaryText: nil),
        ProfileButtonSettingsModel(leftIconName: "Restore", primaryText: "Restore Purchase", secondaryText: nil),
        ProfileButtonSettingsModel(leftIconName: "Help", primaryText: "Help", secondaryText: ""),
        ProfileButtonSettingsModel(leftIconName: "LogOut", primaryText: "Log Out", secondaryText: "")
    ]
}
