//
//  ControlVisibilityToggleView.swift
//  RealityHD
//
//  Created by hunter downey on 4/23/23.
//

import SwiftUI

struct ControlVisibilityToggleView: View {
    @Binding var isControlVisible: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            Button { withAnimation(.easeInOut) { isControlVisible.toggle() } } label: {
                Image(systemName: isControlVisible ? "rectangle" : "slider.horizontal.below.rectangle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color("mainColor"))
                    .frame(width: 35, height: 35)
                    .padding(15)
                    .background(.thinMaterial)
                    .cornerRadius(15)
            }
        }
        .animation(.easeInOut, value: isControlVisible)
        .padding(.vertical, 50)
        .padding(.horizontal)
    }
}
