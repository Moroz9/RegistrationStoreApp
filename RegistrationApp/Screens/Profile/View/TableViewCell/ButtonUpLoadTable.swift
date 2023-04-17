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
        button.backgroundColor = Resources.Color.backgroundButton
        button.setTitle("Upload item", for: .normal)
        button.setTitleColor(Resources.Color.backgroundButtonText, for: .normal)
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .montserrat30()
        button.setImage(UIImage(named: "ImageButton"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -40, bottom: 0, right: 0)
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
