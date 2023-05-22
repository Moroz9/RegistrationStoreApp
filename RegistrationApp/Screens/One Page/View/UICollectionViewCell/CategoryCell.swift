//
//  CategoryCell.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 17.04.23.
//

import UIKit

final class CategoryCollectionViewCell: UICollectionViewCell {
    
    private let categoryBackgroundView: UIImageView = {
        let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.image = UIImage(named: Text.categoryBurger)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
    
    private let categoryImageView: UIImageView = {
    let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: Text.categoryBurger)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
    let label = UILabel()
    label.text = Text.category
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 10)
//    label.textColor = .gray
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
        addSubview(categoryBackgroundView)
        categoryBackgroundView.addSubview(categoryImageView)
        categoryBackgroundView.addSubview(categoryLabel)
        categoryBackgroundView.backgroundColor = .placeholderText
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            categoryBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            categoryBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            categoryBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            categoryBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            categoryImageView.topAnchor.constraint(equalTo: categoryBackgroundView.topAnchor, constant: 0),
            categoryImageView.leadingAnchor.constraint(equalTo: categoryBackgroundView.leadingAnchor, constant: 5),
            categoryImageView.trailingAnchor.constraint(equalTo: categoryBackgroundView.trailingAnchor, constant: -5),
            categoryImageView.bottomAnchor.constraint(equalTo: categoryBackgroundView.bottomAnchor, constant: -20),
            
            categoryLabel.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: 0),
            categoryLabel.bottomAnchor.constraint(equalTo: categoryBackgroundView.bottomAnchor, constant: 0),
            categoryLabel.centerXAnchor.constraint(equalTo: categoryBackgroundView.centerXAnchor)
            
        ])
    }
}
