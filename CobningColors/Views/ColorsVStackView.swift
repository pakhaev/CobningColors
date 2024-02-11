//
//  ColorsVStackView.swift
//  CombiningColors
//
//  Created by Khusain on 10.02.2024.
//

import SwiftUI

struct ColorsVStackView: View {
    @EnvironmentObject var vm: CombiningColorsViewModel
    
    var body: some View {
        VStack {
            ColorTappedView(color: $vm.firstColor, show: $vm.firstColorShow)
                .animation(.easeIn(duration: 0.3), value: vm.firstColor)
                .sheet(isPresented: $vm.firstColorShow, content: {
                    CustomColorPickerView(selectedColor: $vm.firstColor)
                })
                .onChange(of: vm.firstColor) {
                    vm.mixColors()
                }
            
            
            Text("+")
                .font(.title)
                .padding()
            
            ColorTappedView(color: $vm.secondColor, show: $vm.secondColorShow)
                .animation(.easeIn(duration: 0.3), value: vm.secondColor)
                .sheet(isPresented: $vm.secondColorShow, content: {
                    CustomColorPickerView(selectedColor: $vm.secondColor)
                })
                .onChange(of: vm.secondColor) {
                    vm.mixColors()
                }
            
            Text("=")
                .font(.title)
                .padding()
            
            VStack {
                Text(vm.closestColorName().localized(vm.language).capitalized)
                    .animation(.default, value: vm.language)
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(vm.resultColor)
                    .clipShape(.rect(cornerRadius: 20))
                    .animation(.spring, value: vm.resultColor)
            }
            .padding(10)
            .background(.thinMaterial)
            .clipShape(.rect(cornerRadius: 20))
            .animation(.default, value: vm.language)
        }
    }
}

#Preview {
    ColorsVStackView()
        .environmentObject(CombiningColorsViewModel())
}
