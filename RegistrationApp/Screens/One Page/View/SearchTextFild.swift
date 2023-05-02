//
//  SearchBar.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 17.04.23.
//

import UIKit

protocol SearchFieldProtocol: AnyObject {
    func typingText(text: String )
    func cleanOutTextField()
}
// MARK: - PasswordLogInTextField

final class SearchTextField: UITextField, UITextFieldDelegate {
    
    weak var textFieldDelegate: SearchFieldProtocol?
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = Color.backgroundTextField
        borderStyle = .none
        layer.cornerRadius = 15
        textColor = Color.textColorTextField
//        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: self.frame.height))
        leftViewMode = .always
        clearButtonMode = .always
        returnKeyType = .done
        placeholder = Text.searchPlaceholder
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 12)
        tintColor = Color.textColorTextField
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - UITextFieldDelegate

extension SearchTextField {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let rangeText = Range(range, in: text) {
            let updateText = text.replacingCharacters(in: rangeText, with: string)
            textFieldDelegate?.typingText(text: updateText)
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textFieldDelegate?.cleanOutTextField()
        return true
    }
}
