//
//  ARModel.swift
//  RealityHD
//
//  Created by hunter downey on 4/23/23.
//

import SwiftUI
import RealityKit
import Combine

enum ModelCategory: CaseIterable {
    case element, nothinglol
    
    var label: String {
        get {
            switch self {
            case .element:
                return "Element"
            case .nothinglol:
                return "Nothing lol"
            }
        }
    }
}

class ARModel {
    
    var name: String
    var category: ModelCategory
    var thumbnail: Image
    var modelEntity: ModelEntity?
    var scaleCompensation: Float
    
    private var cancellable: AnyCancellable?
    
    init(name: String, category: ModelCategory, scaleCompensation: Float = 1.0) {
        self.name = name
        self.category = category
        self.thumbnail = Image(name)
        self.scaleCompensation = scaleCompensation
    }
    
    func loadModelEntity() {
        let fileName = self.name + ".usdz"
        
        self.cancellable = ModelEntity.loadModelAsync(named: fileName)
            .sink(receiveCompletion: { loadCompletion in
                switch loadCompletion {
                case .failure(let error):
                    print("Unable to load entity for \(fileName). Error: \(error.localizedDescription)")
                case .finished:
                    break
                }
                
            }, receiveValue: { modelEntity in
                self.modelEntity = modelEntity
                self.modelEntity?.scale *= self.scaleCompensation
            })
    }
    
}

struct Models {
    var arModels: [ARModel] = []
    
    init() {
        // Element Models
        let hydrogen = ARModel(name: "element_001_hydrogen", category: .element, scaleCompensation: 37 / 100)
        let helium = ARModel(name: "element_001_helium", category: .element, scaleCompensation: 37 / 100)
        self.arModels += [hydrogen, helium]
    }
    
    func get(category: ModelCategory) -> [ARModel] {
        return arModels.filter( { $0.category == category } )
    }
}
