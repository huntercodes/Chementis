//
//  StringExtension.swift
//  Chementis
//
//  Created by hunter downey on 4/24/23.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}
