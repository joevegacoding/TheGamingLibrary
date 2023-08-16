//
//  String+Extensions.swift
//  TheGamingLibrary
//
//  Created by Joseph Bouhanef on 2023-07-20.
//

import Foundation

extension String {
    func spaceTrimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
