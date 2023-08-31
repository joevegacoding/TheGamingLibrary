//
//  GameDetailsView.swift
//  TheGamingLibrary
//
//  Created by Joseph Bouhanef on 2023-07-28.
//

import SwiftUI

struct GameDetailsView: View {
    
    @Binding var rating: Int
    @Binding var isShowingDetail: Bool
    @StateObject var viewModel = GameViewModel()
    
    // screenshot related properies
    @StateObject var screenShotViewModel = ScreenshotsViewModel()
    // needs to be @Published when moved
    
    @GestureState var draggingOffset: CGSize = .zero
    
    let game: Games
    let gameDetails: GameDetails
    let gameScreenShot: GameScreenshots
    var arrayOfStoreFronts: [String] = [String]()
    
    
    func getGameStoreFronts() -> [Int:String]{
        var gameFrontDictionnary: [Int: String] = [:]
        
        for storeGame in viewModel.gameStoreFronts {
            gameFrontDictionnary[storeGame.store_id] = storeGame.url
        }
        return gameFrontDictionnary
    }
    
    
    var body: some View {
        
        let description: String = viewModel.gameDetails?.description ?? "N/A"
        let genres = viewModel.gameDetails?.genres ?? []
        let platforms = viewModel.gameDetails?.platforms ?? []
        var platformArray = [String]()
        var genresArray = [String]()
        
        var gamePlatforms: String {
            for pltform in platforms {
                platformArray.append(pltform.platform.name)
            }
            return platformArray.joined(separator: ", ")
        }
        
        
        var gameGenres: String {
            for genre in genres {
                genresArray.append(genre.name)
            }
            
            return genresArray.joined(separator: ", ")
        }
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                // Header View
                GeometryReader { proxy in
                    ZStack {
                        
                        return AnyView (
                            
                            //Banner Image
                            ZStack {
                                AsyncImage(url: URL(string: game.background_image))  { image in
                                    image
                                        .resizable()
                                    
                                } placeholder: {
                                    Image("cod")
                                        .resizable()
                                    
                                }
                                .aspectRatio(contentMode: .fill)
                                .frame(width: getRect().width, height: 220, alignment: .center)
                                .cornerRadius(0)
                            }
                        )
                    }
                    
                }
                .frame(height: 220)
                
                
                GameDetailsTextHeader(title: game.name)
                
                CarouselGameInfo(gameRating: game.rating, gameRelease: game.released, gameDeveloper: viewModel.gameDetails?.developers[0].name ?? "")
                
                Divider()
                    .overlay(.gray)
                
                CollapsableTextView(attributedString(from: description), lineLimit: 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Divider()
                    .overlay(.gray)
                
                VStack(spacing: 10) {
                    Text("Platforms")
                        .foregroundColor(.gray)
                        .fontWeight(.regular)
                        .frame(maxWidth:  getRect().width, alignment: .leading)
                    
                    Text(gamePlatforms)
                        .frame(maxWidth:  getRect().width, alignment: .leading)
                }
                .padding()
                
                VStack(spacing: 10) {
                    Text("Genres")
                        .foregroundColor(.gray)
                        .fontWeight(.regular)
                        .frame(maxWidth:  getRect().width, alignment: .leading)
                    
                    Text(gameGenres)
                        .frame(maxWidth:  getRect().width, alignment: .leading)
                }
                .padding()
                
                Divider()
                    .overlay(.gray)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.gameScreenShots.indices, id: \.self) { (index) in
                            
                            Button {
                                print(index)
                                screenShotViewModel.selectedImages = viewModel.gameScreenShots
                                screenShotViewModel.selectedImageId = viewModel.gameScreenShots[index]
                                
                            } label: {
                                AsyncImage(url: URL(string: viewModel.gameScreenShots[index].image))  { image in
                                    image
                                        .resizable()
                                    
                                } placeholder: {
                                    Image("cod")
                                        .resizable()
                                    
                                }
                                .aspectRatio(contentMode: .fill)
                                .frame(width: getRect().width, height: 220, alignment: .center)
                                .cornerRadius(8)
                            }
                        }
                    }
                }
                .padding()
                
                
                
            }
            Divider()
                .overlay(.gray)
            
            
            
            
            
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Where To Buy")
                .foregroundColor(.gray)
                .fontWeight(.regular)
                .frame(maxWidth:  getRect().width, alignment: .leading)
            
            
            
            VStack(spacing: 25) {
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack {
                        
                        
                        
                        ForEach(getStoreFrontInfo(gameStoreFronts: getGameStoreFronts()).sorted(by: { $0.key < $1.key} ), id: \.key) { key, value in
                            
                            Link( destination: URL(string: value)!) {
                                Text(key)
                                
                            }
                            .frame(alignment: .leading)
                            .bold()
                            .frame(width: 120, height: 59)
                            .foregroundColor(.white)
                            .background(Color(UIColor.systemBlue))
                            .cornerRadius(8)
                            .font(.body)
                        }
                        
                    }
                }
            }
            .padding()
        }
        .ignoresSafeArea(.all, edges: .top)
        
        
        .task {
            viewModel.getGameDetails(id: game.id)
        }
        .task {
            viewModel.getGameScreenshots(id: game.id)
        }
        .task {
            viewModel.getGameStoreFronts(id: game.id)
        }
        .overlay (
            // Image Viewer
            ZStack {
                if !screenShotViewModel.selectedImages.isEmpty {
                    ZStack {
                        Color.black
                            .ignoresSafeArea()
                        
                        TabView(selection: $screenShotViewModel.selectedImageId) {
                            ForEach(screenShotViewModel.selectedImages, id: \.self) { image in
                                AsyncImage(url: URL(string: image.image))  { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                } placeholder: {
                                    Image("")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                                .tag(image)
                                .offset(y: screenShotViewModel.imageViewerOffset.height)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        .overlay (
                            Button(action: {
                                withAnimation(.default) {
                                    screenShotViewModel.selectedImages.removeAll()
                                }
                            }, label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.white.opacity(0.35))
                                    .clipShape(Circle())
                            })
                            .padding(10)
                            , alignment: .topTrailing
                        )
                        .navigationBarHidden(true)
                    }
                }
            }
        )
    }
}

