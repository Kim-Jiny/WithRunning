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
            getIntervalCourseUseCase: makeGetIntervalCourseUseCase(),
            actions: actions
        )
    }
    
    func makeIntervalDetailsViewController(course: IntervalCourse) -> IntervalDetailViewController {
        IntervalDetailViewController.create(with: makeMoviesDetailsViewModel(course: course))
    }
    
    
    func makeMoviesDetailsViewModel(course: IntervalCourse) -> IntervalDetailViewModel {
        DefaultIntervalDetailViewModel(course: course)
    }
    
    
    // MARK: - Use Cases
    func makeGetIntervalCourseUseCase() -> GetIntervalCourseUseCase {
        DefaultGetIntervalCourseUseCase(intervalCourseRepository: makeIntervalCourseRepository())
    }
    
    // MARK: - Repositories
    private func makeIntervalCourseRepository() -> IntervalCourseRepository {
        DefaultIntervalCourseRepository()
    }
}
