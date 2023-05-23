//
//  Authentication.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 08.04.23.
//

import UIKit

final class AuthenticationVC: AAuthenticationViewController<AuthenticationView> {
    
    // MARK: - Var/Let
    private let storage: UserDefaultsManagerProtocol = UserDefaultsManager()
    private let verificationModel = VerificationModel()
    private let firstNameValidType: String.ValidTypes = .firstName
    private let passwordValidType: String.ValidTypes = .password
    private let emailValidType: String.ValidTypes = .email
    
    // MARK: - Lifecycle func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        registerKeyboardNotification()
    }
    
    // MARK: - Flow func
    
    private func setupDelegates() {
        myView.delegate = self
        myView.collectionView.dataSource = self
        myView.collectionView.selectMailDelegate = self
        myView.mailTextField.delegate = self
        myView.firstNameTextField.delegate = self
        myView.lastNameTextField.delegate = self
        myView.passwordTextField.delegate = self
    }
    
    private func checkEmail(mail: String) -> Bool {
            if storage.string(forKey: .email) == mail {
                return true
            }
            return false
        }
    
    private func validateTextFields() -> Bool {
        guard let firstNameText = myView.firstNameTextField.text,
              let lastNameText = myView.lastNameTextField.text,
              let passwordText = myView.passwordTextField.text,
              let emailText = myView.mailTextField.text else {
            return false
        }
        
        return firstNameText.isValidType(validType: firstNameValidType) &&
            lastNameText.isValidType(validType: firstNameValidType) &&
            passwordText.isValidType(validType: passwordValidType) &&
            emailText.isValidType(validType: emailValidType)
    }
    
    private func handleValidEmail(_ email: String) {
        if checkEmail(mail: email) {
            myView.statusLabel.alpha = 1
            myView.statusLabel.textColor = .red
            myView.statusLabel.text = "Please make new email"
        } else {
            storage.set(myView.firstNameTextField.text, forKey: .firstName)
            storage.set(myView.lastNameTextField.text, forKey: .lastName)
            storage.set(myView.passwordTextField.text, forKey: .password)
            storage.set(email, forKey: .email)
            let controller = MainTabBarController()
            navigationController?.navigationBar.isHidden = true
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    private func handleInvalidFields() {
        myView.statusLabel.alpha = 1
        myView.statusLabel.textColor = .red
        myView.statusLabel.text = "Fill in all the fields"
    }
}

// MARK: - AuthenticationViewDelegate

extension AuthenticationVC: AuthenticationViewDelegate {
    func signInButtonAuthTapped() {
        guard validateTextFields() else {
            handleInvalidFields()
            return
        }
        
        if let emailText = myView.mailTextField.text {
            handleValidEmail(emailText)
        }
    }
    
    func logInButtonAuthTapped() {
        let controller = LogInViewVC()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func googleButtonTapped() {
        print(#function)
    }
    
    func appleButtonTapped() {
        print(#function)
    }
}

// MARK: - Extensions UITextFieldDelegate

extension AuthenticationVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let validType: String.ValidTypes
        var validMessage: String
        var wrongMessage: String
        var textFieldToUpdate: UITextField
        
        switch textField {
        case myView.firstNameTextField:
            validType = firstNameValidType
            validMessage = Text.validMessageFirst
            wrongMessage = Text.wrongMessageF
            textFieldToUpdate = myView.firstNameTextField
        case myView.lastNameTextField:
            validType = firstNameValidType
            validMessage = Text.validMessageLast
            wrongMessage = Text.wrongMessageL
            textFieldToUpdate = myView.lastNameTextField
        case myView.passwordTextField:
            validType = passwordValidType
            validMessage = Text.validMessagePassword
            wrongMessage = Text.wrongMessageP
            textFieldToUpdate = myView.passwordTextField
        case myView.mailTextField:
            validType = emailValidType
            validMessage = Text.validMessageMail
            wrongMessage = Text.wrongMessageMail
            textFieldToUpdate = myView.mailTextField
        default:
            return false
        }
        
        if let text = textField.text, let rangeText = Range(range, in: text) {
            let result = text.replacingCharacters(in: rangeText, with: string)
            textFieldToUpdate.text = result
            
            if textField == myView.mailTextField {
                verificationModel.getFilterMail(text: result)
                myView.collectionView.reloadData()
            }
            
            let newPosition = textFieldToUpdate.position(from: textFieldToUpdate.beginningOfDocument, offset: range.location + string.count)
            textFieldToUpdate.selectedTextRange = textFieldToUpdate.textRange(from: newPosition!, to: newPosition!)
            
            if result.isValidType(validType: validType) {
                myView.statusLabel.text = validMessage
                myView.statusLabel.textColor = .green
            } else {
                myView.statusLabel.alpha = 1
                myView.statusLabel.textColor = .red
                myView.statusLabel.text = wrongMessage
            }
        }
        
        return false
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        myView.statusLabel.alpha = 0
        verificationModel.filteredMailArray = []
        myView.collectionView.reloadData()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - UICollectionViewDataSource

extension AuthenticationVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        verificationModel.filteredMailArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IdCell.idMailCell.rawValue,
                                                            for: indexPath) as? MailCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        let mailLabelText = verificationModel.filteredMailArray[indexPath.row]
        cell.configure(withMailLabelText: mailLabelText)
        return cell
    }
}

// MARK: - SelectProposedMailProtocol

extension AuthenticationVC: SelectProposedMailProtocol {
    func selectProposedMail(indexPath: IndexPath) {
        guard let text = myView.mailTextField.text else { return }
        verificationModel.getMailName(text: text)
        let domainMail = verificationModel.filteredMailArray[indexPath.row]
        let mailFullName = verificationModel.nameMail + domainMail
        myView.mailTextField.text = mailFullName
        myView.statusLabel.isValid = mailFullName.isValidType(validType: emailValidType)
        myView.signInButtonAuth.isValid = mailFullName.isValidType(validType: emailValidType)
        verificationModel.filteredMailArray = []
        myView.collectionView.reloadData()
    }
}

// MARK: - RegisterKeyboardNotification

extension AuthenticationVC {
    private func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        let userInfo = notification.userInfo
        let keyboardHeight = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        myView.scrollView.contentOffset = CGPoint(x: 0, y: keyboardHeight!.height / 2.65 )
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        myView.scrollView.contentOffset = CGPoint.zero
    }
}
