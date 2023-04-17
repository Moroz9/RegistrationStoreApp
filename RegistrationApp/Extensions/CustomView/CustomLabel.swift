//
//  CastumLabel.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 08.04.23.
//

import UIKit

final class CustomLabel: UILabel {
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
    init(title: String, textColorLabel: UIColor, alphaLabel: CGFloat, fontCastumLabel: UIFont?) {
        super.init(frame: .zero)
        text = title
        textColor = textColorLabel
        font = fontCastumLabel
        adjustsFontSizeToFitWidth = true
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
        alpha = alphaLabel
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setNotValidSetting() {
        text = "Mail is not valid. Example: name@domein.ru"
        textColor = .textColorStatusLabelRed
        alpha = 1
    }
    private func setValidSetting() {
        text = "Mail is valid"
        textColor = .textColorStatusLabelGreen
        alpha = 1
    }
}
