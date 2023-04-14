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
    
    // MARK: - Text
    static var textSignIn: String {
        "Sign In"
    }
    static var textLogIn: String {
        "Log In"
    }
    static var textCheckEmail: String {
        "Check you email"
    }
    static var textAlradyHaveAnAccoutn: String {
        "Alrady have an account?"
    }
    static var textSignIrn: String {
        "Sign In"
    }
    static var textSignInWithGoogle: String {
        "Sign In with Google"
    }
    static var textSignInWithApple: String {
        "Sign In with Apple"
    }
    static var textFirstName: String {
        "First Name"
    }
    static var textLastName: String {
        "Last Name"
    }
    static var textPassword: String {
        "Password"
    }
    static var textEmail: String {
        "Email"
    }
    static var welcomeBack: String {
        "Welcome Back"
    }
    // MARK: - Image
    static var imageLogIn: String {
        "ImageLogIn"
    }
    static var imageGoogle: String {
        "ImageGoogle"
    }
    static var imageApple: String {
        "ImageApple"
    }
    // MARK: - validMessage
    static var validMessageFirst: String {
        "First Name is valid"
    }
    static var validMessageLast: String {
        "Last Name is valid"
    }
    static var validMessagePassword: String {
        "Password is valid"
    }
    static var validMessageeMail: String {
        "Email is valid"
    }
    static var wrongMessageeF: String {
        "Only A-Z characters, min 1 character"
    }
    static var wrongMessageeL: String {
        "Only A-Z characters, min 1 character"
    }
    static var wrongMessageeP: String {
        "Password is not valid"
    }
    static var wrongMessageeMail: String {
        "Mail is not valid. Example: name@domein.ru/com"
    }
}
