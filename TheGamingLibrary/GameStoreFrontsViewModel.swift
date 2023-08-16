//
//  GameStoreFrontsViewModel.swift
//  TheGamingLibrary
//
//  Created by Beata Grzegorczyk on 2023-08-12.
//

import SwiftUI


final class GameStoreFrontsViewModel: ObservableObject {
    
    // properties for Image Viewer
    @StateObject var viewModel = GameViewModel()
    @Published  var games: [Games] = []
    

    
}
