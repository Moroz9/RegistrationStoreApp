//
//  ALogInViewController.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 14.04.23.
//
//   swiftlint:disable all

import UIKit

class ALogInViewController<CustomView: UIView>: UIViewController {
    
    var myLogView: CustomView {
        return view as! CustomView
    }

    override func loadView() {
        view = CustomView()
    }
}
//   swiftlint:enable all
