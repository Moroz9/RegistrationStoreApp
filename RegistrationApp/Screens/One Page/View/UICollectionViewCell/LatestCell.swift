//
//  LatestCell.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 17.04.23.
//

import UIKit

final class LatestCollectionViewCell: UICollectionViewCell {
    private let backgraungImageView: UIImageView = {
    let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let categoryImageView = UIImageView(imageName: "imageCatedory")
    private let categorytLabel = UILabel(text: "Category", textColor: .black,
                                    font: UIFont.systemFont(ofSize: 8), alignment: .left)
    private let nameLabel = UILabel(text: "Name", textColor: .white,
                                    font: UIFont.systemFont(ofSize: 15), alignment: .left)
    private let priceLabel = UILabel(text: "price", textColor: .white,
                                    font: UIFont.systemFont(ofSize: 10), alignment: .left)
    private let upLoadButton = UIButton(imageName: "addProduct")
    override init( frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureCe11(categoryName: String, imageName: String) {
        backgraungImageView.image = UIImage(named: imageName)
        categorytLabel.text =  categoryName
    }
    func setupView() {
       addSubview(backgraungImageView)
        backgraungImageView.backgroundColor = .gray
        backgraungImageView.addSubview(categoryImageView)
        
        categoryImageView.addSubview(categorytLabel)
        backgraungImageView.addSubview(nameLabel)
        
        backgraungImageView.addSubview(priceLabel)
        backgraungImageView.addSubview(upLoadButton)
    }
   private func setConstraints() {
        NSLayoutConstraint.activate([
            backgraungImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgraungImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgraungImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgraungImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            categoryImageView.topAnchor.constraint(equalTo: backgraungImageView.topAnchor, constant: 85),
            categoryImageView.leadingAnchor.constraint(equalTo: backgraungImageView.leadingAnchor, constant: 1),
            categoryImageView.trailingAnchor.constraint(equalTo: backgraungImageView.trailingAnchor, constant: -72),

            categorytLabel.centerXAnchor.constraint(equalTo: categoryImageView.centerXAnchor),
            categorytLabel.centerYAnchor.constraint(equalTo: categoryImageView.centerYAnchor),
    
            nameLabel.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: 1),
            nameLabel.leadingAnchor.constraint(equalTo: backgraungImageView.leadingAnchor, constant: 7),
            nameLabel.trailingAnchor.constraint(equalTo: backgraungImageView.trailingAnchor, constant: -60),

            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 7),
            priceLabel.leadingAnchor.constraint(equalTo: backgraungImageView.leadingAnchor, constant: 7),
           
            upLoadButton.trailingAnchor.constraint(equalTo: backgraungImageView.trailingAnchor, constant: -5),
            upLoadButton.bottomAnchor.constraint(equalTo: backgraungImageView.bottomAnchor, constant: 0)
        ])
    }
}
