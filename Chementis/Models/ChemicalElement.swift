//
//  ChemicalElement.swift
//  Chementis
//
//  Created by hunter downey on 4/24/23.
//

import Foundation

struct ChemicalElement: Codable {
    let atomicNumber: Int?
    let atomicMass: Double?
    let electronConfiguration: String?
    let density: Double?
    let meltingPoint: Double?
    let boilingPoint: Double?
    
    enum CodingKeys: String, CodingKey {
        case atomicNumber = "number"
        case atomicMass = "standard_atomic_weight"
        case electronConfiguration = "electron_configuration"
        case density
        case meltingPoint = "melting_point"
        case boilingPoint = "boiling_point"
    }
}
