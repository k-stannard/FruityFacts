//
//  DetailViewModel.swift
//  FruityFacts
//
//  Created by Koty Stannard on 5/19/22.
//

import Foundation

struct DetailViewModel {
    let name: String
    let family: String
    let genus: String
    let id: Int
    let order: String
    let nutritions: Nutritions
    
    init(fruit: Fruit) {
        self.name = fruit.name
        self.family = fruit.family
        self.genus = fruit.genus
        self.id = fruit.id
        self.order = fruit.order
        self.nutritions = fruit.nutritions
    }
}
