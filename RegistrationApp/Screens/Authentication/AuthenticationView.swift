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
    
    let contentViewBack = UIView(backgroundColorView: Resources.Color.backgroundView)
    let contentView: UIView = {
        let imageView = UIView()
        imageView.backgroundColor = Resources.Color.backgroundView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let scrollView = UIScrollView(imageName: nil)
    let statusLabel = CustomLabel(title: .textCheckEmail, textColorLabel: Resources.Color.backgroundLabel, alphaLabel: 0, fontCastumLabel: .montserrat16())
    let labelSignIn = CustomLabel(title: .textSignIn, textColorLabel: Resources.Color.backgroundLabel, alphaLabel: 1, fontCastumLabel: .helvetica30())
    lazy var signInButtonAuth = CustomButton(title: .textSignIn, colorTitle: Resources.Color.backgroundButtonText,
        backgroundColorButton: Resources.Color.backgroundButton, configurationImage: "", imageRight: 0, imageLeft: 0)
    lazy var logInButtonAuth = CustomButton(title: .textAlradyHaveAnAccoutn, colorTitle: .black, backgroundColorButton: .clear, configurationImage: "", imageRight: 0, imageLeft: 0)
    lazy var googleButtonAuth = CustomButton(title: .textSignInWithGoogle, colorTitle: .black, backgroundColorButton: .clear, configurationImage: "ImageGoogle", imageRight: 10, imageLeft: 0)
    lazy var appleButtonAuth = CustomButton(title: .textSignInWithApple, colorTitle: .black, backgroundColorButton: .clear, configurationImage: "ImageApple", imageRight: 20, imageLeft: 0)
    let firstNameTextFild = CustomTextField(placeholderTextField: .textFirstName)
    let lastNameTextFild = CustomTextField(placeholderTextField: .textLastName)
    let passwordTextFild = CustomTextField(placeholderTextField: .textPassword)
    let mailTextFild = CustomTextField(placeholderTextField: .textEmail)
    let collectionView = MailCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    lazy var stackView = UIStackView(arrangedSubviews: [labelSignIn, statusLabel,
                                                        firstNameTextFild, lastNameTextFild, passwordTextFild,
                                                        mailTextFild, signInButtonAuth, logInButtonAuth,
                                                        collectionView, googleButtonAuth, appleButtonAuth ],
                                     axis: .vertical, spacing: 20)
    weak var delegate: AuthenticationViewDelegate?
    
    // MARK: - Lifecycle funcs
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstrains()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Flow funcs
    
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
    
    // MARK: - Flow funcs(@objc)
    
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
            
            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.heightAnchor.constraint(equalTo: heightAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 44),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -44),
            
            firstNameTextFild.heightAnchor.constraint(equalToConstant: 29),
            lastNameTextFild.heightAnchor.constraint(equalToConstant: 29),
            passwordTextFild.heightAnchor.constraint(equalToConstant: 29),
            mailTextFild.heightAnchor.constraint(equalToConstant: 29),
            
            signInButtonAuth.topAnchor.constraint(equalTo: mailTextFild.bottomAnchor, constant: 20),
            signInButtonAuth.heightAnchor.constraint(equalToConstant: 46),
            
            collectionView.heightAnchor.constraint(equalToConstant: 50),
            
            googleButtonAuth.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            googleButtonAuth.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            googleButtonAuth.bottomAnchor.constraint(equalTo: appleButtonAuth.topAnchor, constant: -40),
            appleButtonAuth.centerXAnchor.constraint(equalTo: stackView.centerXAnchor)
        ])
    }
}
