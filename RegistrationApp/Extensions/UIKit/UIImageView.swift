//
//  UIImageView.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 08.04.23.
//

import UIKit

extension UIImageView {
    convenience init(imageName: String ) {
        self.init()
        let image = UIImage(named: imageName)
        self.image = image
        self.contentMode = .scaleAspectFit
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
