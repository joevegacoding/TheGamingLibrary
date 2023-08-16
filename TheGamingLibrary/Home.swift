//
//  Home.swift
//  TheGamingLibrary
//
//  Created by Joseph Bouhanef on 2023-07-17.
//

import SwiftUI

struct Home: View {
    @StateObject var viewModel = GameViewModel()
 
    var body: some View {
        
        NavigationView {
            ScrollView {
                
            
            VStack {
                
            
      DiscoverGamesView()
                
                HStack {
                    Text("Upcoming Games")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading, 15)
                    Spacer()

                }
                .padding(.top,10)
                    
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                     
                        ForEach(viewModel.games) { game in
                           SmallDiscoverGameCell(games: game)
                        }
                    }
                    .padding(.leading)
                }
                
                
                
                HStack {
                    Text("New Releases")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading, 20)
                        
                    Spacer()
                }
                .padding(.top, 30)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack() {
                        ForEach(viewModel.games) { game in
                            DiscoverGameCell(isMain: false, games: game)
                                .redacted(reason: viewModel.isLoading ? .placeholder : [])
                                .padding(.leading, 5)
                        }
                    }
                    .padding(.leading)
                }
                
                HStack {
                    Text("Bests Of The Year")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading, 15)
                        
                    Spacer()
                }
                .padding(.top, 30)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack() {
                     
                        ForEach(viewModel.games) { game in
                            DiscoverGameCell(isMain: false,  games: game)
                        }
                    }
                    .padding(.leading)
                }
            }
            }
       
        .disabled(viewModel.isShowingDetail)
           
        }
        .task {
            viewModel.getGames()
        }
        
        if viewModel.isShowingDetail {
            GameDetailsView(rating: .constant(4), isShowingDetail: $viewModel.isShowingDetail, game: viewModel.selectedGame!, gameDetails: MockDataDetails.game1, gameScreenShot: MockDataScreenshots.game1)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
