//
//  ProfileChangePhotoViewCell.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 14.04.23.
//

import UIKit

final class ProfileChangePhotoViewCell: UITableViewCell {
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let storage: UserDefaultsManagerProtocol = UserDefaultsManager()
    private let labelChangeNameText = UILabel(textColor: .black, font: .systemFont(ofSize: 8), alignment: .left)
    private let labelNameText = UILabel(textColor: .black, font: .boldSystemFont(ofSize: 20), alignment: .center)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        addSubview(photoImageView)
        addSubview(labelChangeNameText)
        addSubview(labelNameText)
        
        NSLayoutConstraint.activate([
            photoImageView.heightAnchor.constraint(equalToConstant: 80),
            photoImageView.widthAnchor.constraint(equalToConstant: 80),
            photoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            photoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            labelChangeNameText.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 5),
            labelChangeNameText.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            labelNameText.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 35),
            labelNameText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            labelNameText.heightAnchor.constraint(equalToConstant: 30),
            labelNameText.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            labelNameText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 112)
        ])
    }
    
    func setData(_ user: PersonsModel ) {
        guard let data = storage.date(forKey: .imagePhoto) else { return }
        guard let decoded = try? PropertyListDecoder().decode(Data.self, from: data) else { return }
        let image = UIImage(data: decoded)
        
        photoImageView.image = image
        let firstName = storage.string(forKey: .firstName) ?? "Didn't find Name"
        let lastName = storage.string(forKey: .lastName) ?? "Didn't find Last Name"
        labelChangeNameText.text = user.changeName
        labelNameText.text = "\(firstName) \(lastName)"
    }
}
