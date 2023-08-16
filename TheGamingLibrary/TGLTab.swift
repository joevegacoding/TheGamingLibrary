//
//  TGLTab.swift
//  TheGamingLibrary
//
//  Created by Joseph Bouhanef on 2023-07-17.
//

import SwiftUI

struct TGLTab: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            Search()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            MyGames()
                .tabItem {
                    Label("My Games", systemImage: "gamecontroller")
                }
            Profile()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct TGLTab_Previews: PreviewProvider {
    static var previews: some View {
        TGLTab()
    }
}
