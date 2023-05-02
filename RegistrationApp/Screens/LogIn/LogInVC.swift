//
//  LogInVC.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 14.04.23.
//

import UIKit

final class LogInViewVC: ALogInViewController<LogInView> {
    // MARK: - Let \ Var
    
    private let storage: UserDefaultsManagerProtocol = UserDefaultsManager()
    private let verificationModel = VerificationModel()
    private let passwordValidType: String.ValidTypes = .password
    private let emailValidType: String.ValidTypes = .email
    private var isPrivate = true
    
    // MARK: - Lifecycle func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        registerKeyboardNotification()
    }
    
    // MARK: - Flow func
    
    private func setDelegate() {
        myLogView.delegate = self
        myLogView.collectionViewLogIn.dataSource = self
        myLogView.collectionViewLogIn.selectMailDelegate = self
        myLogView.mailTextFieldLogIn.delegate = self
        myLogView.passwordTextFieldLogIn.delegate = self
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
        if textField == myLogView.mailTextFieldLogIn {
            verificationModel.getFilterMail(text: result)
            myLogView.collectionViewLogIn.reloadData()
        }
        if result.isValidType(validType: validType) {
            myLogView.statusLabelLogin.text = validMessage
            myLogView.statusLabelLogin.textColor = .green
        } else {
            myLogView.statusLabelLogin.alpha = 1
            myLogView.statusLabelLogin.textColor = .red
            myLogView.statusLabelLogin.text = wrongMessage
        }
    }
    private func checkEmail(mail: String) -> Bool {
        if storage.string(forKey: .email) == mail {
            return true
        }
        return false
    }
    private func checkPassword(password: String) -> Bool {
        if storage.string(forKey: .password) == password {
            return true
        }
        return false
    }
}
// MARK: - LogInViewDelegate

extension LogInViewVC: LogInViewDelegate {
    func logInEyeButtonTapped() {
        let imageName = isPrivate ? "ImagEays" : "ImagEays.Slash"
        
        myLogView.passwordTextFieldLogIn.isSecureTextEntry.toggle()
        myLogView.eyeButton.setImage(UIImage(named: imageName), for: .normal)
        isPrivate.toggle()
    }
    
    func logInButtonAuthTapped() {
//        let emailNameText = myLogView.mailTextFieldLogIn.text ?? ""
//        let passwordText = myLogView.passwordTextFieldLogIn.text ?? ""
//        let checkEmail = checkEmail(mail: emailNameText)
//        let checkPassword = checkPassword(password: passwordText)
//
//        if passwordText.isValidType(validType: passwordValidType)
//            && emailNameText.isValidType(validType: emailValidType) == true {
//
//            if checkEmail == true {
//                if checkPassword == true {
                    let controller = MainTabBarController()
                    navigationController?.navigationBar.isHidden = true
                    navigationController?.pushViewController(controller, animated: true)
//                } else {
//                    myLogView.statusLabelLogin.alpha = 1
//                    myLogView.statusLabelLogin.textColor = .red
//                    myLogView.statusLabelLogin.text = "Please checked password"
//                }
//            } else {
//                myLogView.statusLabelLogin.alpha = 1
//                myLogView.statusLabelLogin.textColor = .red
//                myLogView.statusLabelLogin.text = "Please checked email"
//            }
//        } else {
//            myLogView.statusLabelLogin.alpha = 1
//            myLogView.statusLabelLogin.textColor = .red
//            myLogView.statusLabelLogin.text = "Fill in all the fields"
//        }
    }
}

// MARK: - Extensions UITextFieldDelegate

extension LogInViewVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        switch textField {
        case myLogView.mailTextFieldLogIn: setTextfield(textField: myLogView.mailTextFieldLogIn,
                                                       label: myLogView.statusLabelLogin,
                                                       validType: emailValidType,
                                                       validMessage:
                                                        Text.validMessageMail,
                                                       wrongMessage:
                                                        Text.wrongMessageMail,
                                                       string: string,
                                                       range: range)
        case myLogView.passwordTextFieldLogIn: setTextfield(textField: myLogView.passwordTextFieldLogIn,
                                                           label: myLogView.statusLabelLogin,
                                                           validType: passwordValidType,
                                                           validMessage:
                                                            Text.validMessagePassword,
                                                           wrongMessage:
                                                            Text.wrongMessageP,
                                                           string: string,
                                                           range: range)
        default:
            break
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
        myLogView.mailTextFieldLogIn.resignFirstResponder()
        myLogView.passwordTextFieldLogIn.resignFirstResponder()
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

// MARK: - registerKeyboardNotification

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
        guard let keyboardHeigth = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as?
                                    NSValue)?.cgRectValue else { return }
        myLogView.scrollView.contentOffset = CGPoint(x: 0, y: keyboardHeigth.height / 3 )
    }
    @objc private func keyboardWillHide(notification: Notification) {
        myLogView.scrollView.contentOffset = CGPoint.zero
    }
}
