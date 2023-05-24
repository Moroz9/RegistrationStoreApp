//
//  LogInVC.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 14.04.23.
//

import UIKit

final class LogInViewVC: ALogInViewController<LogInView> {
    // MARK: - Properties
    
    private let storage: UserDefaultsManagerProtocol = UserDefaultsManager()
    private let verificationModel = VerificationModel()
    private let passwordValidType: String.ValidTypes = .password
    private let emailValidType: String.ValidTypes = .email
    private var isPrivate = true
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        registerKeyboardNotification()
    }
    
    // MARK: - Flow func
    
    private func setupDelegate() {
        myLogView.delegate = self
        myLogView.collectionViewLogIn.dataSource = self
        myLogView.collectionViewLogIn.selectMailDelegate = self
        myLogView.mailTextFieldLogIn.delegate = self
        myLogView.passwordTextFieldLogIn.delegate = self
    }
    
    private func validateTextFields() -> Bool {
        
        guard let passwordText = myLogView.passwordTextFieldLogIn.text,
              let emailText = myLogView.mailTextFieldLogIn.text else {
            showError(message: "Remember all the fields")
            return false
        }
        
            if !passwordText.isValidType(validType: passwordValidType) {
                showError(message: Text.wrongMessageP)
                return false
            } else if !emailText.isValidType(validType: emailValidType) {
                showError(message: Text.wrongMessageMail)
                return false
            }
        
        guard checkStorage(mail: emailText, password: passwordText) else {
          return false
        }
        
        return true
    }
    
    private func checkStorage(mail: String, password: String ) -> Bool {
        
        if storage.string(forKey: .email) != mail {
            showError(message: "Please check your email")
            return false
        }
        
       if storage.string(forKey: .password) != password {
           showError(message: "Please check your password")
           return false
        }
        return true
    }
    
    private func navigateToMainTabBarController() {
        let controller = MainTabBarController()
        navigationController?.navigationBar.isHidden = true
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func showError(message: String) {
        myLogView.statusLabelLogin.alpha = 1
        myLogView.statusLabelLogin.textColor = .red
        myLogView.statusLabelLogin.text = message
    }
    
}
    
    // MARK: - LogInViewDelegate

extension LogInViewVC: LogInViewDelegate {
    
    func logInButtonAuthTapped() {
        guard validateTextFields() else { return }
       
        navigateToMainTabBarController()
        
    }
    
    func logInEyeButtonTapped() {
        let imageName = isPrivate ? "ImagEays" : "ImagEays.Slash"
        
        myLogView.passwordTextFieldLogIn.isSecureTextEntry.toggle()
        myLogView.eyeButton.setImage(UIImage(named: imageName), for: .normal)
        isPrivate.toggle()
    }
    
}

    // MARK: - Extensions
    
extension LogInViewVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let validType: String.ValidTypes
        var validMessage: String
        var wrongMessage: String
        var textFieldToUpdate: UITextField
        
        switch textField {
        case myLogView.passwordTextFieldLogIn:
            validType = passwordValidType
            validMessage = Text.validMessagePassword
            wrongMessage = Text.wrongMessageP
            textFieldToUpdate = myLogView.passwordTextFieldLogIn
        case myLogView.mailTextFieldLogIn:
            validType = emailValidType
            validMessage = Text.validMessageMail
            wrongMessage = Text.wrongMessageMail
            textFieldToUpdate = myLogView.mailTextFieldLogIn
        default:
            return false
        }

        if let text = textField.text, let rangeText = Range(range, in: text) {
            let result = text.replacingCharacters(in: rangeText, with: string)
            textFieldToUpdate.text = result
            
            if textField == myLogView.mailTextFieldLogIn {
                verificationModel.getFilterMail(text: result)
                myLogView.collectionViewLogIn.reloadData()
            }
            
            let newPosition = textFieldToUpdate.position(from: textFieldToUpdate.beginningOfDocument, offset: range.location + string.count)
            textFieldToUpdate.selectedTextRange = textFieldToUpdate.textRange(from: newPosition!, to: newPosition!)
            
            if result.isValidType(validType: validType) {
                myLogView.statusLabelLogin.text = validMessage
                myLogView.statusLabelLogin.textColor = .green
            } else {
                myLogView.statusLabelLogin.alpha = 1
                myLogView.statusLabelLogin.textColor = .red
                myLogView.statusLabelLogin.text = wrongMessage
            }
        }
        
        return false
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        myLogView.statusLabelLogin.alpha = 0
        verificationModel.filteredMailArray = []
        myLogView.collectionViewLogIn.reloadData()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        myLogView.eyeButton.isEnabled = !text.isEmpty
    }
}

    // MARK: - UICollectionViewDataSource
    
    extension LogInViewVC: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return verificationModel.filteredMailArray.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
    
    extension LogInViewVC: SelectProposedMailProtocol {
        func selectProposedMail(indexPath: IndexPath) {
            guard let text = myLogView.mailTextFieldLogIn.text else { return }
            verificationModel.getMailName(text: text)
            let domainMail = verificationModel.filteredMailArray[indexPath.row]
            let mailFullName = verificationModel.nameMail + domainMail
            myLogView.mailTextFieldLogIn.text = mailFullName
            myLogView.statusLabelLogin.isValid = mailFullName.isValidType(validType: emailValidType)
            myLogView.logInButtonAuth.isValid = mailFullName.isValidType(validType: emailValidType)
            verificationModel.filteredMailArray = []
            myLogView.collectionViewLogIn.reloadData()
        }
    }

    // MARK: - Keyboard Notification
    
    extension LogInViewVC {
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
        
        @objc private func keyboardWillShow(notification: Notification) {
            let userInfo = notification.userInfo
            guard let keyboardHeight = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
            myLogView.scrollView.contentOffset = CGPoint(x: 0, y: keyboardHeight.height / 3 )
        }
        
        @objc private func keyboardWillHide(notification: Notification) {
            myLogView.scrollView.contentOffset = CGPoint.zero
        }
    }
