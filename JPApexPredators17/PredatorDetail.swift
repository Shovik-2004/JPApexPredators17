//
//  PredatorDetail.swift
//  JPApexPredators17
//
//  Created by shovik banerjee on 08/06/24.
//

import SwiftUI

struct PredatorDetail: View {
    let predator: ApexPredator
    var body: some View {
        GeometryReader {geo in
            ScrollView{
                ZStack{
                    //background image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                    
                    
                    //dino image
                    Image( predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5, height: geo.size.height/3)
                        .scaleEffect(x: -1)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 7)
                        .offset(y: 20)
                }
                
                VStack (alignment: .leading){
                    //dino name
                    Text (predator.name)
                        .font(.largeTitle)
                    //current location
                    
                    //appears in
                    Text("Appears in: ")
                        .font(.title3)
                    
                    ForEach (predator.movies, id: \.self) {
                        movie in
                        Text("•" + movie)
                            .font(.subheadline)
                        
                    }
                    //movie moments
                    Text( "Movie Moments")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding(.top, 15)
                    
                    ForEach (predator.movieScenes) {
                        scene in Text( scene.movie)
                            .font(.title3)
                            .padding(.vertical, 1)
                        Text (scene.sceneDescription)
                            .padding(.bottom, 15)
                        
                    }
                    
                    
                    //link to webpage
                    
                    Text("Read More: ")
                        .font(.caption)
                    
                    Link( predator.link, destination:   URL (string: predator.link)!)
                        .font(.caption)
                        .foregroundStyle(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
                .padding()
                .padding(.bottom)
                .frame(width: geo.size.width, alignment: .leading)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[12])
//        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
