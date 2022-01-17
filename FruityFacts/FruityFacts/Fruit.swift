//
//  Fruit.swift
//  FruityFacts
//
//  Created by Koty Stannard on 1/16/22.
//

import Foundation

enum NetworkError: Error {
    case serverError
    case decodingError
}

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

extension ViewController {
    func fetchFruit(completion: @escaping (Result<[Fruit], NetworkError>) -> Void) {
        let url = URL(string: "https://www.fruityvice.com/api/fruit/all")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.serverError))
                return
            }
            
            do {
                let fruit = try JSONDecoder().decode([Fruit].self, from: data)
                completion(.success(fruit))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
