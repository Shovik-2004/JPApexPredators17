//
//  PredatorMap.swift
//  JPApexPredators17
//
//  Created by shovik banerjee on 11/06/24.
//

import SwiftUI
import MapKit

struct PredatorMap: View {
    
    let predators = Predators()
    @State var position: MapCameraPosition
    @State var satellite = false
    
    var body: some View {
        Map(position: $position ) {
            ForEach( predators.apexPredators) {
                predator in Annotation(predator.name, coordinate: predator.location) {
                    Image( predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .shadow( color: .white, radius: 3)
                        .scaleEffect(x: -1)
                }
            }
        }
        .mapStyle(satellite ? .imagery(elevation: .realistic) : .standard(elevation: .realistic))
        .overlay( alignment: .bottomTrailing) {
            Button{
                satellite.toggle()
            } label: {
                Image( systemName: satellite ? "globe.americas.fill" : "globe.americas")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .padding(3)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 7))
                    .shadow(radius: 3)
                    .padding()
            }
        }
        .toolbarBackground(.automatic)
        
    }
}

#Preview {
    PredatorMap(position: .camera(MapCamera(centerCoordinate: Predators().apexPredators[2].location, distance: 1000, heading: 250, pitch: 80)))
        .preferredColorScheme( .dark)
}
