//
//  CarouselScreenshots.swift
//  TheGamingLibrary
//
//  Created by Joseph Bouhanef on 2023-08-09.
//

import SwiftUI

struct CarouselScreenshots: View {
    @EnvironmentObject var viewModel: GameViewModel
    var image: String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CarouselScreenshots_Previews: PreviewProvider {
    static var previews: some View {
        CarouselScreenshots(image: "")
    }
}
