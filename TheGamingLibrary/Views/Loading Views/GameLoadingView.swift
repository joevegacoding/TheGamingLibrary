//
//  GameLoadingView.swift
//  TheGamingLibrary
//
//  Created by Joseph Bouhanef on 2023-07-30.
//

import SwiftUI

struct GameLoadingView: View {
    
    private struct Constants {
        static let duration: Double = 0.9
        static let minOpacity: Double = 0.25
        static let maxOpacity: Double = 1.0
        static let cornerRadius: CGFloat = 2.0
    }
    @State private var opacity: Double = Constants.minOpacity
    public init() {}
    var body: some View {
        RoundedRectangle(cornerRadius: Constants.cornerRadius)
            .fill(Color(.systemGray6))
                .opacity(opacity)
                .transition(.opacity)
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: Constants.duration)
                    let repeated = baseAnimation.repeatForever(autoreverses: true)
                    withAnimation(repeated) {
                        self.opacity = Constants.maxOpacity
                    }
            }
               
                .preferredColorScheme(.dark)
        }
        
    }
 

struct GameLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        GameLoadingView()
    }
}
