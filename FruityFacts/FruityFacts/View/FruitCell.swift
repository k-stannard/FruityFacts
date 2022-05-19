//
//  FruitCell.swift
//  FruityFacts
//
//  Created by Koty Stannard on 5/19/22.
//

import UIKit

class FruitCell: UITableViewCell {
  
    var fruitViewModel = [FruitViewModel]()

    let nameLabel = UILabel()
    let stackView = UIStackView()
    
    static let reuseid = "FruitCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FruitCell {
    
    func setup() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.axis = .vertical
        
        stackView.addArrangedSubview(nameLabel)
        
        contentView.addSubview(stackView)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(with viewModel: FruitViewModel) {
        nameLabel.text = viewModel.name
    }
}
