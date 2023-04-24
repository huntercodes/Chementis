//
//  ModelEntityExtension.swift
//  Chementis
//
//  Created by hunter downey on 4/24/23.
//

import Foundation
import RealityKit
import SwiftUI

extension ModelEntity {
    static func createTextEntity(text: String, font: UIFont = .systemFont(ofSize: 1.0), depth: CGFloat = 0.1, scale: Float = 0.01) -> ModelEntity {
        let textMesh = MeshResource.generateText(
            text,
            extrusionDepth: Float(depth),
            font: font,
            containerFrame: .zero,
            alignment: .center,
            lineBreakMode: .byCharWrapping
        )
        
        let material = SimpleMaterial(color: .white, isMetallic: false)
        let modelEntity = ModelEntity(mesh: textMesh, materials: [material])
        modelEntity.scale = SIMD3<Float>(scale, scale, scale)
        return modelEntity
    }
}

