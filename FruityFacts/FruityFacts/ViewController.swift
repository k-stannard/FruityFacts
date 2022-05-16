//
//  ViewController.swift
//  FruityFacts
//
//  Created by Koty Stannard on 1/16/22.
//

import UIKit

class ViewController: UIViewController {

    var fruits = [Fruit]()
    var fruitViewModels = [FruitCell.ViewModel]()
    
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
        let fruit = fruitViewModels[indexPath.row]
        print(fruit.name)
        let cell = tableView.dequeueReusableCell(withIdentifier: FruitCell.reuseid, for: indexPath) as! FruitCell
        cell.configure(with: fruit)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController {
    
    func fetchData() {
        fetchFruit { result in
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
            FruitCell.ViewModel(name: $0.name, family: $0.family, genus: $0.genus, id: $0.id, order: $0.order)
        }
    }
}

class FruitCell: UITableViewCell {
    
    struct ViewModel {
        let name: String
        let family: String
        let genus: String
        let id: Int
        let order: String
    }
    
    let viewModel: ViewModel? = nil
    
    let nameLabel = UILabel()
    let familyLabel = UILabel()
    let genusLabel = UILabel()
    let orderLabel = UILabel()
    let idLabel = UILabel()
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
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension FruitCell {
    
    func setup() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.axis = .vertical
        
        [nameLabel, familyLabel, genusLabel, orderLabel, idLabel].forEach { label in
            label.text = "Placeholder text"
            stackView.addArrangedSubview(label)
        }
        
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
    
    func configure(with viewModel: ViewModel) {
        nameLabel.text = "Name: " + viewModel.name
        familyLabel.text = "Family: " + viewModel.family
        genusLabel.text = "Genus: " + viewModel.genus
        orderLabel.text = "Order: " + viewModel.order
        idLabel.text = "Id: \(viewModel.id)"
    }
}
