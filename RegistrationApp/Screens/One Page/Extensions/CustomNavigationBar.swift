//
//  CustomNavigationBar.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 17.04.23.
//

import UIKit

extension UIViewController {
    
    func createCustomNavigationBarPageOne() {
        navigationController?.navigationBar.barTintColor = Color.backgroundView
    }
    
    func createCustomTitleViewPageOne(contactName: NSAttributedString, contactDescription: String, contactImage: String)
    -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 180, height: 50)
        let imageContact = UIImageView()
        imageContact.image = UIImage(named: contactImage)
        imageContact.layer.cornerRadius = imageContact.frame.height / 2
        imageContact.frame = CGRect(x: 200, y: 0, width: 40, height: 40)
        view.addSubview(imageContact)
        
        let nameLabel = UILabel()
        nameLabel.attributedText = contactName
        nameLabel.frame = CGRect(x: 25, y: 10, width: 150, height: 25)
        nameLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        view.addSubview(nameLabel)
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = contactDescription
        descriptionLabel.frame = CGRect(x: 195, y: 42, width: 50, height: 20)
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.textColor = #colorLiteral(red: 0.3568627451, green: 0.3568627451, blue: 0.3568627451, alpha: 0.85)
        view.addSubview(descriptionLabel)
        
        return view
    }
    
    func createCustomButtonPageOne(imageName: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(
            UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate),
            for: .normal )
        button.tintColor = .black
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: button)
        return menuBarItem
    }
    
    func updateAttributesText() -> NSAttributedString {
        let stingOne = Text.tradeBy
        let attributesOne = [
            NSAttributedString.Key.foregroundColor: Color.colotTextBlack
        ]
        let stingTwo = Text.textBata
        let attributesTwo = [
            NSAttributedString.Key.foregroundColor: Color.colotCustomTextBlue
        ]
        let attributesStingOne = NSMutableAttributedString(string: stingOne, attributes: attributesOne)
        let attributesStingTwo = NSAttributedString(string: stingTwo, attributes: attributesTwo)
        attributesStingOne.append(attributesStingTwo)
        
        return attributesStingOne
    }
}
