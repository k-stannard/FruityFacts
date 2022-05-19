//
//  FruitViewModel.swift
//  FruityFacts
//
//  Created by Koty Stannard on 5/19/22.
//

import Foundation

struct FruitViewModel {
    let name: String
    
    // Dependency Injection
    init(fruit: Fruit) {
        self.name = fruit.name
    }
}
