//
//  CombiningColorsViewModel.swift
//  CombiningColors
//
//  Created by Khusain on 10.02.2024.
//

import SwiftUI

class CombiningColorsViewModel: ObservableObject {
    @Published var firstColor = Color.blue
    @Published var secondColor = Color.red
    
    @Published var firstColorShow = false
    @Published var secondColorShow = false
    
    @Published var resultColor = Color.purple
    
    @AppStorage("language") var language = LocalizationService.shared.language
    
    func mixColors() {
        let uiFirstColor = UIColor(firstColor)
        let uiSecondColor = UIColor(secondColor)
        
        var (r1, g1, b1, a1) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
        var (r2, g2, b2, a2) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
        
        uiFirstColor.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        uiSecondColor.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        
        resultColor = Color(.init(
            red: (r1 + r2) / 2, 
            green: (g1 + g2) / 2,
            blue: (b1 + b2) / 2,
            alpha: (a1 + a2) / 2)
        )
    }
    
    func closestColorName() -> String {
        let targetUIColor = UIColor(resultColor)
        
        return targetUIColor.accessibilityName
    }
}
