//
//  FlashSalesCell.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 17.04.23.
//

import UIKit

final class FlashSalesCollectionViewCell: UICollectionViewCell {
    
    private let backgroundFlashSalesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let categorySaleImageView = UIImageView(imageName: "imageCategorySale")
    private let profileSaleImageView = UIImageView(imageName: "imageProfile")
    private let salesImageView = UIImageView(imageName: "imageSales")
    
    private let categoryFlashSaleLabel = UILabel(textColor: .black,
                                                font: UIFont.systemFont(ofSize: 8), alignment: .left)
    private let nameFlashSaleLabel = UILabel(textColor: .white,
                                            font: UIFont.systemFont(ofSize: 25, weight: .bold), alignment: .center)
    private let priceFlashSaleLabel = UILabel(textColor: .white,
                                             font: UIFont.systemFont(ofSize: 10), alignment: .left)
    private let discountLabel = UILabel(textColor: .white,
                                     font: UIFont.systemFont(ofSize: 8), alignment: .center)
    private let addButton = UIButton(imageName: "addProductSale")
    private let likeButton = UIButton(imageName: "likeproduct")
    
    override init( frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(category: String, name: String, price: Double, discount: Double, imageUrl: String) {
        backgroundFlashSalesImageView.loadFrom(URLAddress: imageUrl)
        categoryFlashSaleLabel.text =  category
        nameFlashSaleLabel.text = name
        priceFlashSaleLabel.text = "$\(price)"
        discountLabel.text = "\(discount)% off"
    }
    
    private func setupView() {
        addSubview(backgroundFlashSalesImageView)
        backgroundFlashSalesImageView.backgroundColor = .placeholderText
        backgroundFlashSalesImageView.addSubview(categorySaleImageView)
        categorySaleImageView.addSubview(categoryFlashSaleLabel)
        backgroundFlashSalesImageView.addSubview(nameFlashSaleLabel)
        backgroundFlashSalesImageView.addSubview(priceFlashSaleLabel)
        backgroundFlashSalesImageView.addSubview(addButton)
        backgroundFlashSalesImageView.addSubview(likeButton)
        backgroundFlashSalesImageView.addSubview(profileSaleImageView)
        backgroundFlashSalesImageView.addSubview(salesImageView)
        salesImageView.addSubview(discountLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundFlashSalesImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundFlashSalesImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundFlashSalesImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundFlashSalesImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            categorySaleImageView.leadingAnchor.constraint(equalTo: backgroundFlashSalesImageView.leadingAnchor, constant: 10),
            categoryFlashSaleLabel.bottomAnchor.constraint(equalTo: backgroundFlashSalesImageView.bottomAnchor, constant: -83),
            categoryFlashSaleLabel.centerXAnchor.constraint(equalTo: categorySaleImageView.centerXAnchor),
            categoryFlashSaleLabel.centerYAnchor.constraint(equalTo: categorySaleImageView.centerYAnchor),
            
            nameFlashSaleLabel.leadingAnchor.constraint(equalTo: backgroundFlashSalesImageView.leadingAnchor, constant: 10),
            nameFlashSaleLabel.bottomAnchor.constraint(equalTo: backgroundFlashSalesImageView.bottomAnchor, constant: -42),
            nameFlashSaleLabel.widthAnchor.constraint(equalToConstant: 82),
            
            priceFlashSaleLabel.leadingAnchor.constraint(equalTo: backgroundFlashSalesImageView.leadingAnchor, constant: 10),
            priceFlashSaleLabel.bottomAnchor.constraint(equalTo: backgroundFlashSalesImageView.bottomAnchor, constant: -17),
            
            addButton.trailingAnchor.constraint(equalTo: backgroundFlashSalesImageView.trailingAnchor, constant: -5),
            addButton.bottomAnchor.constraint(equalTo: backgroundFlashSalesImageView.bottomAnchor, constant: -5),
            
            likeButton.trailingAnchor.constraint(equalTo: backgroundFlashSalesImageView.trailingAnchor, constant: -45),
            likeButton.bottomAnchor.constraint(equalTo: backgroundFlashSalesImageView.bottomAnchor, constant: -5),
            
            profileSaleImageView.topAnchor.constraint(equalTo: backgroundFlashSalesImageView.topAnchor, constant: 7),
            profileSaleImageView.leadingAnchor.constraint(equalTo: backgroundFlashSalesImageView.leadingAnchor, constant: 7),
            
            salesImageView.topAnchor.constraint(equalTo: backgroundFlashSalesImageView.topAnchor, constant: 7),
            salesImageView.trailingAnchor.constraint(equalTo: backgroundFlashSalesImageView.trailingAnchor, constant: -7),
            
            discountLabel.centerXAnchor.constraint(equalTo: salesImageView.centerXAnchor),
            discountLabel.centerYAnchor.constraint(equalTo: salesImageView.centerYAnchor)
        ])
    }
}
