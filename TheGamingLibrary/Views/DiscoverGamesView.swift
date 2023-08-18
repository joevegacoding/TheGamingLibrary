//
//  DiscoverGamesView.swift
//  TheGamingLibrary
//
//  Created by Joseph Bouhanef on 2023-08-15.
//

import SwiftUI

struct DiscoverGamesView: View {
    
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                
                ForEach(viewModel.games) { game in
                    
                    NavigationLink {
                        
                        GameDetailsView(rating: .constant(4), isShowingDetail: $viewModel.isShowingDetail, game: game, gameDetails: MockDataDetails.game1, gameScreenShot: MockDataScreenshots.game1)
                        
                    } label: {
                        DiscoverGameCell(isMain: true, games: game)
                    }
                    .ignoresSafeArea()
                    .navigationTitle("")
                    Spacer()
                }
            }
            .padding()
        }
        
        .task {
            viewModel.getHighestRatedGamesOfThisYear()
        }
    }
}

struct DiscoverGamesView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverGamesView()
    }
}
