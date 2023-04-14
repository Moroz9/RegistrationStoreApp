//
//  UIButtonImage.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 08.04.23.
//

import UIKit

extension UIButton {
    convenience init(imageName: String ) {
        self.init()
        let image = UIImage(named: imageName)
        self.setImage(image, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
