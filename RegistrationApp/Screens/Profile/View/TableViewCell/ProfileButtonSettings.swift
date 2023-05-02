//
//  ProfileButtonSettingsViewCell.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 14.04.23.
//

import UIKit

final class ProfileButtonSettingsViewCell: UITableViewCell {
    
    private var leftIconName = UIImageView(imageName: "")
    private var primaryText = UILabel(textColor: .black,
                font: UIFont.systemFont(ofSize: 20), alignment: .left)
    private var secondaryText = UILabel(textColor: .black,
                font: UIFont.systemFont(ofSize: 25), alignment: .center)
    private var profileArrow = UIImageView(imageName: Text.arrow)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupView()
        setLogInConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(leftIconName)
        addSubview(primaryText)
        addSubview(profileArrow)
        addSubview(secondaryText)
    }
    
    private func setLogInConstrains() {
        NSLayoutConstraint.activate([
            leftIconName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            leftIconName.heightAnchor.constraint(equalToConstant: 40),
            leftIconName.widthAnchor.constraint(equalToConstant: 40),
            leftIconName.topAnchor.constraint(equalTo: topAnchor, constant: 11.5),
            leftIconName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -11.5),
            leftIconName.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            primaryText.leadingAnchor.constraint(equalTo: leftIconName.trailingAnchor, constant: 10),
            primaryText.trailingAnchor.constraint(equalTo: profileArrow.trailingAnchor, constant: -100),
            primaryText.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            
            profileArrow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
            profileArrow.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            profileArrow.heightAnchor.constraint(equalToConstant: 15),
            profileArrow.widthAnchor.constraint(equalToConstant: 8),
            
            secondaryText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
            secondaryText.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            secondaryText.heightAnchor.constraint(equalToConstant: 20),
            secondaryText.widthAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func setData(_ user: ProfileButtonSettingsModel ) {
        leftIconName.image = UIImage(named: user.leftIconName)
        primaryText.text = user.primaryText
        secondaryText.text = user.secondaryText
        profileArrow.isHidden = user.withArrow || user.secondaryText != nil
    }
}
