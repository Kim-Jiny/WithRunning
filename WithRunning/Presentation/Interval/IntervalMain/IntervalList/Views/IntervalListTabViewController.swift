//
//  IntervalListTabViewController.swift
//  WithRunning
//
//  Created by 김미진 on 10/8/24.
//

import UIKit

class IntervalListTabViewController: UIViewController, StoryboardInstantiable {
    
    var viewModel: IntervalMainViewModel?
    
    @IBOutlet weak var listTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        if let viewModel = viewModel {
            bind(to: viewModel)
        }
        // Do any additional setup after loading the view.
    }

    private func setupTableView() {
        listTableView.dataSource = self
        listTableView.delegate = self
        listTableView.rowHeight = UITableView.automaticDimension
        listTableView.estimatedRowHeight = 44.0
        
        listTableView.register(UINib(nibName: IntervalListItemCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: IntervalListItemCell.reuseIdentifier)
    }
    
    private func bind(to viewModel: IntervalMainViewModel) {
        viewModel.items.observe(on: self) { [weak self] _ in self?.updateItems() }
    }
    
    private func updateItems() {
        self.listTableView.reloadData()
    }
}

extension IntervalListTabViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.items.value.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: IntervalListItemCell.reuseIdentifier,
            for: indexPath
        ) as? IntervalListItemCell, let viewModel = viewModel else {
            assertionFailure("Cannot dequeue reusable cell \(IntervalListItemCell.self) with reuseIdentifier: \(IntervalListItemCell.reuseIdentifier)")
            return UITableViewCell()
        }

        cell.fill(with: viewModel.items.value[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (viewModel?.isEmpty ?? true) ? tableView.frame.height : UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didSelectItem(at: indexPath.row)
    }
}
