//
//  SettingsToggleButton.swift
//  RealityHD
//
//  Created by hunter downey on 4/23/23.
//

import SwiftUI

struct SettingsToggleButton: View {
    @Binding var isOn: Bool
    let settings: SettingsModel
    
    var body: some View {
        Button { withAnimation(.easeInOut) { isOn.toggle() }  } label: {
            VStack {
                Image(systemName: settings.systemIconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(isOn ? Color("mainColor") : .secondary)
                
                Text(settings.label)
                    .font(.footnote)
                    .foregroundColor(isOn ? Color("mainColor") : .secondary)
                    .padding(.top, 5)
            }
        }
        .padding()
        .background(.thinMaterial)
        .cornerRadius(15)
    }
}
