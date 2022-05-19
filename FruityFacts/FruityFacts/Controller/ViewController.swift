//
//  ViewController.swift
//  FruityFacts
//
//  Created by Koty Stannard on 1/16/22.
//

import UIKit

class ViewController: UIViewController {

    var fruits = [Fruit]()
    var fruitViewModels = [FruitViewModel]()
    var detailViewModels = [DetailViewModel]()
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        fetchData()
    }
}

extension ViewController {
    
    fileprivate func setup() {
        view.backgroundColor = .systemBackground
        
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(FruitCell.self, forCellReuseIdentifier: FruitCell.reuseid)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !fruitViewModels.isEmpty else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: FruitCell.reuseid, for: indexPath) as! FruitCell
        let fruit = fruitViewModels[indexPath.row]
        cell.configure(with: fruit)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = DetailViewController()
        let fruit = detailViewModels[indexPath.item]
        detailController.detailFruitView.configureDetailView(with: fruit)
        present(detailController, animated: true, completion: nil)
    }
}

extension ViewController {
    
    func fetchData() {
        NetworkService.shared.fetchFruit { result in
            switch result {
            case .success(let fruit):
                self.fruits = fruit
                DispatchQueue.main.async {
                    self.configureTableCells(with: fruit)
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func configureTableCells(with fruits: [Fruit]) {
        fruitViewModels = fruits.map {
            FruitViewModel(fruit: $0)
        }
        
        detailViewModels = fruits.map {
            DetailViewModel(fruit: $0)
        }
    }
}
