//
//  PeriodicTableViewModel.swift
//  Chementis
//
//  Created by hunter downey on 4/7/23.
//

import Foundation

class PeriodicTableViewModel: ObservableObject {
    
    @Published private(set) var elements: [Element] = []
    
    init() {
        loadElements()
    }
    
    private func loadElements() {
        elements = [
            Element(id: 1, symbol: "H", name: "Hydrogen")
        ]
    }
    
}
