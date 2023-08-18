//
//  CarouselGameInfo.swift
//  TheGamingLibrary
//
//  Created by Joseph Bouhanef on 2023-08-12.
//

import SwiftUI

struct CarouselGameInfo: View {
    
    // game.rating
//    game.released
    // viewModel.gameDetails?.developers[0].name
    var gameRating: Double = 1.0
    var gameRelease: String = " "
    var gameDeveloper: String? = "Sony"
    
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack {
                VStack(spacing: 9) {
                    Text("\(String(format: "%.2f", gameRating)) / 5")
                        .font(.body)
                    Image(systemName: "star.fill")
                        .font(.body)
                        .foregroundColor(.yellow)
                }
                .padding()
                
                Divider()
                    .overlay(.white)
                    .frame(height: 50)
                
                VStack(spacing: 10) {
                    Text("Released")
                        .foregroundColor(.gray)
                        .fontWeight(.regular)
                    Text(gameRelease)
                }
                .font(.body)
                .padding()
                
                Divider()
                    .overlay(.white)
                    .frame(height: 50)
                
                VStack(spacing: 10) {
                    Text("Developers")
                        .foregroundColor(.gray)
                        .fontWeight(.regular)
                    Text(gameDeveloper ?? "Sony")
                    
                    
                    
                }
                .font(.body)
                .padding()
                
                Divider()
                    .overlay(.white)
                    .frame(height: 50)
            }
        }
        
        .font(.title2)
        .fontWeight(.semibold)
    }
}

struct CarouselGameInfo_Previews: PreviewProvider {
    static var previews: some View {
        CarouselGameInfo()
    }
}
