//
//  RecentlyPlacedView.swift
//  RealityHD
//
//  Created by hunter downey on 4/23/23.
//


import SwiftUI

struct RecentlyPlacedView: View {
    @EnvironmentObject var placementSettings: PlacementSettings

    var body: some View {
        Button {
            withAnimation(.easeInOut) { placementSettings.selectedModel = placementSettings.recentlyPlaced.last }
        } label: {
            if let recentlyPlacedModel = placementSettings.recentlyPlaced.last {
                ElementView(model: recentlyPlacedModel)
                    .frame(width: 60, height: 60)
            } else {
                Image(systemName: "clock.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color("mainColor"))
                .frame(width: 40, height: 40)
            }
        }
    }
}
