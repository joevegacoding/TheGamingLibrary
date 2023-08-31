
//
//  ScreenshotsViewModel.swift
//  TheGamingLibrary
//
//  Created by Beata Grzegorczyk on 2023-08-07.
//

import SwiftUI

final class ScreenshotsViewModel: ObservableObject {
    
    // properties for Image Viewer
    @StateObject var gameViewModel = GameViewModel()
    
    @Published var showImageViewer = false
    @Published var selectedImageId: GameScreenshots = MockDataScreenshots.game1
    @Published var selectedImages: [GameScreenshots] = [ ]
    @Published var imageViewerOffset: CGSize = .zero
    
    @Published var backgroundOpacity: Double = 1
    
    @Published var imageScale: CGFloat = 1
    
    
    func setImageToFullScreenValue(index: Int) {
        selectedImages = gameViewModel.gameScreenShots
        selectedImageId = gameViewModel.gameScreenShots[index]
    }
    
}



