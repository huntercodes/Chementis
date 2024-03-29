//
//  ContentView.swift
//  Chementis
//
//  Created by hunter downey on 4/7/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var placementSettings: PlacementSettings
    @State private var isControlVisible = true
    @State private var showBrowse = false
    @State private var showSettings = false
    
    @ObservedObject var viewModel = ARViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewRepresentable(viewModel: viewModel)
            
            if placementSettings.selectedModel == nil {
                ControlView(isControlVisible: $isControlVisible, showBrowse: $showBrowse, showSettings: $showSettings)
            } else {
                PlacementView()
            }
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
