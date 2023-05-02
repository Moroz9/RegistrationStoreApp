//
//  Resources.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 16.04.23.
//

import UIKit

enum Color {
    static let active = UIColor(hexString: "#737297")
    static let inactive = UIColor(hexString: "#909090")
    static let backgroundTabBar = UIColor(hexString: "#FFFFFF")
    static let backgroundView = UIColor(hexString: "#FAF9FF")
    static let textColorTextField = UIColor(hexString: "#7B7B7B")
    static let tintColorTextField = UIColor(hexString: "#7B7B7B")
    static let backgroundTextField = UIColor(hexString: "#E8E8E8")
    static let backgroundButton = UIColor(hexString: "#4E55D7")
    static let backgroundButtonText = UIColor(hexString: "#EAEAEA")
    static let backgroundLabel = UIColor(hexString: "#161826")
    static let colorTextBlack = UIColor(hexString: "#000000")
    static let colorCustomTextBlue = UIColor(hexString: "#4E55D7")
    static let textColorStatusLabelRed = UIColor.red
    static let textColorStatusLabelGreen = UIColor.green
}

enum Text {
    static let textSignIn = String("Sign In")
    static let textLogIn = String("Log In")
    static let textCheckEmail = String("Check you email")
    static let textAlreadyHaveAnAccount = String("Already have an account?")
    static let textSignInWithGoogle = String("Sign In with Google")
    static let textSignInWithApple = String("Sign In with Apple")
    static let textFirstName = String("First Name")
    static let textLastName = String( "Last Name")
    static let textPassword = String( "Password")
    static let textEmail = String("Email")
    static let welcomeBack = String("Welcome Back")
    static let searchLoop = String("searchLoop")
    static let category = String("Category")
    static let viewAll = String("View all")
    static let searchPlaceholder = String("Whats are you looking for?")
    static let textProfile = String("Profile")
    static let tradeBy = String("Trade by")
    static let textBata = String(" bata")
    static let upload = String("Upload item")
    static let imageButton = String("ImageButton")
    static let arrow = String("Arrow")
    static let validMessageFirst = String( "First Name is valid")
    static let validMessageLast = String("Last Name is valid")
    static let validMessagePassword = String("Password is valid")
    static let validMessageMail = String("Email is valid")
    static let wrongMessageF = String( "Only A-Z characters, min 1 character")
    static let wrongMessageL = String( "Only A-Z characters, min 1 character")
    static let wrongMessageP = String("Password is not valid")
    static let wrongMessageMail = String("Mail is not valid. Example: name@domein.ru/com")

// MARK: - Image

    static let imageLogIn = String("ImageLogIn")
    static let imageGoogle = String( "ImageGoogle")
    static let imageApple = String( "ImageApple")
    static let clipPathgroup = String( "Clippathgroup")
    static let location = String( "location")
    static let imagePhoto = String( "ImagePhoto")
    static let categoryBurger = String( "categoryBurger")
}
enum CollectionViewCell {
    static var categoryCollectionViewCell = String("CategoryCollectionViewCell")
    static var latestCollectionViewCell = String("LatestCollectionViewCell")
    static var fastSaleCollectionViewCell = String("FlashSalesCollectionViewCell")
    static var brandsCollectionViewCell = String("BrandsCollectionViewCell")
    static var collectionViewHeaderReusableView = String("CollectionViewHeaderReusableView")
}
