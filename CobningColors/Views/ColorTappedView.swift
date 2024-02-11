//
//  ColorTappedView.swift
//  CombiningColors
//
//  Created by Khusain on 09.02.2024.
//

import SwiftUI

struct ColorTappedView: View {
    @AppStorage("language") private var language = LocalizationService.shared.language
    
    @Binding var color: Color
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            Text(color.description.localized(language).capitalized)
                .animation(.default, value: language)
            Button {
                show.toggle()
            } label: {
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(color)
                    .clipShape(.rect(cornerRadius: 20))
            }
        }
        .padding(10)
        .background(.thinMaterial)
        .clipShape(.rect(cornerRadius: 20))   
    }
}

#Preview {
    ColorTappedView(color: .constant(.blue), show: .constant(true))
}
