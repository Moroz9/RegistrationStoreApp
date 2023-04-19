//
//  ProfileVC.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 14.04.23.
//

import UIKit

final class ProfileVC: UIViewController {
    // MARK: - Let \ Var
    let contentViewBack: UIView = {
        let imageView = UIView()
        imageView.backgroundColor = Resources.Color.backgroundView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let storage: UserDefaultsManagerProtocol = UserDefaultsManager()
    private var dataSource = [Section]()
    private var profilePersons = PersonsModel.exampleList
    private var profileUpLoadItemButtonModel = UpLoadItemButtonModel.exampleList
    private var profileButtonSettings = ProfileButtonSettingsModel.exampleList
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
        
    }()
    // MARK: - Lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setProfileButtonSettingsConstrains()
        createCustomNavigationBar()
        setData()
        dataSource = createDataSource()
    }
    // MARK: - Flow funcs
    private func setupViews() {
        view.addSubview(contentViewBack)
        view.addSubview(tableView)
        let castomTitleView = createCustomTitleView(contactName: Resources.TextNamed.textProfile )
        navigationItem.titleView = castomTitleView
        
    tableView.register(ProfileChangePhotoViewCell.self, forCellReuseIdentifier: CellIdentifier.idProfileChangePhotoCell)
    tableView.register(ButtonUpLoadTableViewCell.self, forCellReuseIdentifier:
        CellIdentifier.idProfileButtonCell)
    tableView.register(ProfileButtonSettingsViewCell.self, forCellReuseIdentifier: CellIdentifier.idProfileButtonSettingsCell)
    }
    private func setData() {
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    func showPicker() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
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
        
        guard let data = chosenImage.jpegData(compressionQuality: 0.5) else { return }
            let encoded = try? PropertyListEncoder().encode(data)
            storage.set(encoded, forkey: .imagePhoto)
        
        picker.dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
// MARK: - ProfileVC

private extension ProfileVC {
    func createDataSource() -> [Section] {
        var sections = [Section]()
        sections.append(Section.idProfileChangePhotoCell(items: profilePersons))
        sections.append(Section.idProfileButtonCell(items: profileUpLoadItemButtonModel))
        sections.append(Section.idProfileButtonSettingsCell(items: profileButtonSettings))
        return sections
    }
}
// MARK: - UITableViewDelegate

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        dataSource.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch dataSource[section] {
        case .idProfileChangePhotoCell(let items): return items.count
        case .idProfileButtonCell(let items): return items.count
        case .idProfileButtonSettingsCell(let items): return items.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = dataSource[indexPath.section]
        switch section {
        case .idProfileChangePhotoCell(let items):
            let cell = tableView.dequeueReusableCell(
                withIdentifier: CellIdentifier.idProfileChangePhotoCell,
                for: indexPath
            ) as? ProfileChangePhotoViewCell
            let item = items[indexPath.row]
            cell?.setData(item)
            return cell ?? UITableViewCell()
            
        case .idProfileButtonCell(items: let items):
            let cell = tableView.dequeueReusableCell(
                withIdentifier: CellIdentifier.idProfileButtonCell,
                for: indexPath
            ) as? ButtonUpLoadTableViewCell
            _ = items[indexPath.row]
            return cell ?? UITableViewCell()
            
        case .idProfileButtonSettingsCell(items: let items):
            let cell = tableView.dequeueReusableCell(
                withIdentifier: CellIdentifier.idProfileButtonSettingsCell,
                for: indexPath
            ) as? ProfileButtonSettingsViewCell
            let item = items[indexPath.row]
            cell?.setData(item)
            return cell ?? UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        switch indexPath {
        case [0, 0]:
            showPicker()
        case [1, 0]:
            print("at ", [indexPath.section], [indexPath.row])
        case [2, 0]:
            print("at ", [indexPath.section], [indexPath.row])
        case [2, 1]:
            print("at ", [indexPath.section], [indexPath.row])
        case [2, 2]:
            print("at ", [indexPath.section], [indexPath.row])
        case [2, 3]:
            print("at ", [indexPath.section], [indexPath.row])
        case [2, 4]:
            print("at ", [indexPath.section], [indexPath.row])
        case [2, 5]:
            print("at ", [indexPath.section], [indexPath.row])
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
// MARK: - ProfileVC

extension ProfileVC {
    private func setProfileButtonSettingsConstrains() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            contentViewBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            contentViewBack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            contentViewBack.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            contentViewBack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}
