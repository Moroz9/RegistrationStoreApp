//
//  EyeButton.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 15.04.23.
//

import UIKit

final class EyeButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupEyeButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupEyeButton() {
        setImage(UIImage(named: "ImagEays.Slash"), for: .normal)
        tintColor = .black
        widthAnchor.constraint(equalToConstant: 20).isActive = true
        isEnabled = false
    }
}
