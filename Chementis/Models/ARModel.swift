//
//  ARModel.swift
//  Chementis
//
//  Created by hunter downey on 4/23/23.
//

import SwiftUI
import RealityKit
import Combine

//enum ModelCategory: CaseIterable {
//    case kitchen, livingRoom, marvel, garden
//
//    var label: String {
//        get {
//            switch self {
//            case .kitchen:
//                return "Kitchen"
//            case .livingRoom:
//                return "Living Room"
//            case .marvel:
//                return "Marvel"
//            case .garden:
//                return "Garden"
//            }
//        }
//    }
//}

class ARModel {
    
    var name: String
    var thumbnail: Image
    var modelEntity: ModelEntity?
    var scaleCompensation: Float
    
    private var cancellable: AnyCancellable?
    
    init(name: String, scaleCompensation: Float = 1.0) {
        self.name = name
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
        let hydrogen = ARModel(name: "element_001_hydrogen", scaleCompensation: 37 / 100)
        let helium = ARModel(name: "element_001_helium", scaleCompensation: 37 / 100)
        self.arModels += [hydrogen, helium]
    }
    
//    func get(category: ModelCategory) -> [ARModel] {
//        return arModels.filter( { $0.category == category } )
//    }
}
