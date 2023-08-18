//
//  GameDetailsTextHeader.swift
//  TheGamingLibrary
//
//  Created by Joseph Bouhanef on 2023-08-12.
//

import SwiftUI

struct GameDetailsTextHeader: View {
    var title: String = "Title"
    @State var isSelected: Bool = false
    
    var body: some View {
        HStack {
            Text(title)
                .frame(alignment: .center)
                .font(.title)
                .fontWeight(.bold)
                .padding( .top , 12)
                .padding(.leading, 8)
            
            Spacer()
            Button() {
                self.isSelected.toggle()
                
                
            } label: {
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundColor(isSelected ? .red : .white)
                    .frame(width: 20, height: 18)
            }
            .hidden()
        }
    }
}

struct GameDetailsTextHeader_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailsTextHeader()
    }
}
