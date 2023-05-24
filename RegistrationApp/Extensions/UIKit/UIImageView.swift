//
//  UIImageView.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 08.04.23.
//

import UIKit

extension UIImageView {
    convenience init(imageName: String) {
        self.init()
        image = UIImage(named: imageName)
        contentMode = .scaleAspectFit
        translatesAutoresizingMaskIntoConstraints = false
    }

    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }

        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: url), let loadedImage = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self?.image = loadedImage
                }
            }
        }
    }
}
