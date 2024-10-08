//
//  IntervalMainCoordinator.swift
//  WithRunning
//
//  Created by 김미진 on 10/8/24.
//

import Foundation
import UIKit

protocol IntervalMainCoordinatorDependencies {
    func makeIntervalMainViewController(actions: IntervalMainViewModelActions) -> IntervalMainViewController
}


final class IntervalMainCoordinator {
    
    private weak var navigationController: UINavigationController?
    private let dependencies: IntervalMainCoordinatorDependencies
    
    private weak var intervalMainVC: IntervalMainViewController?
    
    init(navigationController: UINavigationController,
         dependencies: IntervalMainCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        // Note: here we keep strong reference with actions, this way this flow do not need to be strong referenced
        let actions = IntervalMainViewModelActions()
        let vc = dependencies.makeIntervalMainViewController(actions: actions)

        navigationController?.pushViewController(vc, animated: false)
        intervalMainVC = vc
    }
}
