//
//  GameInfoList.swift
//  TheGamingLibrary
//
//  Created by Joseph Bouhanef on 2023-08-12.
//

import SwiftUI

struct GameInfoList: View {
    
    var genres: String = " "
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Genres")
                .foregroundColor(.gray)
                .fontWeight(.regular)
                .frame(maxWidth:  getRect().width, alignment: .leading)
            
            Text(genres)
                .frame(maxWidth:  getRect().width, alignment: .leading)
            
            
        }
        .padding()
    }
}

struct GameInfoList_Previews: PreviewProvider {
    static var previews: some View {
        GameInfoList()
    }
}
