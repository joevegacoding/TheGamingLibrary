//
//  GameScreenshotsModel.swift
//  TheGamingLibrary
//
//  Created by Beata Grzegorczyk on 2023-08-06.
//

import Foundation



struct GameScreenshots: Decodable, Identifiable, Hashable {
    let id: Int
    let image: String
    let is_deleted: Bool
    
}

struct GameScreenshotsResults: Decodable {
    let results: [GameScreenshots]
}


struct MockDataScreenshots {
    static let game1 = GameScreenshots(id: 005, image: "cod", is_deleted: false)
    
}
