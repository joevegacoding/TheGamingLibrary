//
//  FullScreenImageView.swift
//  TheGamingLibrary
//
//  Created by Beata Grzegorczyk on 2023-08-10.
//

import SwiftUI

struct FullScreenImageView: View {
    
    @StateObject var screenShotViewModel = ScreenshotsViewModel()
    @StateObject var viewModel = GameViewModel()
    
    var gameScreenShots = [GameScreenshots]()
//    viewModel.gameScreenShots
//    var arrayOfGameScreenshots:
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(gameScreenShots.indices, id: \.self) { (index) in
                    
                    Button {
                        screenShotViewModel.setImageToFullScreenValue(index: index)
                        
                    } label: {
                        AsyncImage(url: URL(string: viewModel.gameScreenShots[index].image))  { image in
                            image
                                .resizable()
                            
                        } placeholder: {
                            Image("cod")
                                .resizable()
                            
                        }
                        .aspectRatio(contentMode: .fill)
                        .frame(width: getRect().width, height: 220, alignment: .center)
                        .cornerRadius(8)
                    }
                }
            }
        }
    }
}

struct FullScreenImageView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenImageView()
    }
}
