//
//  CarouselView.swift
//  TheGamingLibrary
//
//  Created by Beata Grzegorczyk on 2023-08-14.
//

import SwiftUI

struct CarouselView: View {
    var body: some View {
        NavigationStack {
            TestView()
                .navigationTitle("Infinite carousel")
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}
