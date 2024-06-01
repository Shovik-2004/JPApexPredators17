//
//  Predators.swift
//  JPApexPredators17
//
//  Created by shovik banerjee on 01/06/24.
//

import Foundation

class Predators{
    var apexPredators: [ApexPredator] = []
    
    func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json"){
            do {
                let data = try Data( contentsOf: url)
            } catch{
                print("Error decoding JSON data: \(error)")
            }
        }
    }
}
