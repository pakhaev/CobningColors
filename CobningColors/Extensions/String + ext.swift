//
//  String + ext.swift
//  CombiningColors
//
//  Created by Khusain on 09.02.2024.
//

import SwiftUI

extension String {
    func localized(_ language: Language) -> String {
        let path = Bundle.main.path(forResource: language.rawValue, ofType: "lproj")
        let bundle: Bundle
        
        if let path = path {
            bundle = Bundle(path: path) ?? .main
        } else {
            bundle = .main
        }
        
        return localized(bundle: bundle)
    }
    
    func localized(_ language: Language, args arguments: CVarArg...) -> String {
        let path = Bundle.main.path(forResource: language.rawValue, ofType: "lproj")
        let bundle: Bundle
        if let path = path {
            bundle = Bundle(path: path) ?? .main
        } else {
            bundle = .main
        }
        return String(format: localized(bundle: bundle), arguments: arguments)
    }
    
    private func localized(bundle: Bundle) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}

extension View {
    var currentLanguage: Binding<Language> {
        .init(
            get: {
                LocalizationService.shared.language
            },
            set: {
                LocalizationService.shared.language = $0
            }
        )
    }
}