struct GameDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailsView(rating: .constant(4), isShowingDetail: .constant(false), game: MockData.game1, gameDetails: MockDataDetails.game1, gameScreenShot: MockDataScreenshots.game1)
    }
}


extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func attributedString(from string: String) -> String {
        
        return string.replacingOccurrences(of: "<[^>]+>", with: "\n", options: .regularExpression, range: nil)
    }
    
    func getStoreFrontInfo(gameStoreFronts: [Int:String]) -> [String:String]{
        var dictionnaryStoreFront: [String: String] = [:]
        
        for gameStrFront in gameStoreFronts {
            switch gameStrFront.key {
            case 1:
                dictionnaryStoreFront["Steam"] = gameStrFront.value
            case 2:
                dictionnaryStoreFront["Xbox Store"] = gameStrFront.value
            case 3:
                dictionnaryStoreFront["Playstation Store"] = gameStrFront.value
            case 4:
                dictionnaryStoreFront["App Store"] = gameStrFront.value
            case 5:
                dictionnaryStoreFront["GOG"] = gameStrFront.value
            case 6:
                dictionnaryStoreFront["Nintentdo Store"] = gameStrFront.value
            case 8:
                dictionnaryStoreFront["Google Play"] = gameStrFront.value
            case 11:
                dictionnaryStoreFront["Epic Games"] = gameStrFront.value
            default:
                dictionnaryStoreFront[""] = gameStrFront.value
            }
        }
        return dictionnaryStoreFront
    }
}


