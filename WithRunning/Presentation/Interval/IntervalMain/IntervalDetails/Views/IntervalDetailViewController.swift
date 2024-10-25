//
//  IntervalDetailViewController.swift
//  WithRunning
//
//  Created by 김미진 on 10/11/24.
//

import UIKit

class IntervalDetailViewController: UIViewController, XibInstantiable {
    

    @IBOutlet weak var timeTitleLb: UILabel!
    @IBOutlet weak var trackStackView: UIStackView!
    // MARK: - Lifecycle

    private var viewModel: IntervalDetailViewModel!
    
    static func create(with viewModel: IntervalDetailViewModel) -> IntervalDetailViewController {
        let view = IntervalDetailViewController.instantiateViewController()
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bind(to: viewModel)
    }


    private func bind(to viewModel: IntervalDetailViewModel) {
        
    }
    
    // MARK: - Private
    
    private func setupViews() {
        title = viewModel.title
        view.accessibilityIdentifier = AccessibilityIdentifier.intervalDetailsView
        timeTitleLb.text = formattedTime()
        
        // 전체 시간 계산
        let totalTimeInSeconds = viewModel.oneTrack.reduce(0) { $0 + $1.timeInSeconds }
        // 각 interval에 대한 비율에 맞는 뷰 생성
        for unit in viewModel.oneTrack {
            let widthRatio = CGFloat(unit.timeInSeconds) / CGFloat(totalTimeInSeconds)

            // 각 unit에 대한 뷰 생성
            let unitView = IntervalSpeedView()
            trackStackView.addArrangedSubview(unitView)
            unitView.setUpSpeedView(unit)
            
            unitView.snp.makeConstraints {
                $0.width.equalToSuperview().multipliedBy(widthRatio)
            }
            
            
            trackStackView.addArrangedSubview(UIView())
        }
        
        
    }
    
    // 분과 초를 반환하는 헬퍼 메서드
    func formattedTime() -> String {
        let totalTimeInSeconds = viewModel.oneTrack.reduce(0) { $0 + $1.timeInSeconds }
        let minutes = totalTimeInSeconds / 60
        let seconds = totalTimeInSeconds % 60
        var returnText = ""
        if minutes != 0 {
            returnText += "\(minutes)분"
        }
        returnText += " \(seconds)초"
        return returnText
    }
}
