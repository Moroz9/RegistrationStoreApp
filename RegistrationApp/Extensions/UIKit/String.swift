//
//  String.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 08.04.23.
//

import UIKit

extension String {
    // MARK: - ValidTypes
    
    enum ValidTypes {
        case firstName
        case password
        case email
    }
    enum Regex: String {
        case firstName = "[a-zA-Z]{2,}"
        case password = "^(?=.*[a-z])(?=.*[$$#!%*?&])[A-Za-z\\d$$#!%*?&]{6,}"
        case email = "[A-Z0-9a-z._]+@[A-Za-z0-9]+\\.[A-Za-z]{2,}"
    }
    func isValidType(validType: ValidTypes) -> Bool {
        let format = "SELF MATCHES %@"
        var regEx = ""
        switch validType {
        case .firstName: regEx = Regex.firstName.rawValue
        case .password:  regEx = Regex.password.rawValue
        case .email: regEx = Regex.email.rawValue
        }
        return NSPredicate(format: format, regEx).evaluate(with: self)
    }
}
