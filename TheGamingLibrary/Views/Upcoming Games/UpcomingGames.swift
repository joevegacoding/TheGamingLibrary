//
//  SwiftUIView.swift
//  TheGamingLibrary
//
//  Created by Joseph Bouhanef on 2023-08-16.
//

import SwiftUI

struct UpcomingGames: View {
    @StateObject var viewModel = GameViewModel()

    var body: some View {

        
        VStack(alignment: .leading, spacing: 12) {
            Text("Upcoming Games")
                .font(.title)
                .fontWeight(.bold)
                .padding(.leading, 15)
                .padding(.top,10)
            
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
             
                ForEach(viewModel.games) { game in
                    
                    NavigationLink {
                        
                        
                        GameDetailsView(rating: .constant(4), isShowingDetail: $viewModel.isShowingDetail, game: game, gameDetails: MockDataDetails.game1, gameScreenShot: MockDataScreenshots.game1)
                        
                        
                    } label: {
                        
                        SmallDiscoverGameCell(games: game)
                            .redacted(reason: viewModel.isLoading ? .placeholder : [])
                    }
                }
            }
            .padding(.leading)
        }
        }
        .task {
            viewModel.getUpcomingGames()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingGames()
    }
}
