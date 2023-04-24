//
//  ARViewModel.swift
//  Chementis
//
//  Created by hunter downey on 4/24/23.
//

import Foundation

class ARViewModel: ObservableObject {
    
    @Published var elementData: [ChemicalElement] = []

    init() {
        ChemistryAPI.fetchAllElementData { result in
            switch result {
            case .success(let elements):
                DispatchQueue.main.async {
                    self.elementData = elements
                }
            case .failure(let error):
                print("Error fetching element data: \(error)")
            }
        }
    }
    
    func getElementData(byName name: String) -> ChemicalElement? {
        return elementData.first(where: { $0.name?.lowercased() == name.lowercased() })
    }

}
