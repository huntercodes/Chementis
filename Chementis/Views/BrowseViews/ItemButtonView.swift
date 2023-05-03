//
//  ItemButtonView.swift
//  RealityHD
//
//  Created by hunter downey on 4/23/23.
//

import SwiftUI

struct ItemButtonView: View {
    let model: ARModel
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ElementView(model: model)
                .frame(width: 174, height: 174)
        }
    }
}

