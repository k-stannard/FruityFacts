//
//  DetailViewController.swift
//  FruityFacts
//
//  Created by Koty Stannard on 5/19/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    let detailFruitView = DetailFruitView()

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension DetailViewController {
    func style() {

    }
    
    func layout() {
        detailFruitView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailFruitView)
        
        NSLayoutConstraint.activate([
            detailFruitView.topAnchor.constraint(equalTo: view.topAnchor),
            detailFruitView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailFruitView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailFruitView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
