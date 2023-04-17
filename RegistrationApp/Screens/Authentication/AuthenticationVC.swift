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
    
    // MARK: - Lifecycle funcs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        registerKeyboardNotification()
    }
    
    // MARK: - Flow funcs
    
    private func setDelegate() {
        myView.delegate = self
        myView.collectionView.dataSource = self
        myView.collectionView.selectMailDelegate = self
        myView.mailTextFild.delegate = self
        myView.firstNameTextFild.delegate = self
        myView.lastNameTextFild.delegate = self
        myView.passwordTextFild.delegate = self
    }
    private func chekEmail(mail: String) -> Bool {
        if storage.string(forkey: .email) == mail {
            return true
        }
        return false
    }
    
    private func setTextfield(textField: UITextField, label: UILabel, validType: String.ValidTypes, validMessage: String, wrongMessage: String, string: String, range: NSRange) {
        let text = (textField.text ?? "") + string
        let result: String
        
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            result = String(text[text.startIndex..<end])
        } else {
            result = text
        }
        textField.text = result
        
        if textField == myView.mailTextFild {
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
// MARK: - AuthenticationViewDelegate

extension AuthenticationVC: AuthenticationViewDelegate {
    func signInButtonAuthTapped() {
        let firstNameText = myView.firstNameTextFild.text ?? ""
        let lastNameText = myView.lastNameTextFild.text ?? ""
        let passwordText = myView.passwordTextFild.text ?? ""
        let emailText = myView.mailTextFild.text ?? ""
        let checkEmail = chekEmail(mail: emailText)
        print(emailText)
        
        if firstNameText.isValidType(validType: firstNameValidType) && passwordText.isValidType(validType: passwordValidType)
            && lastNameText.isValidType(validType: firstNameValidType) && emailText.isValidType(validType: emailValidType) == true {
            
            if checkEmail == false {
                storage.set(firstNameText, forkey: .firstName)
                storage.set(lastNameText, forkey: .lastName)
                storage.set(passwordText, forkey: .password)
                storage.set(emailText, forkey: .email)
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
            myView.statusLabel.text = "Fill in all the filds"
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
        case myView.firstNameTextFild: setTextfield(textField: myView.firstNameTextFild,
                                                    label: myView.statusLabel,
                                                    validType: firstNameValidType,
                                                    validMessage: Resources.TextNamed.validMessageFirst,
                                                    wrongMessage: Resources.TextNamed.wrongMessageeF,
                                                    string: string,
                                                    range: range)
        case myView.lastNameTextFild: setTextfield(textField: myView.lastNameTextFild,
                                                   label: myView.statusLabel,
                                                   validType: firstNameValidType,
                                                   validMessage: Resources.TextNamed.validMessageLast,
                                                   wrongMessage: Resources.TextNamed.wrongMessageeL,
                                                   string: string,
                                                   range: range)
        case myView.passwordTextFild: setTextfield(textField: myView.passwordTextFild,
                                                   label: myView.statusLabel,
                                                   validType: passwordValidType,
                                                   validMessage: Resources.TextNamed.validMessagePassword,
                                                   wrongMessage: Resources.TextNamed.wrongMessageeP,
                                                   string: string,
                                                   range: range)
        case myView.mailTextFild: setTextfield(textField: myView.mailTextFild,
                                               label: myView.statusLabel,
                                               validType: emailValidType,
                                               validMessage: Resources.TextNamed.validMessageeMail,
                                               wrongMessage: Resources.TextNamed.wrongMessageeMail,
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
        myView.firstNameTextFild.resignFirstResponder()
        myView.lastNameTextFild.resignFirstResponder()
        myView.mailTextFild.resignFirstResponder()
        myView.passwordTextFild.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
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
        guard let text = myView.mailTextFild.text else { return }
        verificationModel.getMailName(text: text)
        let domainMail = verificationModel.filteredMailArray[indexPath.row]
        let mailfullName = verificationModel.nameMail + domainMail
        myView.mailTextFild.text = mailfullName
        myView.statusLabel.isValid = mailfullName.isValidType(validType: emailValidType)
        myView.signInButtonAuth.isValid = mailfullName.isValidType(validType: emailValidType)
        verificationModel.filteredMailArray = []
        myView.collectionView.reloadData()
    }
}
// MARK: - RegisterKeyboardNotification

extension AuthenticationVC {
    private func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(kevboardwillshow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(kevboardwillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    @objc private func kevboardwillshow(notification: NSNotification) {
        let userInfo = notification.userInfo
        let keyboardheigth = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        myView.scrollView.contentOffset = CGPoint(x: 0, y: keyboardheigth!.height / 2.65 )
    }
    @objc private func kevboardwillHide(notification: NSNotification) {
        myView.scrollView.contentOffset = CGPoint.zero
    }
}
