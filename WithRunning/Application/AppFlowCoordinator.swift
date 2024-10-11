//
//  AppFlowCoordinator.swift
//  WithRunning
//
//  Created by 김미진 on 10/8/24.
//

import Foundation
import UIKit

final class AppFlowCoordinator {

    var navigationController: UINavigationController
    
    init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
    }

    func start() {
        let flow = makeIntervalMainCoordinator(navigationController: navigationController)
        flow.start()
    }
    
    func makeIntervalMainCoordinator(navigationController: UINavigationController) -> IntervalMainCoordinator {
        IntervalMainCoordinator(navigationController: navigationController, dependencies: self)
    }
}

extension AppFlowCoordinator: IntervalMainCoordinatorDependencies {
    
    func makeIntervalMainViewController(actions: IntervalMainViewModelActions) -> IntervalMainViewController {
        IntervalMainViewController.create(with: makeIntervalMainViewModel(actions: actions))
    }
    
    func makeIntervalMainViewModel(actions: IntervalMainViewModelActions) -> IntervalMainViewModel {
        DefaultIntervalMainViewModel(
            actions: actions
        )
    }
    
    func makeIntervalDetailsViewController(cos: IntervalCos) -> IntervalDetailViewController {
        IntervalDetailViewController.create(with: makeMoviesDetailsViewModel(cos: cos))
    }
    
    
    func makeMoviesDetailsViewModel(cos: IntervalCos) -> IntervalDetailViewModel {
        DefaultIntervalDetailViewModel(cos: cos)
    }
}
