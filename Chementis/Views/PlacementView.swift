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
    
    var body: some View {
        HStack {
            Spacer()
            
            PlacementButton(systemIconName: "xmark.circle") {
                placementSettings.selectedModel = nil
            }
            
            Spacer()
            
            PlacementButton(systemIconName: "checkmark.circle") {
                if let elementName = placementSettings.selectedModel!.getElementName() {
                    ChemistryAPI.fetchElementData(elementName: elementName) { result in
                        DispatchQueue.main.async {
                            switch result {
                            case .success(let element):
                                let infoText = """
                                Atomic Number: \(element.atomicNumber ?? 0)
                                Atomic Mass: \(element.atomicMass ?? 0)
                                Electron Configuration: \(element.electronConfiguration ?? "")
                                Density: \(element.density ?? 0)
                                Melting Point: \(element.meltingPoint ?? 0)
                                Boiling Point: \(element.boilingPoint ?? 0)
                                """
                                
                                let textEntity = arHelper.createTextEntity(text: infoText)
                                placementSettings.textEntity = textEntity
                                
                            case .failure(let error):
                                print("Failed to fetch element data: \(error.localizedDescription)")
                            }
                        }
                    }
                }
                
                placementSettings.confirmedModel = placementSettings.selectedModel
                placementSettings.selectedModel = nil
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
