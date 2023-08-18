//
//  GameDetailsModel.swift
//  TheGamingLibrary
//
//  Created by Beata Grzegorczyk on 2023-08-03.
//

import Foundation


struct GameDetails: Decodable, Identifiable {
    let id: Int
    let name: String
    var platforms: [Platforms]
    var developers: [Developers]
    var genres: [Genres]
    let description: String
    let background_image: String
}

struct Platforms: Decodable, Hashable {
    var platform: Platform
    
    struct Platform: Decodable, Hashable {
        let id: Int
        var name: String
    }
}

struct Developers: Decodable, Hashable {
        let id: Int
        var name: String
}

struct Genres: Decodable, Hashable {
        let id: Int
        var name: String
}


