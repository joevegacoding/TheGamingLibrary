//
//  GameModel.swift
//  TheGamingLibrary
//
//  Created by Joseph Bouhanef on 2023-07-18.
//

import Foundation


struct Games: Decodable, Identifiable {
    let id: Int
    let name: String
    let background_image: String
    let released: String
    let rating: Double
    let playtime: Int
    
}

struct GameResults: Decodable {
    let results: [Games]
}

struct MockData {
    static let game1 = Games(id: 001, name: "God Of War", background_image: "gow", released: "2022", rating: 3.0, playtime: 10)
    static let game2 = Games(id: 002, name: "God Of War", background_image: "gow", released: "2022", rating: 3.0, playtime: 10)
    static let game3 = Games(id: 003, name: "God Of War", background_image: "gow", released: "2022", rating: 3.0, playtime: 10)
    static let games = [game1, game2, game3]

}

struct MockDataDetails {
    static let game1 = GameDetails(id: 002, name: "Street Fighter", platforms: [Platforms](), developers: [Developers](), genres: [Genres](), description: "description", background_image: "")
    
}




 
