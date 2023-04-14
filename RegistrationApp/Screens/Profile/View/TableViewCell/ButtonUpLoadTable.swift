//
//  ButtonUpLoadTableViewCell.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 14.04.23.
//

import UIKit

final class ButtonUpLoadTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setLogInConstrains()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private let upLoadButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.3333333333, blue: 0.8431372549, alpha: 1)
        button.setTitle("Upload item", for: .normal)
        let color = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
        button.setTitleColor(color, for: .normal)
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "Montserrat", size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private func setLogInConstrains() {
        addSubview(upLoadButton)
        NSLayoutConstraint.activate([
            upLoadButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 42),
            upLoadButton.heightAnchor.constraint(equalToConstant: 40),
            upLoadButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            upLoadButton.widthAnchor.constraint(equalToConstant: 290),
            upLoadButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            upLoadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3)
        ])
    }
}
