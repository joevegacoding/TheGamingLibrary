//
//  RatingView.swift
//  TheGamingLibrary
//
//  Created by Beata Grzegorczyk on 2023-08-02.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    var label = ""
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.white
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                    
                Text(label)
                    .font(.body)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
            .frame(width: 1, height: 1)
            .imageScale(.small)
            .font(.body)
            .padding(4)
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
