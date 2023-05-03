//
//  HorizontalGridView.swift
//  RealityHD
//
//  Created by hunter downey on 4/23/23.
//

import SwiftUI

struct HorizontalGridView: View {
    @EnvironmentObject var  placementSettings: PlacementSettings
    @Binding var showBrowse: Bool
    private let gridItemLayout = [GridItem(.fixed(150))]
    
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
            
            ScrollView(.horizontal, showsIndicators: false)  {
                LazyHGrid(rows: gridItemLayout, spacing: 6) {
                    ForEach(0..<items.count, id: \.self) { index in
                        let model = items[index]
                        
                        ItemButtonView(model: model) {
                            model.loadModelEntity()
                            placementSettings.selectedModel = model
                            showBrowse = false
                        }
                    }
                }
                .padding()
            }
        }
    }
}
