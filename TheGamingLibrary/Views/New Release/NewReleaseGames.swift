//
//  NewReleaseGames.swift
//  TheGamingLibrary
//
//  Created by Beata Grzegorczyk on 2023-08-17.
//

import SwiftUI

struct NewReleaseGames: View {
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            Text("New Release")
                .font(.title)
                .fontWeight(.bold)
                .padding(.leading, 15)
                .padding(.top,10)
                .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    
                    ForEach(viewModel.games) { game in
                        
                        NavigationLink {
                            
                            GameDetailsView(rating: .constant(4), isShowingDetail: $viewModel.isShowingDetail, game: game, gameDetails: MockDataDetails.game1, gameScreenShot: MockDataScreenshots.game1)
                            
                            
                        } label: {
                            
                            DiscoverGameCell(isMain: false, games: game)
                                .redacted(reason: viewModel.isLoading ? .placeholder : [])
                        }
                    }
                }
                .padding(.leading)
              
            }
        }
        .padding(.top, 30)
        .task {
            viewModel.getNewReleaseGames()
        }
    }
}

struct NewReleaseGames_Previews: PreviewProvider {
    static var previews: some View {
        NewReleaseGames()
    }
}
