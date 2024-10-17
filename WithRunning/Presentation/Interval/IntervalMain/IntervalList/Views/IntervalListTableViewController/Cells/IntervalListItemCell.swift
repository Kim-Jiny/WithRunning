//
//  IntervalListItemCell.swift
//  WithRunning
//
//  Created by 김미진 on 10/17/24.
//

import Foundation
import UIKit

final class IntervalListItemCell: UITableViewCell {

    static let reuseIdentifier = String(describing: IntervalListItemCell.self)
    static let height = CGFloat(130)

    @IBOutlet private var titleLabel: UILabel!

    private var viewModel: IntervalMainItemViewModel!
    private let mainQueue: DispatchQueueType = DispatchQueue.main

    func fill(
        with viewModel: IntervalMainItemViewModel
    ) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
    }
}
