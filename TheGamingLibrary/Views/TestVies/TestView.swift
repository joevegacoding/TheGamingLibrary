//
//  TestView.swift
//  TheGamingLibrary
//
//  Created by Beata Grzegorczyk on 2023-08-08.
//

import SwiftUI
import SafariServices

struct TestView: View {
    
    @State private var currentPage: String = ""
    @State private var listOfPages: [Page] = []
    @StateObject var viewModel = GameViewModel()
    
    
  
    
    func gameBackgrounds() -> [String] {
        var arrayOfBackgrounds: [String] = []
        for gameImg in viewModel.games {
            arrayOfBackgrounds.append(gameImg.name)
        }
        
        return arrayOfBackgrounds
    }
    
    var body: some View {
        GeometryReader {
            let size = $0.size
           

            TabView(selection: $currentPage, content: {
//                Button {
//                    print("hello")
//                } label: {
//                    Text("hello")
//                }
              
                ForEach(listOfPages.indices, id: \.self) { page in
//                    RoundedRectangle(cornerRadius: 25, style: .continuous)
//                        .fill(page.color.gradient)
//                        .frame(width: 300, height: size.height)
                    Text(listOfPages[page].gameName)
                  

                }
            })
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .frame(height: 400)
        .task {
            viewModel.getGames()
          
        }
            .onAppear {
                for color in viewModel.games {
                    listOfPages.append(.init(gameName: color.name))
                }
            }
           
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}


