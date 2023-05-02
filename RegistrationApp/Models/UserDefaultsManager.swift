//
//  UserDefaultsManager.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 08.04.23.
//

import Foundation
// MARK: - CRUD
protocol UserDefaultsManagerProtocol {
    func set(_ object: Any?, forKey key: UserDefaultsManager.SettingsKeys)
    func set<T: Encodable> (object: T?, forKey key: UserDefaultsManager.SettingsKeys)
    func int(forKey key: UserDefaultsManager.SettingsKeys) -> Int?
    func string(forKey key: UserDefaultsManager.SettingsKeys) -> String?
    func dict(forKey key: UserDefaultsManager.SettingsKeys) -> [String: Any]?
    func date(forKey key: UserDefaultsManager.SettingsKeys) -> Data?
    func bool(forKey key: UserDefaultsManager.SettingsKeys) -> Bool?
    func codableData<T: Decodable> (forKey key: UserDefaultsManager.SettingsKeys) -> T?
}
final class UserDefaultsManager {
    private let userDefaults = UserDefaults.standard
    
   public enum SettingsKeys: String {
        case firstName
        case lastName
        case email
        case password
        case imagePhoto
    }
    private func store(_ object: Any?, key: String) {
        userDefaults.set(object, forKey: key)
    }
    private func restore(forKey key: String) -> Any? {
        userDefaults.object(forKey: key)
    }
}
// MARK: - UserDefaultsManagerProtocol

extension UserDefaultsManager: UserDefaultsManagerProtocol {
    func set(_ object: Any?, forKey key: SettingsKeys) {
        store(object, key: key.rawValue)
    }
    func set<T: Encodable>(object: T?, forKey key: SettingsKeys) {
        let jsonData = try? JSONEncoder().encode(object)
        store(object, key: key.rawValue)
    }
    func int(forKey key: SettingsKeys) -> Int? {
        restore(forKey: key.rawValue) as? Int
    }
    func string(forKey key: SettingsKeys) -> String? {
        restore(forKey: key.rawValue) as? String
    }
    func dict(forKey key: SettingsKeys) -> [String: Any]? {
        restore(forKey: key.rawValue) as? [String: Any]
    }
    func date(forKey key: SettingsKeys) -> Data? {
        restore(forKey: key.rawValue) as? Data
    }
    func bool(forKey key: SettingsKeys) -> Bool? {
        restore(forKey: key.rawValue) as? Bool
    }
    func codableData<T: Decodable>(forKey key: SettingsKeys) -> T? {
        guard let data = restore(forKey: key.rawValue) as? Data else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }
    func remove(forKey key: SettingsKeys) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
}
