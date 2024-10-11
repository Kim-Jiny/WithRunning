//
//  IntervalListTableViewController.swift
//  WithRunning
//
//  Created by 김미진 on 10/11/24.
//

import Foundation
import UIKit

final class IntervalListTableViewController: UITableViewController {
    
    var viewModel: IntervalMainViewModel!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension IntervalListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: IntervalListItemCell.reuseIdentifier,
            for: indexPath
        ) as? IntervalListItemCell else {
            assertionFailure("Cannot dequeue reusable cell \(IntervalListItemCell.self) with reuseIdentifier: \(IntervalListItemCell.reuseIdentifier)")
            return UITableViewCell()
        }

        cell.fill(with: viewModel.items.value[indexPath.row])

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.isEmpty ? tableView.frame.height : super.tableView(tableView, heightForRowAt: indexPath)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItem(at: indexPath.row)
    }
}
