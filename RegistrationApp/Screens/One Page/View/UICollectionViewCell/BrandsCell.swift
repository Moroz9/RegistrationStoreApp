//
//  BrandsCell.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 17.04.23.
//

import UIKit

final class BrandsCollectionViewCell: UICollectionViewCell {
    
    private let backgroundBrandsImageView: UIImageView = {
    let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let categoryBrandImageView = UIImageView(imageName: "imageCategorSale")
    private let profileBrandImageView = UIImageView(imageName: "imageProfile")
    private let brandImageView = UIImageView(imageName: "imageSales")
    private let categoryBrandsLabel = UILabel(textColor: .black,
                                      font: UIFont.systemFont(ofSize: 8), alignment: .left)
    private let nameBrandsLabel = UILabel(textColor: .white,
                                      font: UIFont.systemFont(ofSize: 28, weight: .bold), alignment: .center)
    private let priceBrandsLabel = UILabel(textColor: .white,
                                      font: UIFont.systemFont(ofSize: 10), alignment: .left)
    private let discountBrandsLabel = UILabel(textColor: .white,
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
    
    func configureCell(category: String, name: String, price: Double, discount: Int, imageUrl: String) {
        backgroundBrandsImageView.loadFrom(URLAddress: imageUrl)
        categoryBrandsLabel.text =  category
        nameBrandsLabel.text = name
        priceBrandsLabel.text = String(price)
        discountBrandsLabel.text = String(discount)
    }
    
   private func setupView() {
       addSubview(backgroundBrandsImageView)
       backgroundBrandsImageView.backgroundColor = .placeholderText
       backgroundBrandsImageView.addSubview(categoryBrandImageView)
       categoryBrandImageView.addSubview(categoryBrandsLabel)
       backgroundBrandsImageView.addSubview(nameBrandsLabel)
       backgroundBrandsImageView.addSubview(priceBrandsLabel)
       backgroundBrandsImageView.addSubview(addBrandsButton)
       backgroundBrandsImageView.addSubview(likeBrandsButton)
       backgroundBrandsImageView.addSubview(profileBrandImageView)
       backgroundBrandsImageView.addSubview(brandImageView)
       brandImageView.addSubview(discountBrandsLabel)
    }
   private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundBrandsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundBrandsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundBrandsImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundBrandsImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            categoryBrandImageView.leadingAnchor.constraint(equalTo: backgroundBrandsImageView.leadingAnchor, constant: 10),
            categoryBrandImageView.bottomAnchor.constraint(equalTo: backgroundBrandsImageView.bottomAnchor, constant: -83),
            categoryBrandsLabel.centerXAnchor.constraint(equalTo: categoryBrandImageView.centerXAnchor),
            categoryBrandsLabel.centerYAnchor.constraint(equalTo: categoryBrandImageView.centerYAnchor),
            
            nameBrandsLabel.leadingAnchor.constraint(equalTo: backgroundBrandsImageView.leadingAnchor, constant: 10),
            nameBrandsLabel.bottomAnchor.constraint(equalTo: backgroundBrandsImageView.bottomAnchor, constant: -42),
            nameBrandsLabel.widthAnchor.constraint(equalToConstant: 82),

            priceBrandsLabel.leadingAnchor.constraint(equalTo: backgroundBrandsImageView.leadingAnchor, constant: 10),
            priceBrandsLabel.bottomAnchor.constraint(equalTo: backgroundBrandsImageView.bottomAnchor, constant: -17),
            
            addBrandsButton.trailingAnchor.constraint(equalTo: backgroundBrandsImageView.trailingAnchor, constant: -5),
            addBrandsButton.bottomAnchor.constraint(equalTo: backgroundBrandsImageView.bottomAnchor, constant: -5),

            likeBrandsButton.trailingAnchor.constraint(equalTo: backgroundBrandsImageView.trailingAnchor, constant: -45),
            likeBrandsButton.bottomAnchor.constraint(equalTo: backgroundBrandsImageView.bottomAnchor, constant: -5),

            profileBrandImageView.topAnchor.constraint(equalTo: backgroundBrandsImageView.topAnchor, constant: 7),
            profileBrandImageView.leadingAnchor.constraint(equalTo: backgroundBrandsImageView.leadingAnchor, constant: 7),

            brandImageView.topAnchor.constraint(equalTo: backgroundBrandsImageView.topAnchor, constant: 7),
            brandImageView.trailingAnchor.constraint(equalTo: backgroundBrandsImageView.trailingAnchor, constant: -7),

            discountBrandsLabel.centerXAnchor.constraint(equalTo: brandImageView.centerXAnchor),
            discountBrandsLabel.centerYAnchor.constraint(equalTo: brandImageView.centerYAnchor)
        ])
    }
}
