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
                    
                    UpcomingGames()
                    
                    NewReleaseGames()
                    
                }
              
            }
            
            .disabled(viewModel.isShowingDetail)
            
        }
        
//        if viewModel.isShowingDetail {
//            GameDetailsView(rating: .constant(4), isShowingDetail: $viewModel.isShowingDetail, game: viewModel.selectedGame!, gameDetails: MockDataDetails.game1, gameScreenShot: MockDataScreenshots.game1)
//        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
