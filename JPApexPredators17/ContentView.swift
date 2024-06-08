//
//  ContentView.swift
//  JPApexPredators17
//
//  Created by shovik banerjee on 31/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var alphabetical = false
    @State var searchText = ""
    @State var currentSelection = PredatorType.all
    
    let predators = Predators()
    
    var filteredDinos: [ApexPredator] {
        
        predators.filter(by: currentSelection)
        predators.sort(by:  alphabetical)
        return predators.search(for: searchText)
    }
    
    var body: some View {
        NavigationStack{
            List(filteredDinos) {predator in
                NavigationLink{
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                } label: {
                    HStack {
                        //dianosaur image
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white, radius: 1)
                        
                        
                        VStack (alignment: .leading){
                            //name
                            Text(predator.name)
                                .fontWeight(.bold)
                            
                            //type
                            Text(predator.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                                .background(predator.type.background)
                                .clipShape(.capsule)
                            
                        }
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        withAnimation{
                            alphabetical.toggle()
                        }
                    } label:{
                        if alphabetical{
                            Image (systemName: "textformat")
                            
                        } else{
                            Image(systemName: "film")
                        }
                    }
                }
                ToolbarItem( placement: .topBarTrailing){
                    Menu{
                        Picker("Filter", selection: $currentSelection.animation()) {
                            ForEach( PredatorType.allCases) {
                                type in
                                Label(type.rawValue.capitalized, systemImage: type.icon)
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
