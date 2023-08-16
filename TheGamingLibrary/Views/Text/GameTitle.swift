//
//  GameTitle.swift
//  TheGamingLibrary
//
//  Created by Beata Grzegorczyk on 2023-07-30.
//

import SwiftUI

struct GameTitle: View {
    let title: String
    var body: some View {
        Text(title)
    }
}

struct GameTitle_Previews: PreviewProvider {
    static var previews: some View {
        GameTitle(title: "game")
    }
}
