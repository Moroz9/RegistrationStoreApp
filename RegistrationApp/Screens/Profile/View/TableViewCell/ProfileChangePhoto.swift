//
//  ProfileChangePhotoViewCell.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 14.04.23.
//

import UIKit

final class ProfileChangePhotoViewCell: UITableViewCell {
    
     var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let storage: UserDefaultsManagerProtocol = UserDefaultsManager()
    private var labelChangeNameText = UILabel(text: "", textColor: .black,
                    font: UIFont.systemFont(ofSize: 8), alignment: .left)
    private var labelNameText = UILabel(text: "", textColor: .black,
                    font: UIFont.systemFont(ofSize: 20, weight: .bold), alignment: .center)
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setLogInConstrains()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setLogInConstrains() {
        addSubview(photoImageView)
        addSubview(labelChangeNameText)
        addSubview(labelNameText)
        NSLayoutConstraint.activate([
            photoImageView.heightAnchor.constraint(equalToConstant: 60),
            photoImageView.widthAnchor.constraint(equalToConstant: 60),
            photoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            photoImageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
       
            labelChangeNameText.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 5),
            labelChangeNameText.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            labelNameText.topAnchor.constraint(equalTo: labelChangeNameText.bottomAnchor, constant: 20),
            labelNameText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            labelNameText.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            labelNameText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 112),
            labelNameText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -112)
        ])
    }
    func setData(_ user: PersonsModel ) {
        guard let data = storage.date(forKey: .imagePhoto) else { return }
        guard let decoded = try? PropertyListDecoder().decode(Data.self, from: data) else { return }
             let image = UIImage(data: decoded)
        
        photoImageView.image = image ?? UIImage(named: "ImagePhoto")
        labelChangeNameText.text = user.changeName
        labelNameText.text = (storage.string(forkey: .firstName) ?? " Dosn't found Name") + " " + ( storage.string(forkey: .lastName) ?? " Dosn't found Name")
    }
}
