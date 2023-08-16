//
//  GameViewModel.swift
//  TheGamingLibrary
//
//  Created by Joseph Bouhanef on 2023-07-19.
//

import SwiftUI


@MainActor final class GameViewModel: ObservableObject {
    
    
    @Published  var games: [Games] = []
    @Published  var gameScreenShots: [GameScreenshots] = []
    @Published  var gameStoreFronts: [GameStoreFronts] = []
    @Published  var gameDetails: GameDetails?
    @Published var selectedGame: Games?
    @Published var isShowingDetail = false
    @State var genresArray = [String]()
    //    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    //    @Published var isShowingDetail = false
    //    @Published var selectedAppetizer: Appetizer?
    
    //
    //    func getAppetizers() {
    //        isLoading = true
    //        NetworkManger.shared.getAppetizers { [self] result in
    //            DispatchQueue.main.async { [self] in
    //                isLoading = false
    //                switch result {
    //
    //                case .success(let appetizers):
    //                    self.appetizers = appetizers
    //
    //                case .failure(let error):
    //                    switch error {
    //                    case .invalidData:
    //
    //                        alertItem = AlertContext.invalidData
    //
    //                    case .invalidURL:
    //                        alertItem = AlertContext.invalidUrl
    //                    case .invalidReponse:
    //                        alertItem = AlertContext.invalidResponse
    //                    case .unableToComplete:
    //                        alertItem = AlertContext.unableToComplete
    //                    }
    //                }
    //            }
    //        }
    //    }
    
    
    func getGenres()->  String  {

            for genre in gameDetails?.genres ?? [] {
                genresArray.append(genre.name)
            }
        print(genresArray)
            return genresArray.joined(separator: ", ")
       
    }
    
    func getGames()  {
        isLoading = true
        
        Task {
            do {
                games =  try await NetworkManager.shared.getGames()
                isLoading = false
            } catch {
                if let appetizerError =  error as? GameError {
                    switch appetizerError {
                        
                    case .invalidURL:
                        print("alertItem = AlertContext.invalidUrl")
                    case .invalidReponse:
                        print("alertItem = AlertContext.invalidUrl")
                    case .invalidData:
                        print("alertItem = AlertContext.invalidUrl")
                    case .unableToComplete:
                        print("alertItem = AlertContext.invalidUrl")
                    }
                }
            }
            
            isLoading = false
        }
    }
    
    
    
    
    
    
    func searchGames(gameName: String)  {
        isLoading = true
        
        Task {
            do {
                games =  try await NetworkManager.shared.getSearchGames(searchText: gameName.replacingOccurrences(of: " ", with: "+"))
                isLoading = false
            } catch {
                if let appetizerError =  error as? GameError {
                    switch appetizerError {
                        
                    case .invalidURL:
                        print("alertItem = AlertContext.invalidUrl")
                    case .invalidReponse:
                        print("alertItem = AlertContext.invalidUrl")
                    case .invalidData:
                        print("alertItem = AlertContext.invalidUrl")
                    case .unableToComplete:
                        print("alertItem = AlertContext.invalidUrl")
                    }
                }
                //            alertItem = AlertContext.generalErrorMessage
                isLoading = false
            }
        }
    }
    
    func getGameDetails(id: Int)  {
        isLoading = true
        
        Task {
            do {
                gameDetails =  try await NetworkManager.shared.getGameDetails(id: id)
                isLoading = false
            } catch {
                if let appetizerError =  error as? GameError {
                    switch appetizerError {
                        
                    case .invalidURL:
                        print("alertItem = AlertContext.invalidUrl")
                    case .invalidReponse:
                        print("alertItem = AlertContext.invalidUrl")
                    case .invalidData:
                        print("alertItem = AlertContext.invalidUrl")
                    case .unableToComplete:
                        print("alertItem = AlertContext.invalidUrl")
                    }
                }
                //            alertItem = AlertContext.generalErrorMessage
                isLoading = false
            }
        }
    }
    
    func getGameScreenshots(id: Int)  {
        isLoading = true
        
        Task {
            do {
                gameScreenShots =  try await NetworkManager.shared.getGameScreenshots(id: id)
                isLoading = false
            } catch {
                if let appetizerError =  error as? GameError {
                    switch appetizerError {
                        
                    case .invalidURL:
                        print("alertItem = AlertContext.invalidUrl")
                    case .invalidReponse:
                        print("alertItem = AlertContext.invalidUrl")
                    case .invalidData:
                        print("alertItem = AlertContext.invalidUrl")
                    case .unableToComplete:
                        print("alertItem = AlertContext.invalidUrl")
                    }
                }
                //            alertItem = AlertContext.generalErrorMessage
                
            }
            
            isLoading = false
        }
    }
    
    
    func getGameStoreFronts(id: Int)  {
        isLoading = true
        
        Task {
            do {
                gameStoreFronts =  try await NetworkManager.shared.getGameStoreFronts(id: id)
                isLoading = false
            } catch {
                if let appetizerError =  error as? GameError {
                    switch appetizerError {
                        
                    case .invalidURL:
                        print("alertItem = AlertContext.invalidUrl")
                    case .invalidReponse:
                        print("alertItem = AlertContext.invalidUrl")
                    case .invalidData:
                        print("alertItem = AlertContext.invalidUrl")
                    case .unableToComplete:
                        print("alertItem = AlertContext.invalidUrl")
                    }
                }
                //            alertItem = AlertContext.generalErrorMessage
                
            }
            
            isLoading = false
        }
    }
    //getHighestRatedGamesOfThisYear
    
    
    func getHighestRatedGamesOfThisYear()  {
        isLoading = true
        
        Task {
            do {
                games =  try await NetworkManager.shared.getHighestRatedGamesOfThisYear()
                isLoading = false
            } catch {
                if let appetizerError =  error as? GameError {
                    switch appetizerError {
                        
                    case .invalidURL:
                        print("alertItem = AlertContext.invalidUrl")
                    case .invalidReponse:
                        print("alertItem = AlertContext.invalidUrl")
                    case .invalidData:
                        print("alertItem = AlertContext.invalidUrl")
                    case .unableToComplete:
                        print("alertItem = AlertContext.invalidUrl")
                    }
                }
            }
            
            isLoading = false
        }
    }

    
    
}
