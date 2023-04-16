//
//  CastumTextField.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 08.04.23.
//

import UIKit

class CustomTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    init(placeholderTextField: String) {
        super.init(frame: .zero)
        backgroundColor = .textColorTextFieldGray
        borderStyle = .none
        layer.cornerRadius = 10
        textColor = .titntColorTextFieldGray
        clearButtonMode = .always
        clearButtonMode = .whileEditing
        returnKeyType = .done
        placeholder = placeholderTextField
        textAlignment = .center
        tintColor = .titntColorTextFieldGray
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
