import UIKit

struct Fruit: Codable {
    var genus, name: String
    var id: Int
    var family, order: String
    var nutritions: Nutritions
}

struct Nutritions: Codable {
    var carbohydrates, protein, fat: Double
    var calories: Int
    var sugar: Double
}

let url = URL(string: "https://www.fruityvice.com/api/fruit/all")!

URLSession.shared.dataTask(with: url) { data, response, error in
    guard let data = data, error == nil else {
        print(error?.localizedDescription)
        return
    }
    
    guard let _ = response else {
        fatalError("response error")
    }

    do {
        var fruit = [Fruit]()
        let decoder = JSONDecoder()
        fruit = try decoder.decode([Fruit].self, from: data)
        print(fruit[0].name)
    } catch let error as NSError {
        print(error)
    }
    
}.resume()
