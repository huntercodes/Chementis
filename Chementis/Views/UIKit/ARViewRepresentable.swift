//
//  ARViewRepresentable.swift
//  RealityHD
//
//  Created by hunter downey on 4/23/23.
//

import Foundation
import RealityKit
import SwiftUI

struct ARViewRepresentable: UIViewRepresentable {
    @EnvironmentObject var placementSettings: PlacementSettings
    @EnvironmentObject var sessionSettings: SessionSettings
    
    var viewModel: ARViewModel
    
    func makeUIView(context: Context) -> some UIView {
        let arView = CustomARView(frame: .zero, sessionSettings: sessionSettings)
        
        placementSettings.sceneObserver = arView.scene.subscribe(to: SceneEvents.Update.self, { event in
            updateScene(for: arView)
        })
        
        return arView
    }
    
    func createTextEntity(
        text: String,
        color: UIColor = .white,
        font: UIFont = UIFont.systemFont(ofSize: 0.03),
        backgroundColor: UIColor = UIColor(red: 24 / 255, green: 24 / 255, blue: 24 / 255, alpha: 1),
        borderColor: UIColor = UIColor(red: 86 / 255, green: 197 / 255, blue: 182 / 255, alpha: 1),
        borderWidth: Float = 0.001
    ) -> ModelEntity {
        let textMesh = MeshResource.generateText(
            text,
            extrusionDepth: 0.006,
            font: font,
            containerFrame: .zero,
            alignment: .center,
            lineBreakMode: .byCharWrapping
        )
        let textMaterial = SimpleMaterial(color: color, isMetallic: false)
        let textEntity = ModelEntity(mesh: textMesh, materials: [textMaterial])

        // Calculate the width of the text
        let attributedText = NSAttributedString(string: text, attributes: [NSAttributedString.Key.font: font])
        let textSize = attributedText.size()
        let textWidth = Float(textSize.width)
        let textHeight = Float(textSize.height)

        // Create a background rectangle
        let backgroundMesh = MeshResource.generatePlane(width: Float(textWidth), height: Float(textHeight))
        let backgroundMaterial = SimpleMaterial(color: backgroundColor, isMetallic: false)
        let backgroundEntity = ModelEntity(mesh: backgroundMesh, materials: [backgroundMaterial])

        // Create a border rectangle slightly larger than the background
        let borderMesh = MeshResource.generatePlane(width: Float(textWidth + borderWidth * 2), height: Float(textHeight + borderWidth * 2))
        let borderMaterial = SimpleMaterial(color: borderColor, isMetallic: false)
        let borderEntity = ModelEntity(mesh: borderMesh, materials: [borderMaterial])

        // Position the text entity above the background
        textEntity.position.z += 0.001

        // Create a parent ModelEntity to hold the text, background, and border
        let containerEntity = ModelEntity()
        containerEntity.addChild(borderEntity)
        containerEntity.addChild(backgroundEntity)
        containerEntity.addChild(textEntity)

        return containerEntity
    }
    
//    func createTextEntity(text: String, color: UIColor = .white, font: UIFont = UIFont.systemFont(ofSize: 0.03)) -> ModelEntity {
//        let textMesh = MeshResource.generateText(
//            text,
//            extrusionDepth: 0.01,
//            font: font,
//            containerFrame: .zero,
//            alignment: .center,
//            lineBreakMode: .byCharWrapping
//        )
//        let material = SimpleMaterial(color: color, isMetallic: false)
//        let modelEntity = ModelEntity(mesh: textMesh, materials: [material])
//
//        // Calculate the width of the text
//        let attributedText = NSAttributedString(string: text, attributes: [NSAttributedString.Key.font: font])
//        let textSize = attributedText.size()
//        let textWidth = Float(textSize.width)
//
//        // Adjust the position to center the text above the model
//        modelEntity.position.x -= textWidth / 2
//
//        return modelEntity
//    }
    
    private func updateScene(for arView: CustomARView) {
        arView.focusEntity?.isEnabled = placementSettings.selectedModel != nil

        if let confirmedModel = placementSettings.confirmedModel, let modelEntity = confirmedModel.modelEntity {
            if let elementName = placementSettings.confirmedModel?.getElementName(),
               let elementData = viewModel.getElementData(byName: elementName) {
                place(modelEntity, in: arView, elementData: elementData)
            } else {
                print("Element not found")
                place(modelEntity, in: arView)
            }
            placementSettings.confirmedModel = nil
        }
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    private func place(_ modelEntity: ModelEntity, in arView: ARView, elementData: ChemicalElement? = nil) {
        let clonedEntity = modelEntity.clone(recursive: true)
        clonedEntity.generateCollisionShapes(recursive: true)
        
        arView.installGestures([.translation, .rotation], for: clonedEntity)
        
        let anchorEntity = AnchorEntity(plane: .any)
        anchorEntity.addChild(clonedEntity)
        
        if let elementData = elementData {
            let text = """
        Name: \(elementData.name ?? "failed")
        Magnetic Ordering: \(elementData.magneticOrdering ?? "failed")
        Year Discovered: \(elementData.yearDiscovered ?? "failed")
        Group Block: \(elementData.groupBlock ?? "failed")
        """
            let textEntity = createTextEntity(text: text)
            textEntity.position.y += 0.12 // Adjust this value to position the text above the model
            anchorEntity.addChild(textEntity)
        }
        
        arView.scene.addAnchor(anchorEntity)
    }
}
