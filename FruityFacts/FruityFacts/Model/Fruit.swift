//
//  Fruit.swift
//  FruityFacts
//
//  Created by Koty Stannard on 1/16/22.
//

import Foundation

struct Fruit: Decodable {
    
    var genus: String
    var name: String
    var id: Int
    var family: String
    var order: String
    var nutritions: Nutritions
}

struct Nutritions: Decodable {
    
    var carbohydrates: Double
    var protein: Double
    var fat: Double
    var calories: Int
    var sugar: Double
}
