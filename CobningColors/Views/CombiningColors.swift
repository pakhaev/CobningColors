//
//  ContentView.swift
//  CombiningColors
//
//  Created by Khusain on 09.02.2024.
//

import SwiftUI

struct ColorName {
    var color: UIColor
    var name: String
}

struct CombiningColors: View {
    @ObservedObject var vm = CombiningColorsViewModel()
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Text("app_title".localized(vm.language).capitalized)
                    .font(.largeTitle)
                    .animation(.default, value: vm.language)
                Spacer()
                
                ColorsVStackView()
                    .environmentObject(vm)
                
                Spacer()
                
                HStack {
                    Picker("Select color", selection: $vm.language) {
                        ForEach(Language.allCases, id: \.self) { lang in
                            Text(lang.rawValue.capitalized)
                                .tag(lang)
                        }
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 80)
                    .padding()
                    
                    Spacer()
                }
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    CombiningColors()
}
