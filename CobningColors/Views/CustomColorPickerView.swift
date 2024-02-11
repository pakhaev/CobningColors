//
//  CustomColorPickerView.swift
//  CombiningColors
//
//  Created by Khusain on 09.02.2024.
//

import SwiftUI

struct CustomColorPickerView: View {
    @AppStorage("language") private var language = LocalizationService.shared.language
    
    @Environment(\.dismiss) var dismiss
    @Binding var selectedColor: Color
    
    private let rows = 2
    private let columns = 2
    
    private let colors: [Color] = [
        .red,
        .brown,
        .orange,
        .green,
        .yellow,
        .mint,
        .blue,
        .purple,
        .black,
        .white
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Text("select_color".localized(language))
                    .foregroundStyle(.white)
                    .font(.title)
                
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], content: {
                    ForEach(colors, id: \.self) { color in
                        Button {
                            selectedColor = color
                            dismiss()
                        } label: {
                            VStack {
                                Rectangle()
                                    .frame(width: 50, height: 50)
                                Text(color.description.localized(language))
                                    .font(.footnote)
                                
                                if color == selectedColor {
                                    Circle()
                                        .frame(width: 5, height: 5)
                                        .foregroundColor(color)
                                }
                            }
                            .frame(width: 80)
                            .foregroundStyle(color)
                            .padding()
                            .background(.thinMaterial)
                            .clipShape(.rect(cornerRadius: 10))
                        }
                    }
                })
            }
        }
    }
}

#Preview {
    CustomColorPickerView(selectedColor: .constant(.blue))
}
