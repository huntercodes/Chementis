//
//  SessionSettings.swift
//  Chementis
//
//  Created by hunter downey on 4/23/23.
//

import SwiftUI

final class SessionSettings: ObservableObject {
    @Published var isPeopleOcclusionEnabled: Bool = false
    @Published var isObjectOcclusionEnabled: Bool = false
    @Published var isLidarDebugEnabled: Bool = false
    @Published var isMultiUserEnabled: Bool = false
}
