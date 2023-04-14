//
//  UIView.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 08.04.23.
//

import UIKit

extension UIView {
    convenience init(backgroundColorView: UIColor ) {
        self.init()
        let imageView = UIView()
        imageView.backgroundColor = backgroundColorView
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
}
