//
//  Resources.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 16.04.23.
//

import UIKit

enum Resources {
    enum Color {
        static var active = UIColor(hexString: "#737297")
        static var inactive = UIColor(hexString: "#909090")
        static var backgroundTabBar = UIColor(hexString: "#FFFFFF")
        static var backgroundView = UIColor(hexString: "#FAF9FF")
        static var textColorTextField = UIColor(hexString: "#7B7B7B")
        static var titntColorTextField = UIColor(hexString: "#7B7B7B")
        static var backgroundTextFied = UIColor(hexString: "#E8E8E8")
        static var backgroundButton = UIColor(hexString: "#4E55D7")
        static var backgroundButtonText = UIColor(hexString: "#EAEAEA")
        static var backgroundLabel = UIColor(hexString: "#161826")
        static var colotTextBlack = UIColor(hexString: "#000000")
        static var colotCustomTextBlue = UIColor(hexString: "#4E55D7")
        static var textColorStatusLabelRed = UIColor.red
        static var textColorStatusLabelGreen = UIColor.green
    }
    enum TextNamed {
        static var textSignIn = String("Sign In")
        static var textLogIn = String("Log In")
        static var textCheckEmail = String("Check you email")
        static var textAlradyHaveAnAccoutn = String("Alrady have an account?")
        static var textSignInWithGoogle = String("Sign In with Google")
        static var textSignInWithApple = String("Sign In with Apple")
        static var textFirstName = String("First Name")
        static var textLastName = String( "Last Name")
        static var textPassword = String( "Password")
        static var textEmail = String("Email")
        static var welcomeBack = String("Welcome Back")
        static var searchLoop = String("searchLoop")
        static var category = String("Category")
        static var viewAll = String("View all")
        static var searchPlaceholder = String("Whats are you looking for?")
        static var textProfile = String("Profile")
        static var tradeBy = String("Trade by")
        static var textBata = String(" bata")
        static var upload = String("Upload item")
        static var imageButton = String("ImageButton")
        static var arrow = String("Arrow")
        
        // MARK: - Image
        static var imageLogIn = String( "ImageLogIn")
        static var imageGoogle = String("ImageGoogle")
        static var imageApple = String("ImageApple")
        static var clippathgroup = String("Clippathgroup")
        static var location = String("location")
        static var imagePhoto = String("ImagePhoto")
        static var categoryBurger = String("categoryBurger")
        // MARK: - validMessage
        static var validMessageFirst = String( "First Name is valid")
        static var validMessageLast = String("Last Name is valid")
        static var validMessagePassword = String("Password is valid")
        static var validMessageeMail = String("Email is valid")
        static var wrongMessageeF = String( "Only A-Z characters, min 1 character")
        static var wrongMessageeL = String( "Only A-Z characters, min 1 character")
        static var wrongMessageeP = String("Password is not valid")
        static var wrongMessageeMail = String("Mail is not valid. Example: name@domein.ru/com")
    }
    enum CollectionViewCell {
        static var categorypeCollectionViewCell = String("CategorypeCollectionViewCell")
        static var latestCollectionViewCell = String("LatestCollectionViewCell")
        static var fastSaleCollectionViewCell = String("FlashSalesCollectionViewCell")
        static var brendsCollectionViewCell = String("BrendsCollectionViewCell")
        static var collectionViewHeaderReusableView = String("CollectionViewHeaderReusableView")
    }
}
