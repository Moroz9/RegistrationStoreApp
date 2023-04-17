//
//  BrendsCell.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 17.04.23.
//

import UIKit

final class BrendsCollectionViewCell: UICollectionViewCell {
    private let backgraundBrandsImageView: UIImageView = {
    let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let categoryBrandImageView = UIImageView(imageName: "imageCategorSale")
    private let profileBrandImageView = UIImageView(imageName: "imageProfile")
    private let brandImageView = UIImageView(imageName: "imageSales")
    private let categoryBrandsLabel = UILabel(text: "Category", textColor: .black,
                                      font: UIFont.systemFont(ofSize: 8), alignment: .left)
    private let nameBrandsLabel = UILabel(text: "Nev Balsnce sneacers", textColor: .white,
                                      font: UIFont.systemFont(ofSize: 28, weight: .bold), alignment: .center)
    private let priceBrandsLabel = UILabel(text: "$33,00", textColor: .white,
                                      font: UIFont.systemFont(ofSize: 10), alignment: .left)
    private let labelBrands = UILabel(text: "Sales 30%", textColor: .white,
                                      font: UIFont.systemFont(ofSize: 8), alignment: .center)
    private let addBrandsButton = UIButton(imageName: "addProductSale")
    private let likeBrandsButton = UIButton(imageName: "likeproduct")
    override init( frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureCe11(categoryName: String, imageName: String) {
        backgraundBrandsImageView.image = UIImage(named: imageName)
        categoryBrandsLabel.text =  categoryName
    }
   private func setupView() {
       addSubview(backgraundBrandsImageView)
       backgraundBrandsImageView.backgroundColor = .gray
       backgraundBrandsImageView.addSubview(categoryBrandImageView)
       categoryBrandImageView.addSubview(categoryBrandsLabel)
       backgraundBrandsImageView.addSubview(nameBrandsLabel)
       backgraundBrandsImageView.addSubview(priceBrandsLabel)
       backgraundBrandsImageView.addSubview(addBrandsButton)
       backgraundBrandsImageView.addSubview(likeBrandsButton)
       backgraundBrandsImageView.addSubview(profileBrandImageView)
       backgraundBrandsImageView.addSubview(brandImageView)
       brandImageView.addSubview(labelBrands)
    }
   private func setConstraints() {
        NSLayoutConstraint.activate([
            backgraundBrandsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgraundBrandsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgraundBrandsImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgraundBrandsImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            categoryBrandImageView.topAnchor.constraint(equalTo: backgraundBrandsImageView.topAnchor, constant: 110),
            categoryBrandImageView.leadingAnchor.constraint(equalTo: backgraundBrandsImageView.leadingAnchor, constant: 10),
            categoryBrandImageView.trailingAnchor.constraint(equalTo: backgraundBrandsImageView.trailingAnchor, constant: -114),
            
            categoryBrandsLabel.centerXAnchor.constraint(equalTo: categoryBrandImageView.centerXAnchor),
            categoryBrandsLabel.centerYAnchor.constraint(equalTo: categoryBrandImageView.centerYAnchor),

            nameBrandsLabel.topAnchor.constraint(equalTo: categoryBrandImageView.bottomAnchor, constant: 10),
            nameBrandsLabel.leadingAnchor.constraint(equalTo: backgraundBrandsImageView.leadingAnchor, constant: 10),
            nameBrandsLabel.trailingAnchor.constraint(equalTo: backgraundBrandsImageView.trailingAnchor, constant: -80),
            nameBrandsLabel.heightAnchor.constraint(equalToConstant: 30),

            priceBrandsLabel.topAnchor.constraint(equalTo: nameBrandsLabel.bottomAnchor, constant: 20),
            priceBrandsLabel.leadingAnchor.constraint(equalTo: backgraundBrandsImageView.leadingAnchor, constant: 10),
            
            addBrandsButton.trailingAnchor.constraint(equalTo: backgraundBrandsImageView.trailingAnchor, constant: -5),
            addBrandsButton.bottomAnchor.constraint(equalTo: backgraundBrandsImageView.bottomAnchor, constant: -5),

            likeBrandsButton.trailingAnchor.constraint(equalTo: backgraundBrandsImageView.trailingAnchor, constant: -45),
            likeBrandsButton.bottomAnchor.constraint(equalTo: backgraundBrandsImageView.bottomAnchor, constant: -5),

            profileBrandImageView.topAnchor.constraint(equalTo: backgraundBrandsImageView.topAnchor, constant: 5),
            profileBrandImageView.leadingAnchor.constraint(equalTo: backgraundBrandsImageView.leadingAnchor, constant: 5),

            brandImageView.topAnchor.constraint(equalTo: backgraundBrandsImageView.topAnchor, constant: 5),
            brandImageView.trailingAnchor.constraint(equalTo: backgraundBrandsImageView.trailingAnchor, constant: -5),

            labelBrands.centerXAnchor.constraint(equalTo: brandImageView.centerXAnchor),
            labelBrands.centerYAnchor.constraint(equalTo: brandImageView.centerYAnchor)
        ])
    }
}
