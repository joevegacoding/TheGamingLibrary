//
//  GameStoreFrontsModel.swift
//  TheGamingLibrary
//
//  Created by Beata Grzegorczyk on 2023-08-12.
//

import Foundation



struct GameStoreFronts: Decodable, Identifiable, Hashable {
    let id: Int
    let url: String
    let store_id: Int
    
}

struct GameStoreFrontsResults: Decodable {
    let results: [GameStoreFronts]
}


struct MockDataStoreFronts {
    static let game1 = GameStoreFronts(id: 001, url: "https://www.playstation.com", store_id: 10)
    
}
