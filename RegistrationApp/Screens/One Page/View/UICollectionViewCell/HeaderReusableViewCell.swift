//
//  HeaderReusableViewCell.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 17.04.23.
//

import UIKit

final class CollectionViewHeaderReusableView: UICollectionReusableView {
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = Text.category
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16 )
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let headerLabelViewVill: UILabel = {
        let label = UILabel()
        label.text = Text.viewAll
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 12 )
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerLabel)
        addSubview(headerLabelViewVill)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHeader(categoryName: String) {
        headerLabel.text = categoryName
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            headerLabelViewVill.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerLabelViewVill.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
