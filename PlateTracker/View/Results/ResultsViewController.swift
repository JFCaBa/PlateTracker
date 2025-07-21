//
//  ResultsViewController.swift
//  PlateTracker
//
//  Created by Jose on 21/07/2025.
//

import Combine
import UIKit
import CoreLocation

final class ResultsViewController: UIViewController {
    
    private let tableView = UITableView()
    private var viewModel: ResultsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Results"
        view.backgroundColor = .systemBackground
        setupTableView()
    }
    
    func configure(with scanViewModel: ScanViewModel) {
        viewModel = ResultsViewModel(scanViewModel: scanViewModel)
        viewModel.$records
            .receive(on: RunLoop.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &subscriptions)
    }
    
    private var subscriptions = Set<AnyCancellable>()
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
}

extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let record = viewModel.records[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .short
        let date = dateFormatter.string(from: record.timestamp)
        cell.textLabel?.text = "\(record.plate) | \(date) | \(record.location.latitude), \(record.location.longitude)"
        return cell
    }
}
