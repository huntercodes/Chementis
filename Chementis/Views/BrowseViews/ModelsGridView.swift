//
//  ModelsGridView.swift
//  RealityHD
//
//  Created by hunter downey on 4/23/23.
//

import SwiftUI

struct ModelsGridView: View {
    @Binding var showBrowse: Bool
    let models = Models()
    
    var body: some View {
        VStack {
            ForEach(ModelCategory.allCases, id: \.self) { category in
                if let modelsByCategory = models.get(category: category) {
                    HorizontalGridView(showBrowse: $showBrowse, title: category.label, items: modelsByCategory)
                }
            }
        }
    }
}
