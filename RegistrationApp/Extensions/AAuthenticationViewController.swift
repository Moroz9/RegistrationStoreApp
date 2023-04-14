//
//  AAViewController.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 08.04.23.
//
//   swiftlint:disable all

import UIKit

class AAuthenticationViewController<CustomView: UIView>: UIViewController {

    var myView: CustomView {
        return view as! CustomView
    }

    override func loadView() {
        view = CustomView()
    }
}
//   swiftlint:enable all
