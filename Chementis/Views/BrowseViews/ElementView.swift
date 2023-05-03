//
//  ElementView.swift
//  Chementis
//
//  Created by hunter downey on 5/3/23.
//

import SwiftUI

struct ElementView: View {
    let model: ARModel
    
    var body: some View {
        VStack {
            Text(model.getElementName() ?? "")
                .font(.title2)
                .bold()
            
            Text(model.chemicalSymbol)
                .font(.headline)
                .bold()
            
            Text(String(model.name.split(separator: "_")[1]))
                .font(.caption)
        }
        .padding()
        .background(Color("mainColor").gradient)
        .foregroundColor(.secondary)
        .cornerRadius(9)
    }
}
