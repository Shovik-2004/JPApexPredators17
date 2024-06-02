//
//  ContentView.swift
//  JPApexPredators17
//
//  Created by shovik banerjee on 31/05/24.
//

import SwiftUI

struct ContentView: View {
    let predators = Predators()
    @State var searchText = ""
    
    var body: some View {
        NavigationStack{
            List(predators.apexPredators) {predator in
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
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
