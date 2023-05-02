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
        setDelegate()
        registerKeyboardNotification()
    }
    
    // MARK: - Flow func
    
    private func setDelegate() {
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
    
    private func setTextfield(textField: UITextField, label: UILabel, validType: String.ValidTypes, validMessage: String, wrongMessage: String, string: String, range: NSRange) {
        
        if let text = textField.text, let rangeText = Range(range, in: text) {
            let result = text.replacingCharacters(in: rangeText, with: string)
            textField.text = result
            
            if textField == myView.mailTextField {
                verificationModel.getFilterMail(text: result)
                myView.collectionView.reloadData()
            }
            if result.isValidType(validType: validType) {
                myView.statusLabel.text = validMessage
                myView.statusLabel.textColor = .green
            } else {
                myView.statusLabel.alpha = 1
                myView.statusLabel.textColor = .red
                myView.statusLabel.text = wrongMessage
            }
        }
    }
}
// MARK: - AuthenticationViewDelegate

extension AuthenticationVC: AuthenticationViewDelegate {
    func signInButtonAuthTapped() {
        let firstNameText = myView.firstNameTextField.text ?? ""
        let lastNameText = myView.lastNameTextField.text ?? ""
        let passwordText = myView.passwordTextField.text ?? ""
        let emailText = myView.mailTextField.text ?? ""
        let checkEmail = checkEmail(mail: emailText)
        print(emailText)
        
        if firstNameText.isValidType(validType: firstNameValidType) && passwordText.isValidType(validType: passwordValidType)
            && lastNameText.isValidType(validType: firstNameValidType) && emailText.isValidType(validType: emailValidType) == true {
            
            if checkEmail == false {
                storage.set(firstNameText, forKey: .firstName)
                storage.set(lastNameText, forKey: .lastName)
                storage.set(passwordText, forKey: .password)
                storage.set(emailText, forKey: .email)
                let controller = MainTabBarController()
                navigationController?.navigationBar.isHidden = true
                navigationController?.pushViewController(controller, animated: true)
            } else {
                myView.statusLabel.alpha = 1
                myView.statusLabel.textColor = .red
                myView.statusLabel.text = "Please make new email"
            }
        } else {
            myView.statusLabel.alpha = 1
            myView.statusLabel.textColor = .red
            myView.statusLabel.text = "Fill in all the fields"
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
        switch textField {
        case myView.firstNameTextField: setTextfield(textField: myView.firstNameTextField,
                                                    label: myView.statusLabel,
                                                    validType: firstNameValidType,
                                                    validMessage: Text.validMessageFirst,
                                                    wrongMessage: Text.wrongMessageF,
                                                    string: string,
                                                    range: range)
        case myView.lastNameTextField: setTextfield(textField: myView.lastNameTextField,
                                                   label: myView.statusLabel,
                                                   validType: firstNameValidType,
                                                   validMessage: Text.validMessageLast,
                                                   wrongMessage: Text.wrongMessageL,
                                                   string: string,
                                                   range: range)
        case myView.passwordTextField: setTextfield(textField: myView.passwordTextField,
                                                   label: myView.statusLabel,
                                                   validType: passwordValidType,
                                                   validMessage: Text.validMessagePassword,
                                                   wrongMessage: Text.wrongMessageP,
                                                   string: string,
                                                   range: range)
        case myView.mailTextField: setTextfield(textField: myView.mailTextField,
                                               label: myView.statusLabel,
                                               validType: emailValidType,
                                               validMessage: Text.validMessageMail,
                                               wrongMessage: Text.wrongMessageMail,
                                               string: string,
                                               range: range)
        default:
            break
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
        self.resignFirstResponder()
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
        else {return UICollectionViewCell()}
        let mailLabelText = verificationModel.filteredMailArray[indexPath.row]
        cell.cellConfigure(mailLabelText: mailLabelText)
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
