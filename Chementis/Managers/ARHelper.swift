//
//  ARHelper.swift
//  Chementis
//
//  Created by hunter downey on 4/24/23.
//

import Foundation
import RealityKit
import SwiftUI

class ARHelper: ObservableObject {
    
    func createTextEntity(element: ChemicalElement, scale: Float = 0.01) -> Entity {
        let text = "Element: \(element.name ?? "Failed")\nSymbol: \(element.symbol ?? "Failed")\nAtomic Mass: \(element.atomicMass ?? "Failed")"
        let textEntity = ModelEntity.createTextEntity(text: text, scale: scale)
        return textEntity
    }
    
}

