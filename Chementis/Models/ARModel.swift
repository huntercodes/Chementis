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
    var chemicalSymbol: String
    
    private var cancellable: AnyCancellable?
    
    init(name: String, category: ModelCategory, chemicalSymbol: String, scaleCompensation: Float = 1.0) {
        self.name = name
        self.category = category
        self.chemicalSymbol = chemicalSymbol
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
    
    func getElementName() -> String? {
        if category == .element {
            let parts = name.split(separator: "_")
            if parts.count >= 3 {
                return String(parts[2]).capitalizingFirstLetter()
            }
        }
        return nil
    }
    
}

struct Models {
    var arModels: [ARModel] = []
    
    init() {
        // Element Models -- NEED TO ADD ALL 118
        let hydrogen = ARModel(name: "element_001_hydrogen", category: .element, chemicalSymbol: "H", scaleCompensation: 67 / 100)
        let helium = ARModel(name: "element_002_helium", category: .element, chemicalSymbol: "He", scaleCompensation: 67 / 100)
        let lithium = ARModel(name: "element_003_lithium", category: .element, chemicalSymbol: "Li", scaleCompensation: 67 / 100)
        let beryllium = ARModel(name: "element_004_beryllium", category: .element, chemicalSymbol: "Be", scaleCompensation: 67 / 100)
        self.arModels += [hydrogen, helium, lithium, beryllium]
    }
    
    func get(category: ModelCategory) -> [ARModel] {
        return arModels.filter( { $0.category == category } )
    }
}
