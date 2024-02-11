//
//  LocalizationService.swift
//  CombiningColors
//
//  Created by Khusain on 09.02.2024.
//

import Foundation

enum Language: String, CaseIterable {
    case ru = "ru"
    case en = "en"
}

class LocalizationService {
    
    static let shared = LocalizationService()
    static let changedLanguage = Notification.Name("changedLanguage")
    
    private init() {}
    
    var language: Language {
        get {
            guard let languageString = UserDefaults.standard.string(forKey: "language") else {
                return .en
            }
            return Language(rawValue: languageString) ?? .en
        } set {
            if newValue != language {
                UserDefaults.standard.setValue(newValue.rawValue, forKey: "language")
                NotificationCenter.default.post(name: LocalizationService.changedLanguage, object: nil)
            }
        }
    }
}
