//
//  CastumButton.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 08.04.23.
//

import UIKit

final class CustomButton: UIButton {
    
    public var isValid: Bool  = false {
        didSet {
            if self.isValid {
                setValidSetting()
            } else {
                setNotValidSetting()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String, colorTitle: UIColor, backgroundColorButton: UIColor, configurationImage: String, imageRight: CGFloat, imageLeft: CGFloat) {
        super.init(frame: .zero)
        backgroundColor = backgroundColorButton
        setTitle(title, for: .normal)
        setTitleColor(colorTitle, for: .normal)
        setImage(UIImage(named: configurationImage), for: .normal)
        imageEdgeInsets = UIEdgeInsets(top: 0, left: imageLeft, bottom: 0, right: imageRight)
        layer.cornerRadius = 15
        titleLabel?.font = .montserrat30()
//        isEnabled = false
        alpha = 1
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setValidSetting() {
        isEnabled = true
        alpha = 1
    }
    
    private func setNotValidSetting() {
        isEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
