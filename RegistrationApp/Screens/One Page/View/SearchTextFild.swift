//
//  SearchBar.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 17.04.23.
//

import UIKit

protocol SearchFildProtocol: AnyObject {
    func typingText(text: String )
    func cleanOutTextField()
}
// MARK: - PasswordLogInTextFild

final class SearchTextFild: UITextField, UITextFieldDelegate {
    
    weak var textFieldDelegate: SearchFildProtocol?
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        delegate = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        backgroundColor = Resources.Color.backgroundTextFied
        borderStyle = .none
        layer.cornerRadius = 15
        textColor = Resources.Color.textColorTextField
//        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: self.frame.height))
        leftViewMode = .always
        clearButtonMode = .always
        returnKeyType = .done
        placeholder = Resources.TextNamed.searchPlaceholder
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 12)
        tintColor = Resources.Color.textColorTextField
        translatesAutoresizingMaskIntoConstraints = false
    }
}
// MARK: - UITextFieldDelegate

extension SearchTextFild {
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
