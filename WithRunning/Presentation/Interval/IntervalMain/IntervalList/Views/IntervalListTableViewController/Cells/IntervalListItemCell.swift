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
    @IBOutlet weak var trackIcon: UIImageView!
    @IBOutlet weak var speedStack: UIStackView!
    
    private var viewModel: IntervalMainItemViewModel!
    private let mainQueue: DispatchQueueType = DispatchQueue.main

    func fill(
        with viewModel: IntervalMainItemViewModel
    ) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        // 전체 시간 계산
        let totalTimeInSeconds = viewModel.oneTrack.reduce(0) { $0 + $1.timeInSeconds }
        // 각 interval에 대한 비율에 맞는 뷰 생성
        for unit in viewModel.oneTrack {
            let widthRatio = CGFloat(unit.timeInSeconds) / CGFloat(totalTimeInSeconds)

            // 각 unit에 대한 뷰 생성
            let unitView = IntervalSpeedView()
            speedStack.addArrangedSubview(unitView)
            unitView.setUpSpeedView(unit)
            
            unitView.snp.makeConstraints { 
                $0.width.equalToSuperview().multipliedBy(widthRatio)
            }
            speedStack.addArrangedSubview(UIView())
        }
    }
}
