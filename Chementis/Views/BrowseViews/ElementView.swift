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
                .font(.subheadline)
                .bold()
            
            Text(model.chemicalSymbol)
                .font(.footnote)
                .bold()
            
            Text(String(model.name.split(separator: "_")[1]))
                .font(.caption2)
        }
        .padding()
        .frame(width: 90, height: 90)
        .background(Color("mainColor").gradient)
        .foregroundColor(Color("textColor"))
        .cornerRadius(9)
    }
}
