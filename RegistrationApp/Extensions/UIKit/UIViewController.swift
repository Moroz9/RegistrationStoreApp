//
//  UIViewController.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 08.04.23.
//

import UIKit

extension UIViewController {
    private static func showSimpleAlert(titele: String, message: String ) {
        let alertController = UIAlertController(title: titele, message: message, preferredStyle: .alert)
        let okTitle = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okTitle)
    }
    private static func showChangeAlert(title: String, message: String, completion: @escaping() -> Void) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let okTitle = UIAlertAction(title: "OK", style: .default) { _ in
            completion()
        }
        let cansel = UIAlertAction(title: "Cansel", style: .cancel)
        alertController.addAction(okTitle)
        alertController.addAction(cansel)
    }
    static func showResultAlert (vController: UIViewController, massage: String ) {
        showSimpleAlert(titele: "Result", message: massage)
    }
    static func showErrorAlert(vController: UIViewController, massage: String, completion: @escaping() -> Void) {
        showChangeAlert(title: "Error", message: massage, completion: completion)
    }
}
