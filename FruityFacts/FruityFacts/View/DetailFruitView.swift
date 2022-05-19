//
//  DetailViewController.swift
//  FruityFacts
//
//  Created by Koty Stannard on 5/16/22.
//

import UIKit

class DetailFruitView: UIView {
    
    var detailFruitViewModel = [DetailViewModel]()
    
    let stackView = UIStackView()
    let nameLabel = UILabel()
    let familyLabel = UILabel()
    let genusLabel = UILabel()
    let orderLabel = UILabel()
    let idLabel = UILabel()
    
    let nutritionStack = UIStackView()
    let carbLabel = UILabel()
    let fatLabel = UILabel()
    let proteinLabel = UILabel()
    let calorieLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailFruitView {
    func style() {
        backgroundColor = .white
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.axis = .vertical
        
        [nameLabel, familyLabel, genusLabel, orderLabel, idLabel, nutritionStack].forEach { label in
            stackView.addArrangedSubview(label)
        }
        
        nutritionStack.axis = .horizontal
        nutritionStack.alignment = .center
        nutritionStack.distribution = .fillProportionally
        nutritionStack.spacing = 10
        
        [calorieLabel, carbLabel, fatLabel, proteinLabel].forEach { label in
            nutritionStack.addArrangedSubview(label)
        }
        
        addSubview(stackView)
    }
    
    func layout() {
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configureDetailView(with viewModel: DetailViewModel) {
        nameLabel.text = "Name: " + viewModel.name
        familyLabel.text = "Family: " + viewModel.family
        genusLabel.text = "Genus: " + viewModel.genus
        orderLabel.text = "Order: " + viewModel.order
        idLabel.text = "Id: \(viewModel.id)"
        
        calorieLabel.text = "Cals: \(viewModel.nutritions.calories)"
        carbLabel.text = "Carbs: \(viewModel.nutritions.carbohydrates)"
        fatLabel.text = "Fats: \(viewModel.nutritions.fat)"
        proteinLabel.text = "Protein: \(viewModel.nutritions.protein)"
    }
}
