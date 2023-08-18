//
//  NetworkManager.swift
//  TheGamingLibrary
//
//  Created by Joseph Bouhanef on 2023-07-18.
//

import Foundation

final class NetworkManager: ObservableObject {
    static let shared = NetworkManager()
    
    let apiKey = ""

    private init() {}
    let date: Date = Date()
    var dateComp = DateComponents()
        
    
    func getGames() async throws -> [Games]  {
       
       
        dateComp.year = 1

        let upcomingDate =  Calendar.current.date(byAdding: dateComp, to: date)
        let formattedDate = date.formatted(.iso8601.year().month().day())

        let formattedFutureDate = upcomingDate?.formatted(.iso8601.year().month().day())
       
        guard let url = URL(string: "https://api.rawg.io/api/games?token&key=\(apiKey)&dates=\(formattedDate),\(formattedFutureDate ?? "2025-01-01")&ordering=-added") else {
            throw  GameError.invalidURL
        }
        
        let (data, _ ) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(GameResults.self, from: data).results
            
            return decodedData
            
        } catch {
            throw GameError.invalidData
        }
    }
    
    func getUpcomingGames() async throws -> [Games]  {
       
        dateComp.year = 1

        let upcomingDate =  Calendar.current.date(byAdding: dateComp, to: date)
        let formattedDate = date.formatted(.iso8601.year().month().day())

        let formattedFutureDate = upcomingDate?.formatted(.iso8601.year().month().day())
       
        guard let url = URL(string: "https://api.rawg.io/api/games?token&key=\(apiKey)&dates=\(formattedDate),\(formattedFutureDate ?? "2025-01-01")&ordering=-added") else {
            throw  GameError.invalidURL
        }
        
        let (data, _ ) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(GameResults.self, from: data).results
            
            return decodedData
            
        } catch {
            throw GameError.invalidData
        }
    }
    
    func getNewReleaseGames() async throws -> [Games]  {
       
        dateComp.month = -3

        let pastDate =  Calendar.current.date(byAdding: dateComp, to: date)
        let formattedDate = date.formatted(.iso8601.year().month().day())

        let formattedPastDate = pastDate?.formatted(.iso8601.year().month().day())
       
        guard let url = URL(string: "https://api.rawg.io/api/games?token&key=\(apiKey)&dates=\(formattedPastDate ?? "2023-01-01"),\(formattedDate )&ordering=-added") else {
            throw  GameError.invalidURL
        }
        
        let (data, _ ) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(GameResults.self, from: data).results
            
            return decodedData
            
        } catch {
            throw GameError.invalidData
        }
    }
    
    func getHighestRatedGamesOfThisYear() async throws -> [Games] {
        
        let thisYear: String = date.formatted(.iso8601.year())
        
        
        guard let url = URL(string: "https://api.rawg.io/api/games?token&key=\(apiKey)&dates=\(thisYear)-01-01,\(thisYear)-12-31&ordering=-rating") else {
            throw  GameError.invalidURL
        }
        
        let (data, _ ) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(GameResults.self, from: data).results
            
            return decodedData
            
        } catch {
            throw GameError.invalidData
        }
    }
    
    func getSearchGames(searchText: String) async throws -> [Games] {
        
        guard let url = URL(string: "https://api.rawg.io/api/games?token&key=\(apiKey)&search=\(searchText.spaceTrimmed())") else {
            throw  GameError.invalidURL
        }
        
        let (data, _ ) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(GameResults.self, from: data).results
            
            return decodedData
            
        } catch {
            throw GameError.invalidData
        }
    }
    
    func getGameDetails(id: Int) async throws ->  GameDetails  {
        
        guard let url = URL(string: "https://api.rawg.io/api/games/\(id)?token&key=\(apiKey)") else {
            throw  GameError.invalidURL
        }
        let (data, _ ) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(GameDetails.self, from: data)
            return decodedData
            
        } catch {
            throw GameError.invalidData
        }
    }
    
    
    func getGameScreenshots(id: Int) async throws ->  [GameScreenshots]  {
        
    
        guard let url = URL(string: "https://api.rawg.io/api/games/\(id)/screenshots?key=\(apiKey)") else {
            throw  GameError.invalidURL
        }
        
        let (data, _ ) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(GameScreenshotsResults.self, from: data).results
            print(decodedData)
            return decodedData
            
        } catch {
            throw GameError.invalidData
        }
    }
    
    
    func getGameStoreFronts(id: Int) async throws ->  [GameStoreFronts]  {
        
    
        guard let url = URL(string: "https://api.rawg.io/api/games/\(id)/stores?key=\(apiKey)") else {
            throw  GameError.invalidURL
        }
        
        let (data, _ ) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(GameStoreFrontsResults.self, from: data).results
            print(decodedData)
            return decodedData
            
        } catch {
            throw GameError.invalidData
        }
    }
    
    
    
}
