//
//  MailCollectionViewCell.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 08.04.23.
//

import UIKit

final class MailCollectionViewCell: UICollectionViewCell {
    
    private let domainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.alpha = 0.5
        contentView.layer.cornerRadius = 10
        addSubview(domainLabel)
    }
    
    private func configure(mailLabelText: String) {
        domainLabel.text = mailLabelText
    }
    
    func cellConfigure(mailLabelText: String) {
        configure(mailLabelText: mailLabelText)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            domainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            domainLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
