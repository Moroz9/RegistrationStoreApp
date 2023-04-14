//
//  UserDefaultsManager.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 08.04.23.
//

import Foundation
// MARK: - CRUD
protocol UserDefaultsManagerProtocol {
    func set(_ object: Any?, forkey key: UserDefaultsManager.SettingsKyes)
    func set<T: Encodable> (object: T?, forKey key: UserDefaultsManager.SettingsKyes)
    func int(forKey key: UserDefaultsManager.SettingsKyes) -> Int?
    func string(forkey key: UserDefaultsManager.SettingsKyes) -> String?
    func dict(forKey key: UserDefaultsManager.SettingsKyes) -> [String: Any]?
    func date(forKey key: UserDefaultsManager.SettingsKyes) -> Date?
    func bool(forKey key: UserDefaultsManager.SettingsKyes) -> Bool?
    func codableData<T: Decodable> (forKey key: UserDefaultsManager.SettingsKyes) -> T?
}
final class UserDefaultsManager {
    private let userDefaults = UserDefaults.standard
    
   public enum SettingsKyes: String {
        case firstName
        case lastName
        case email
        case password
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
    func set(_ object: Any?, forkey key: SettingsKyes) {
        store(object, key: key.rawValue)
    }
    func set<T: Encodable>(object: T?, forKey key: SettingsKyes) {
        let jsonData = try? JSONEncoder().encode(object)
        store(object, key: key.rawValue)
    }
    func int(forKey key: SettingsKyes) -> Int? {
        restore(forKey: key.rawValue) as? Int
    }
    func string(forkey key: SettingsKyes) -> String? {
        restore(forKey: key.rawValue) as? String
    }
    func dict(forKey key: SettingsKyes) -> [String: Any]? {
        restore(forKey: key.rawValue) as? [String: Any]
    }
    func date(forKey key: SettingsKyes) -> Date? {
        restore(forKey: key.rawValue) as? Date
    }
    func bool(forKey key: SettingsKyes) -> Bool? {
        restore(forKey: key.rawValue) as? Bool
    }
    func codableData<T: Decodable>(forKey key: SettingsKyes) -> T? {
        guard let data = restore(forKey: key.rawValue) as? Data else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }
    func remove(forKey key: SettingsKyes) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
}
