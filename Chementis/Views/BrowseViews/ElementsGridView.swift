//
//  HorizontalGridView.swift
//  RealityHD
//
//  Created by hunter downey on 4/23/23.
//

import SwiftUI

struct ElementsGridView: View {
    @EnvironmentObject var  placementSettings: PlacementSettings
    @Binding var showBrowse: Bool
    private let gridItemLayout = [
        GridItem(.adaptive(minimum: 90)), GridItem(.adaptive(minimum: 90)), GridItem(.adaptive(minimum: 90)), GridItem(.adaptive(minimum: 90))
    ]
    
    var title: String
    var items: [ARModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            SeparatorView()
            
            Text(title)
                .font(.headline)
                .bold()
                .padding(.top)
                .padding(.horizontal)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: gridItemLayout, spacing: 9) {
                    ForEach(0..<items.count, id: \.self) { index in
                        let model = items[index]
                        
                        ItemButtonView(model: model) {
                            model.loadModelEntity()
                            placementSettings.selectedModel = model
                            showBrowse = false
                        }
                    }
                }
            }
        }
    }
}
