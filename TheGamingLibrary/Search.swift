//
//  Search.swift
//  TheGamingLibrary
//
//  Created by Joseph Bouhanef on 2023-07-17.
//

import SwiftUI

struct Search: View {
    @StateObject var viewModel = GameViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            
            List(viewModel.games) { game in
                
                NavigationLink {
                    GameDetailsView(rating: .constant(4), isShowingDetail: $viewModel.isShowingDetail, game: game, gameDetails: MockDataDetails.game1, gameScreenShot: MockDataScreenshots.game1)
                } label: {
                    HStack {
                        AsyncImage(url: URL(string: game.background_image)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 180, height: 120)
                                .cornerRadius(8)
                                .padding(10)
                        } placeholder: {
                            Image("cod")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 180, height: 120)
                                .cornerRadius(8)
                                .padding(10)
                        }
                        
                        VStack(spacing: 12) {
                            Text(game.name)
                                .font(.headline)
                                .fontWeight(.medium)
                            
                                .frame(width: 120, alignment: .leading)
                                .shadow(radius: 40)
                                .font(.body)
                            
                                .foregroundColor(Color(.label))
                                .lineLimit(nil)
                            Text(String(game.rating))
                                .font(.headline)
                                .fontWeight(.medium)
                            
                                .frame(width: 120, alignment: .leading)
                            
                                .font(.body)
                            
                                .foregroundColor(Color(.label))
                                .lineLimit(nil)
                        }
                        
                    }
                }.listStyle(.plain)
            }
            
            .searchable(text: $searchText)
            .onChange(of: searchText) { value in
                
                Task {
                    // not sure about the checks
                    if !value.isEmpty {
                        
                        viewModel.searchGames(gameName: value )
                        
                    } else {
                        viewModel.games.removeAll()
                    }
                }
            }
            .navigationTitle("Search")
        }
        
        .task {
            viewModel.getGames()
        }
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
