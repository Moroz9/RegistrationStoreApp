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
    private let nameLabel = UILabel(text: "Name product nice ", textColor: .white,
                                    font: UIFont.systemFont(ofSize: 15), alignment: .left)
    private let priceLabel = UILabel(text: "price", textColor: .white,
                                    font: UIFont.systemFont(ofSize: 10), alignment: .left)
    private let upLoadButton = UIButton(imageName: "addProduct")
    var categoryLatest = [LatestElement]()
    override init( frame: CGRect) {
        super.init(frame: frame)
        setupView()
        fetchCategoryLatest()
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
        backgraungImageView.addSubview(categoryImageView)
        categoryImageView.addSubview(categorytLabel)
        backgraungImageView.addSubview(nameLabel)
        backgraungImageView.addSubview(priceLabel)
        backgraungImageView.addSubview(upLoadButton)
        backgraungImageView.backgroundColor = .placeholderText
    }
    func setCellWithValuesOf(_ latest: LatestElement) {
        updateUI(name: latest.name, category: latest.category, price: latest.price, image_url: latest.image_url)
    }
    
    private func fetchCategoryLatest() {
        let urlString = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
        
        NetworkDataFetch.shared.fetchCategoryModel(urlString: urlString) { [weak self] latestModel, error in
            if error == nil {
                guard let categoryModel = latestModel else { return }
                self?.categoryLatest = categoryModel.latest
            } else {
                print("error")
           }
        }
    }
    //   swiftlint:disable all
    private func updateUI(name: String, category: String, price: Double, image_url: String) {
        
        self.nameLabel.text = name
        self.categorytLabel.text = category
        self.priceLabel.text = String(price)
        
        guard let posterImageURL = URL(string: image_url) else {
            self.backgraungImageView.image = UIImage(named: "noImageAvailable")
            return
        }
        
        // Before we download the image we clear out the old one
        self.backgraungImageView.image = nil
        
        getImageDataFrom(url: posterImageURL)
        
    }
    //   swiftlint:disable all
    private func getImageDataFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle Error
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.backgraungImageView.image = image
                }
            }
        }.resume()
    }
   private func setConstraints() {
        NSLayoutConstraint.activate([
            backgraungImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgraungImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgraungImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgraungImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        
            categoryImageView.leadingAnchor.constraint(equalTo: backgraungImageView.leadingAnchor, constant: 5),
            categorytLabel.centerXAnchor.constraint(equalTo: categoryImageView.centerXAnchor),
            categorytLabel.centerYAnchor.constraint(equalTo: categoryImageView.centerYAnchor),
    
            nameLabel.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: backgraungImageView.leadingAnchor, constant: 7),
            nameLabel.widthAnchor.constraint(equalToConstant: 56),

            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 17),
            priceLabel.leadingAnchor.constraint(equalTo: backgraungImageView.leadingAnchor, constant: 7),
            priceLabel.bottomAnchor.constraint(equalTo: backgraungImageView.bottomAnchor, constant: -7),
           
            upLoadButton.trailingAnchor.constraint(equalTo: backgraungImageView.trailingAnchor, constant: -5),
            upLoadButton.bottomAnchor.constraint(equalTo: backgraungImageView.bottomAnchor, constant: -5)
        ])
    }
}
