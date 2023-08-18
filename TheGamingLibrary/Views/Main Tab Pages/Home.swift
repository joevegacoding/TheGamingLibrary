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
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
