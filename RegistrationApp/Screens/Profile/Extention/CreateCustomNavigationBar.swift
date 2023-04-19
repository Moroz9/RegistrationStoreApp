//
//  CreateCustomNavigationBar.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 14.04.23.
//

import UIKit

extension UIViewController {
    func createCustomNavigationBar() {
        navigationController?.navigationBar.barTintColor = .clear
    }
    func createCustomTitleView(contactName: String)
    -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 180, height: 50)
        let imageContact = UIImageView()
        imageContact.layer.cornerRadius = imageContact.frame.height / 2
        imageContact.frame = CGRect(x: 200, y: 0, width: 40, height: 40)
        view.addSubview(imageContact)
        
        let nameLabel = UILabel()
        nameLabel.text = contactName
        nameLabel.frame = CGRect(x: 55, y: 10, width: 150, height: 20)
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.addSubview(nameLabel)
        
        return view
    }
    func createCustomButton (imageName: String, selector: Selector) -> UIBarButtonItem {
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
}
