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
    
    let contentViewBackLog = UIView(backgroundColorView: Color.backgroundView)
    let scrollView = UIScrollView(imageName: nil)
    let contentView: UIView = {
        let imageView = UIView()
        imageView.backgroundColor = Color.backgroundView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let statusLabelLogin = CustomLabel(title: Text.textCheckEmail, textColorLabel: Color.backgroundLabel, alphaLabel: 0, fontCustomLabel: .montserrat16())
    let labelLogIn = CustomLabel(title: Text.welcomeBack, textColorLabel: Color.backgroundLabel, alphaLabel: 1, fontCustomLabel: .helvetica30())
    lazy var logInButtonAuth = CustomButton(title: Text.textLogIn, colorTitle: Color.backgroundButtonText,
    backgroundColorButton: Color.backgroundButton, configurationImage: "", imageRight: 0, imageLeft: 0)
    let eyeButton = EyeButton()
    
    let passwordTextFieldLogIn = CustomTextField(placeholderTextField: Text.textPassword)
    let mailTextFieldLogIn = CustomTextField(placeholderTextField: Text.textEmail)
    let collectionViewLogIn = MailCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    lazy var stackViewLogIn = UIStackView(arrangedSubviews: [labelLogIn, statusLabelLogin, mailTextFieldLogIn,
                                                             passwordTextFieldLogIn, logInButtonAuth,
                                                             collectionViewLogIn ], axis: .vertical, spacing: 20)
    weak var delegate: LogInViewDelegate?
    
    // MARK: - Lifecycle func
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupPasswordTF()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Flow func
    
     func setupPasswordTF() {
        passwordTextFieldLogIn.rightView = eyeButton
        passwordTextFieldLogIn.rightViewMode = .always
        passwordTextFieldLogIn.isSecureTextEntry = true
    }
    
    private func setupView() {
        addSubview(contentViewBackLog)
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackViewLogIn)
        logInButtonAuth.addTarget(self, action: #selector(logInButtonAuthTapped), for: .touchUpInside)
        eyeButton.addTarget(self, action: #selector(logInEyeButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Flow func(@objc)
    
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
            
            contentView.heightAnchor.constraint(equalTo: heightAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            
            stackViewLogIn.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackViewLogIn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackViewLogIn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 44),
            stackViewLogIn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -44),
            
            mailTextFieldLogIn.heightAnchor.constraint(equalToConstant: 29),
            passwordTextFieldLogIn.heightAnchor.constraint(equalToConstant: 29),
            
            logInButtonAuth.topAnchor.constraint(equalTo: passwordTextFieldLogIn.bottomAnchor, constant: 20),
            logInButtonAuth.heightAnchor.constraint(equalToConstant: 46),
            
            collectionViewLogIn.topAnchor.constraint(equalTo: logInButtonAuth.bottomAnchor, constant: 20),
            collectionViewLogIn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
