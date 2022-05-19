//
//  NetworkService.swift
//  FruityFacts
//
//  Created by Koty Stannard on 5/19/22.
//

import Foundation

enum NetworkError: Error {
    case serverError
    case decodingError
}

class NetworkService {
    static let shared = NetworkService()
    
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
