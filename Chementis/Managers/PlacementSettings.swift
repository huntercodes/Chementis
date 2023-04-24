//
//  PlacementSettings.swift
//  Chementis
//
//  Created by hunter downey on 4/23/23.
//

import SwiftUI
import RealityKit
import Combine

final class PlacementSettings: ObservableObject {
    @Published var selectedModel: ARModel? {
        willSet(newValue) {
            print("Setting selectedModel to \(String(describing: newValue?.name))")
        }
    }
    
    @Published var confirmedModel: ARModel? {
        willSet {
            guard let model = newValue else {
                print("Clearing confirmedModel")
                
                return
            }
            
            print("Setting confirmedModel to \(model.name)")
            
            recentlyPlaced.append(model)
        }
    }
    
    @Published var recentlyPlaced: [ARModel] = []
    
    @Published var textEntity: Entity?
    
    var sceneObserver: Cancellable?
}
