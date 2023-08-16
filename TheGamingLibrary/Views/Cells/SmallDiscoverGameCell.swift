//
//  SmallDiscoverGameCell.swift
//  TheGamingLibrary
//
//  Created by Joseph Bouhanef on 2023-07-17.
//

import SwiftUI

struct SmallDiscoverGameCell: View {
    let games: Games
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {
//        VStack {
        VStack(alignment: .leading, spacing: 0) {
            
            AsyncImage(url: URL(string: games.background_image)) { image in
                
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .cornerRadius(8)
                    .padding()
                   
            } placeholder: {
                Image("cod")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .cornerRadius(8)
                    .padding()
                    .redacted(reason: .placeholder)
            }
              
            
            Text(games.name)
                .font(.headline)
                .fontWeight(.semibold)
                
//                .frame(width: , height: 40, alignment: .leading)
                .foregroundColor(Color(.label))
                .lineLimit(nil)
                .padding(.leading, 20)
                .frame(maxWidth: 150)
                .lineLimit(nil)
                .fontWeight(.semibold)
                .fixedSize()
    
//        }
        }
    
      
    }
    
 
}

struct SmallDiscoverGameCell_Previews: PreviewProvider {
    static var previews: some View {
        SmallDiscoverGameCell(games: MockData.game1)
    }
}
