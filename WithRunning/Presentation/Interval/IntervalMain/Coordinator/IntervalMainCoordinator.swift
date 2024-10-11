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
    func makeIntervalDetailsViewController(cos: IntervalCos) -> IntervalDetailViewController
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
        let actions = IntervalMainViewModelActions(showIntervalDetail: showIntervalDetails)
        let vc = dependencies.makeIntervalMainViewController(actions: actions)
        
        // 각 ViewController를 xib에서 불러오기
        let firstVC = IntervalListTabViewController.instantiateViewController(from: UIStoryboard(name: "IntervalMainViewController", bundle: nil))
        firstVC.tabBarItem = UITabBarItem(title: "First", image: UIImage(systemName: "1.circle"), tag: 0)
        
        let secondVC = MypageTabViewController.instantiateViewController(from: UIStoryboard(name: "IntervalMainViewController", bundle: nil))
        secondVC.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "2.circle"), tag: 1)
        
        let thirdVC = MyHistoryTabViewController.instantiateViewController(from: UIStoryboard(name: "IntervalMainViewController", bundle: nil))
        thirdVC.tabBarItem = UITabBarItem(title: "third", image: UIImage(systemName: "3.circle"), tag: 2)
        
        // 뷰 컨트롤러들을 탭 바에 추가
        vc.viewControllers = [firstVC, secondVC, thirdVC]
        vc.tabBar.tintColor = .intervalTabTint
        
        navigationController?.pushViewController(vc, animated: false)
        intervalMainVC = vc
    }
    
    private func showIntervalDetails(cos: IntervalCos) {
        let vc = dependencies.makeIntervalDetailsViewController(cos: cos)
        navigationController?.pushViewController(vc, animated: true)
    }
}
