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
    
    func createTextEntity(text: String, scale: Float = 0.01) -> Entity {
        let textEntity = ModelEntity.createTextEntity(text: text, scale: scale)
        return textEntity
    }
    
}
