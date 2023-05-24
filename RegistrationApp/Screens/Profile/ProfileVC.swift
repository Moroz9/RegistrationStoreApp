//
//  ProfileVC.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 14.04.23.
//

import UIKit

final class ProfileVC: UIViewController {
    // MARK: - Properties
    private let contentViewBack: UIView = {
        let view = UIView()
        view.backgroundColor = Color.backgroundView
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var dataSource = [Section]()
    private var profilePersons = PersonsModel.exampleList
    private var profileUpLoadItemButtonModel = UpLoadItemButtonModel.exampleList
    private var profileButtonSettings = ProfileButtonSettingsModel.exampleList
    
    private let storage: UserDefaultsManagerProtocol = UserDefaultsManager()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        createCustomNavigationBar()
        setData()
        dataSource = createDataSource()
    }
    
    // MARK: - Setup
    
    private func setupViews() {
        view.addSubview(contentViewBack)
        view.addSubview(tableView)
        
        let customTitleView = createCustomTitleView(contactName: Text.textProfile)
        navigationItem.titleView = customTitleView
        
        tableView.register(ProfileChangePhotoViewCell.self, forCellReuseIdentifier: CellIdentifier.idProfileChangePhotoCell)
        tableView.register(ButtonUpLoadTableViewCell.self, forCellReuseIdentifier: CellIdentifier.idProfileButtonCell)
        tableView.register(ProfileButtonSettingsViewCell.self, forCellReuseIdentifier: CellIdentifier.idProfileButtonSettingsCell)
        
        NSLayoutConstraint.activate([
            contentViewBack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentViewBack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentViewBack.topAnchor.constraint(equalTo: view.topAnchor),
            contentViewBack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setData() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    // MARK: - Helper Methods
    
    private func showPicker() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    private func createDataSource() -> [Section] {
        var sections = [Section]()
        sections.append(Section.idProfileChangePhotoCell(items: profilePersons))
        sections.append(Section.idProfileButtonCell(items: profileUpLoadItemButtonModel))
        sections.append(Section.idProfileButtonSettingsCell(items: profileButtonSettings))
        return sections
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSection = dataSource[section]
        switch currentSection {
        case .idProfileChangePhotoCell(let items):
            return items.count
        case .idProfileButtonCell(let items):
            return items.count
        case .idProfileButtonSettingsCell(let items):
            return items.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentSection = dataSource[indexPath.section]
        
        switch currentSection {
        case .idProfileChangePhotoCell(let items):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.idProfileChangePhotoCell, for: indexPath) as? ProfileChangePhotoViewCell else {
                return UITableViewCell()
            }
            let item = items[indexPath.row]
            cell.setData(item)
            return cell
            
        case .idProfileButtonCell(let items):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.idProfileButtonCell, for: indexPath) as? ButtonUpLoadTableViewCell else {
                return UITableViewCell()
            }
            let item = items[indexPath.row]
            return cell
            
        case .idProfileButtonSettingsCell(let items):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.idProfileButtonSettingsCell, for: indexPath) as? ProfileButtonSettingsViewCell else {
                return UITableViewCell()
            }
            let item = items[indexPath.row]
            cell.setData(item)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        switch indexPath {
        case [0, 0]:
            showPicker()
        case [1, 0]:
            print("at", [indexPath.section], [indexPath.row])
        case [2, 0]:
            print("at", [indexPath.section], [indexPath.row])
        case [2, 1]:
            print("at", [indexPath.section], [indexPath.row])
        case [2, 2]:
            print("at", [indexPath.section], [indexPath.row])
        case [2, 3]:
            print("at", [indexPath.section], [indexPath.row])
        case [2, 4]:
            print("at", [indexPath.section], [indexPath.row])
        case [2, 5]:
            print("at", [indexPath.section], [indexPath.row])
        case [2, 6]:
            let controller = AuthenticationVC()
            let navController = UINavigationController(rootViewController: controller)
            navController.modalPresentationStyle = .fullScreen
            present(navController, animated: true)
        default:
            print("Error")
        }
    }
}

// MARK: - UIImagePickerControllerDelegate

extension ProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        var chosenImage = UIImage()
        
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            chosenImage = image
        } else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            chosenImage = image
        }
        
        guard let data = chosenImage.jpegData(compressionQuality: 0.5) else {
            picker.dismiss(animated: true, completion: nil)
            return
        }
        
        let encoded = try? PropertyListEncoder().encode(data)
        storage.set(encoded, forKey: .imagePhoto)
        
        picker.dismiss(animated: true) {
            self.tableView.reloadData()
        }
    }
}
