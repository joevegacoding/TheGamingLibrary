//
//  FetchPlatforms.swift
//  TheGamingLibrary
//
//  Created by Beata Grzegorczyk on 2023-08-03.
//

import Foundation

func getPlatforms(platforms: [Platforms]) -> Array<String> {
    var platformArray = [String]()
    for plat in platforms {
        platformArray.append(plat.platform.name)
    }
    
    return platformArray

}
