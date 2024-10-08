//
//  IntervalMainViewController.swift
//  WithRunning
//
//  Created by 김미진 on 10/8/24.
//

import Foundation
import UIKit

class IntervalMainViewController: UIViewController, XibInstantiable {
    
    private var viewModel: IntervalMainViewModel!
    
    
    // MARK: - Lifecycle

    static func create(
        with viewModel: IntervalMainViewModel
    ) -> IntervalMainViewController {
        let view = IntervalMainViewController.instantiateViewController()
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBehaviours()
        bind(to: viewModel)
        viewModel.viewDidLoad()
    }
    
    private func bind(to viewModel: IntervalMainViewModel) {
        viewModel.items.observe(on: self) { [weak self] _ in self?.updateItems() }
//        viewModel.loading.observe(on: self) { [weak self] in self?.updateLoading($0) }
    }
    
    // MARK: - Private

    private func setupViews() {
        
    }

    private func setupBehaviours() {
        addBehaviors([BackButtonEmptyTitleNavigationBarBehavior(),
                      BlackStyleNavigationBarBehavior()])
    }
    
    private func updateItems() {
        
    }
}
