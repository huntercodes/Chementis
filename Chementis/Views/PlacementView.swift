//
//  PlacementView.swift
//  RealityHD
//
//  Created by hunter downey on 4/23/23.
//

import SwiftUI

struct PlacementView: View {
    @EnvironmentObject var placementSettings: PlacementSettings
    @EnvironmentObject var arHelper: ARHelper
    
    @ObservedObject var vm = ARViewModel()
    
    var body: some View {
        HStack {
            Spacer()
            
            PlacementButton(systemIconName: "xmark.circle") {
                placementSettings.selectedModel = nil
            }
            
            Spacer()
            
            PlacementButton(systemIconName: "checkmark.circle") {
                placementSettings.confirmedModel = placementSettings.selectedModel
                placementSettings.selectedModel = nil
                
                if let elementName = placementSettings.confirmedModel?.getElementName(),
                   let elementData = vm.getElementData(byName: elementName) {
                    print(elementData)
                } else {
                    print("Element not found")
                }
            }
            
            Spacer()
            
        }
        .padding(30)
    }
}

struct PlacementButton: View {
    let systemIconName: String
    let action: () -> Void
    
    var body: some View {
        Button { withAnimation(.easeInOut) { action() } } label: {
            Image(systemName: systemIconName)
                .resizable()
                .scaledToFit()
                .foregroundColor(Color("mainColor"))
                .frame(width: 50, height: 50)
            
        }
        .frame(width: 75, height: 75)
    }
}
