//
//  AuthenticationView.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 08.04.23.
//

import UIKit

protocol AuthenticationViewDelegate: AnyObject {
    func signInButtonAuthTapped()
    func logInButtonAuthTapped()
    func googleButtonTapped()
    func appleButtonTapped()
}

final class AuthenticationView: UIView {
    
    // MARK: - Var/Let
    
    let contentViewBack = UIView(backgroundColorView: Color.backgroundView)
    let contentView: UIView = {
        let imageView = UIView()
        imageView.backgroundColor = Color.backgroundView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let scrollView = UIScrollView(imageName: nil)
    let statusLabel = CustomLabel(title: Text.textCheckEmail, textColorLabel: Color.backgroundLabel, alphaLabel: 0, fontCustomLabel: .montserrat16())
    let labelSignIn = CustomLabel(title: Text.textSignIn, textColorLabel: Color.backgroundLabel, alphaLabel: 1, fontCustomLabel: .helvetica30())
    lazy var signInButtonAuth = CustomButton(title: Text.textSignIn, colorTitle: Color.backgroundButtonText,
        backgroundColorButton: Color.backgroundButton, configurationImage: "", imageRight: 0, imageLeft: 0)
    lazy var logInButtonAuth = CustomButton(title: Text.textAlreadyHaveAnAccount, colorTitle: .black, backgroundColorButton: .clear, configurationImage: "", imageRight: 0, imageLeft: 0)
    lazy var googleButtonAuth = CustomButton(title: Text.textSignInWithGoogle,
                                colorTitle: .black, backgroundColorButton: .clear, configurationImage:
                                                Text.imageGoogle, imageRight: 10, imageLeft: 0)
    lazy var appleButtonAuth = CustomButton(title: Text.textSignInWithApple,
                                colorTitle: .black, backgroundColorButton: .clear, configurationImage:
                                                Text.imageApple, imageRight: 20, imageLeft: 0)
    let firstNameTextField = CustomTextField(placeholderTextField: Text.textFirstName)
    let lastNameTextField = CustomTextField(placeholderTextField: Text.textLastName)
    let passwordTextField = CustomTextField(placeholderTextField: Text.textPassword)
    let mailTextField = CustomTextField(placeholderTextField: Text.textEmail)
    let collectionView = MailCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    lazy var stackView = UIStackView(arrangedSubviews: [labelSignIn, statusLabel,
                                                        firstNameTextField, lastNameTextField, passwordTextField,
                                                        mailTextField, signInButtonAuth, logInButtonAuth,
                                                        collectionView, googleButtonAuth, appleButtonAuth ],
                                     axis: .vertical, spacing: 20)
    weak var delegate: AuthenticationViewDelegate?
    
    // MARK: - Lifecycle func
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstrains()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Flow func
    
    private func setupView() {
        addSubview(contentViewBack)
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        signInButtonAuth.addTarget(self, action: #selector(signInButtonAuthTapped), for: .touchUpInside)
        logInButtonAuth.addTarget(self, action: #selector(logInButtonAuthTapped), for: .touchUpInside)
        googleButtonAuth.addTarget(self, action: #selector(googleButtonAuthTapped), for: .touchUpInside)
        appleButtonAuth.addTarget(self, action: #selector(appleButtonAuthTapped), for: .touchUpInside)
    }
    
    // MARK: - Flow func(@objc)
    
    @objc func signInButtonAuthTapped() {
        delegate?.signInButtonAuthTapped()
    }
    @objc func logInButtonAuthTapped() {
        delegate?.logInButtonAuthTapped()
    }
    @objc func googleButtonAuthTapped() {
        delegate?.googleButtonTapped()
    }
    @objc func appleButtonAuthTapped() {
        delegate?.appleButtonTapped()
    }
}
// MARK: - setConstrains
extension AuthenticationView {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            contentViewBack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            contentViewBack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            contentViewBack.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            contentViewBack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            contentView.heightAnchor.constraint(equalTo: heightAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 44),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -44),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            firstNameTextField.heightAnchor.constraint(equalToConstant: 29),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 29),
            passwordTextField.heightAnchor.constraint(equalToConstant: 29),
            mailTextField.heightAnchor.constraint(equalToConstant: 29),
            
            signInButtonAuth.topAnchor.constraint(equalTo: mailTextField.bottomAnchor, constant: 20),
            signInButtonAuth.heightAnchor.constraint(equalToConstant: 46),
            
            collectionView.heightAnchor.constraint(equalToConstant: 50),
            
            googleButtonAuth.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            googleButtonAuth.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            googleButtonAuth.bottomAnchor.constraint(equalTo: appleButtonAuth.topAnchor, constant: -40),
            appleButtonAuth.centerXAnchor.constraint(equalTo: stackView.centerXAnchor)
        ])
    }
}
