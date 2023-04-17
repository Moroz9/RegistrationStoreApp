//
//  FastSalesCell.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 17.04.23.
//

import UIKit

final class FastSaleCollectionViewCell: UICollectionViewCell {
    private let backgraundFastSaleImageView: UIImageView = {
    let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let categorySaleImageView = UIImageView(imageName: "imageCategorSale")
    private let profileSaleImageView = UIImageView(imageName: "imageProfile")
    private let salesImageView = UIImageView(imageName: "imageSales")
    private let categoryFastSaleLabel = UILabel(text: "Category", textColor: .black,
                                     font: UIFont.systemFont(ofSize: 8), alignment: .left)
    private let nameFastSaleLabel = UILabel(text: "Nev Balsnce sneacers", textColor: .white,
                                     font: UIFont.systemFont(ofSize: 28, weight: .bold), alignment: .center)
    private let priceFastSaleLabel = UILabel(text: "$33,00", textColor: .white,
                                     font: UIFont.systemFont(ofSize: 10), alignment: .left)
    private let labelSales = UILabel(text: "Sales 30%", textColor: .white,
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
    func configureCe11(categoryName: String, imageName: String) {
        backgraundFastSaleImageView.image = UIImage(named: imageName)
        categoryFastSaleLabel.text =  categoryName
    }
   private func setupView() {
       addSubview(backgraundFastSaleImageView)
       backgraundFastSaleImageView.backgroundColor = .gray
       backgraundFastSaleImageView.addSubview(categorySaleImageView)
       categorySaleImageView.addSubview(categoryFastSaleLabel)
       backgraundFastSaleImageView.addSubview(nameFastSaleLabel)
       backgraundFastSaleImageView.addSubview(priceFastSaleLabel)
       backgraundFastSaleImageView.addSubview(addButton)
       backgraundFastSaleImageView.addSubview(likeButton)
       backgraundFastSaleImageView.addSubview(profileSaleImageView)
       backgraundFastSaleImageView.addSubview(salesImageView)
       salesImageView.addSubview(labelSales)
    }
   private func setConstraints() {
        NSLayoutConstraint.activate([
            backgraundFastSaleImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgraundFastSaleImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgraundFastSaleImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgraundFastSaleImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            categorySaleImageView.topAnchor.constraint(equalTo: backgraundFastSaleImageView.topAnchor, constant: 110),
            categorySaleImageView.leadingAnchor.constraint(equalTo: backgraundFastSaleImageView.leadingAnchor, constant: 10),
            categorySaleImageView.trailingAnchor.constraint(equalTo: backgraundFastSaleImageView.trailingAnchor, constant: -114),
            
            categoryFastSaleLabel.centerXAnchor.constraint(equalTo: categorySaleImageView.centerXAnchor),
            categoryFastSaleLabel.centerYAnchor.constraint(equalTo: categorySaleImageView.centerYAnchor),

            nameFastSaleLabel.topAnchor.constraint(equalTo: categorySaleImageView.bottomAnchor, constant: 10),
            nameFastSaleLabel.leadingAnchor.constraint(equalTo: backgraundFastSaleImageView.leadingAnchor, constant: 10),
            nameFastSaleLabel.trailingAnchor.constraint(equalTo: backgraundFastSaleImageView.trailingAnchor, constant: -80),
            nameFastSaleLabel.heightAnchor.constraint(equalToConstant: 30),

            priceFastSaleLabel.topAnchor.constraint(equalTo: nameFastSaleLabel.bottomAnchor, constant: 20),
            priceFastSaleLabel.leadingAnchor.constraint(equalTo: backgraundFastSaleImageView.leadingAnchor, constant: 10),
            
            addButton.trailingAnchor.constraint(equalTo: backgraundFastSaleImageView.trailingAnchor, constant: -5),
            addButton.bottomAnchor.constraint(equalTo: backgraundFastSaleImageView.bottomAnchor, constant: -5),

            likeButton.trailingAnchor.constraint(equalTo: backgraundFastSaleImageView.trailingAnchor, constant: -45),
            likeButton.bottomAnchor.constraint(equalTo: backgraundFastSaleImageView.bottomAnchor, constant: -5),

            profileSaleImageView.topAnchor.constraint(equalTo: backgraundFastSaleImageView.topAnchor, constant: 5),
            profileSaleImageView.leadingAnchor.constraint(equalTo: backgraundFastSaleImageView.leadingAnchor, constant: 5),

            salesImageView.topAnchor.constraint(equalTo: backgraundFastSaleImageView.topAnchor, constant: 5),
            salesImageView.trailingAnchor.constraint(equalTo: backgraundFastSaleImageView.trailingAnchor, constant: -5),

            labelSales.centerXAnchor.constraint(equalTo: salesImageView.centerXAnchor),
            labelSales.centerYAnchor.constraint(equalTo: salesImageView.centerYAnchor)
        ])
    }
}
