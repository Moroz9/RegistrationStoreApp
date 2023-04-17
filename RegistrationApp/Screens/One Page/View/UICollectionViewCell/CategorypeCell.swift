//
//  CategorypeCell.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 17.04.23.
//

import UIKit

final class CategorypeCollectionViewCell: UICollectionViewCell {
    private let categoryImageView: UIImageView = {
    let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: Resources.TextNamed.categoryBurger)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let categoryLabel: UILabel = {
    let label = UILabel()
    label.text = Resources.TextNamed.category
    label.textAlignment = .left
    label.font = UIFont.systemFont(ofSize: 10)
    label.textColor = .gray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
   }()
    override init( frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureCell(categoryName: String, imageName: String) {
        categoryImageView.image = UIImage(named: imageName)
        categoryLabel.text = categoryName
        categoryImageView.layer.cornerRadius = categoryImageView.frame.height / 2
    }
    func setupView() {
        addSubview(categoryImageView)
        categoryImageView.backgroundColor = .gray
        addSubview(categoryLabel)
    }
    func setConstraints() {
        NSLayoutConstraint.activate([
            categoryImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            categoryImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            categoryImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
           
            categoryLabel.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: 10),
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5),
            categoryLabel.heightAnchor.constraint(equalToConstant: 20),
            categoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
