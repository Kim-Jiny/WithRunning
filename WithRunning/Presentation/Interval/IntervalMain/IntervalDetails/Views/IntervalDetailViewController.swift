//
//  IntervalDetailViewController.swift
//  WithRunning
//
//  Created by 김미진 on 10/11/24.
//

import UIKit

class IntervalDetailViewController: UIViewController, XibInstantiable {
    

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
    }

}
