//
//  ViewExtension.swift
//  Chementis
//
//  Created by hunter downey on 4/23/23.
//

import SwiftUI

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
            case true:
                self.hidden()
            case false:
                self
        }
    }
}
