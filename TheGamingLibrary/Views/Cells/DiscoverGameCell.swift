//
//  DiscoverGameCell.swift
//  TheGamingLibrary
//
//  Created by Joseph Bouhanef on 2023-07-17.
//

import SwiftUI

struct DiscoverGameCell: View {
    @StateObject var viewModel = GameViewModel()
    @State var isMain: Bool = true
    @State var isBigMain: Bool = false

   
    let games: Games
    var body: some View {
        if viewModel.isLoading {
            GameLoadingView()
                .frame(width: UIScreen.main.bounds.width, height: 225)
        }
        VStack(alignment: .leading, spacing: 5) {
            if isMain {
                Text(games.name)
                    .font(.title2)
                    .padding(.leading, 8)
                    .fontWeight(.semibold)
                    .frame(maxWidth: 280)
                    .lineLimit(nil)
                    .fontWeight(.semibold)
                    .fixedSize()
            } 
                
            
            AsyncImage(url: URL(string: games.background_image)) { image in
                
                image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 280, height: 180)
                .cornerRadius(8)
                .padding(10)
            } placeholder: {
              Image("cod")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 280, height: 180)
                    .cornerRadius(8)
                    .padding(10)
                    .redacted(reason: .placeholder)

            }
            
            if !isMain {
                Text(games.name)
                    .font(.title2)
                    .frame(maxWidth: 280)
                    .lineLimit(nil)
                    .fontWeight(.semibold)
                    .fixedSize()
            }
        }
       
    }
}

struct DiscoverGameCell_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverGameCell(games: MockData.game1)
        
    }
}
