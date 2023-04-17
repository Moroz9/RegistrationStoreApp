//
//  LogInView.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 14.04.23.
//

import UIKit

protocol LogInViewDelegate: AnyObject {
    func logInButtonAuthTapped()
    func logInEyeButtonTapped()
}

class LogInView: UIView {
    
    // MARK: - Var/Let
    
    let contentViewBackLog = UIView(backgroundColorView: Resources.Color.backgroundView)
    let scrollView = UIScrollView(imageName: nil)
    let contentView: UIView = {
        let imageView = UIView()
        imageView.backgroundColor = Resources.Color.backgroundView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let statusLabelLogin = CustomLabel(title: .textCheckEmail, textColorLabel: Resources.Color.backgroundLabel, alphaLabel: 0, fontCastumLabel: .montserrat16())
    let labelLogIn = CustomLabel(title: .welcomeBack, textColorLabel: Resources.Color.backgroundLabel, alphaLabel: 1, fontCastumLabel: .helvetica30())
    lazy var logInButtonAuth = CustomButton(title: .textLogIn, colorTitle: Resources.Color.backgroundButtonText,
    backgroundColorButton: Resources.Color.backgroundButton, configurationImage: "", imageRight: 0, imageLeft: 0)
    let eyeButton = EyeButton()
    let passwordTextFildLogIn = CustomTextField(placeholderTextField: .textPassword)
    let mailTextFildLogIn = CustomTextField(placeholderTextField: .textEmail)
    let collectionViewLogIn = MailCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    lazy var stackViewLogIn = UIStackView(arrangedSubviews: [labelLogIn, statusLabelLogin, mailTextFildLogIn,
                                                             passwordTextFildLogIn, logInButtonAuth,
                                                             collectionViewLogIn ], axis: .vertical, spacing: 20)
    weak var delegate: LogInViewDelegate?
    
    // MARK: - Lifecycle funcs
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupPasswordTF()
        setConstrains()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Flow funcs
     func setupPasswordTF() {
        passwordTextFildLogIn.rightView = eyeButton
        passwordTextFildLogIn.rightViewMode = .always
        passwordTextFildLogIn.isSecureTextEntry = true
    }
    private func setupView() {
        addSubview(contentViewBackLog)
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackViewLogIn)
        logInButtonAuth.addTarget(self, action: #selector(logInButtonAuthTapped), for: .touchUpInside)
        eyeButton.addTarget(self, action: #selector(logInEyeButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Flow funcs(@objc)
    
    @objc func logInButtonAuthTapped() {
        delegate?.logInButtonAuthTapped()
    }
    @objc func logInEyeButtonTapped() {
        delegate?.logInEyeButtonTapped()
    }
}
// MARK: - SetConstrains
extension LogInView {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            contentViewBackLog.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            contentViewBackLog.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            contentViewBackLog.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            contentViewBackLog.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.heightAnchor.constraint(equalTo: heightAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            
            stackViewLogIn.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackViewLogIn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackViewLogIn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 44),
            stackViewLogIn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -44),
            
            mailTextFildLogIn.heightAnchor.constraint(equalToConstant: 29),
            passwordTextFildLogIn.heightAnchor.constraint(equalToConstant: 29),
            
            logInButtonAuth.topAnchor.constraint(equalTo: passwordTextFildLogIn.bottomAnchor, constant: 20),
            logInButtonAuth.heightAnchor.constraint(equalToConstant: 46),
            
            collectionViewLogIn.topAnchor.constraint(equalTo: logInButtonAuth.bottomAnchor, constant: 20),
            collectionViewLogIn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
