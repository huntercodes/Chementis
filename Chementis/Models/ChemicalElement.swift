//
//  ChemicalElement.swift
//  Chementis
//
//  Created by hunter downey on 4/24/23.
//

import Foundation

struct ChemicalElement: Codable {
    let atomicNumber: String?
    let atomicMass: String?
    let electronConfiguration: String?
    let meltingPoint: String?
    let boilingPoint: String?
    let name: String?
    let symbol: String?
    let standardState: String?
    let magneticOrdering: String?
    let facts: String?
    let history: String?
    let yearDiscovered: String?
    let groupBlock: String?
}
