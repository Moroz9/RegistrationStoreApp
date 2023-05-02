//
//  LatestCell.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 17.04.23.
//

import UIKit

final class LatestCollectionViewCell: UICollectionViewCell {
    
    private let backgroundImageView: UIImageView = {
    let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let categoryImageView = UIImageView(imageName: "imageCatedory")
    private let categoryLabel = UILabel(textColor: .black,
                                    font: UIFont.systemFont(ofSize: 8), alignment: .left)
     let nameLabel = UILabel(textColor: .white,
                                    font: UIFont.systemFont(ofSize: 15), alignment: .left)
    private let priceLabel = UILabel(textColor: .white,
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
    
    func configureCell(category: String, name: String, price: Double, imageUrl: String) {
        backgroundImageView.loadFrom(URLAddress: imageUrl)
        categoryLabel.text =  category
        nameLabel.text = String(name)
        priceLabel.text = "$\(price)"
    }
    
    func setupView() {
        addSubview(backgroundImageView)
        backgroundImageView.addSubview(categoryImageView)
        categoryImageView.addSubview(categoryLabel)
        backgroundImageView.addSubview(nameLabel)
        backgroundImageView.addSubview(priceLabel)
        backgroundImageView.addSubview(upLoadButton)
        backgroundImageView.backgroundColor = .placeholderText
    }
    
   private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        
            categoryImageView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 5),
            categoryLabel.centerXAnchor.constraint(equalTo: categoryImageView.centerXAnchor),
            categoryLabel.centerYAnchor.constraint(equalTo: categoryImageView.centerYAnchor),
    
            nameLabel.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 7),
            nameLabel.widthAnchor.constraint(equalToConstant: 56),

            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 17),
            priceLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 7),
            priceLabel.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -7),
           
            upLoadButton.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -5),
            upLoadButton.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -5)
        ])
    }
}
