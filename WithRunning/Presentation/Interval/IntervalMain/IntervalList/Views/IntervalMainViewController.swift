//
//  IntervalMainViewController.swift
//  WithRunning
//
//  Created by 김미진 on 10/8/24.
//

import Foundation
import UIKit

class IntervalMainViewController: UITabBarController, StoryboardInstantiable {
    
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
    }
    
    // MARK: - Private

    private func setupViews() {
        // 각 ViewController를 xib에서 불러오기
        let firstVC = IntervalListTabViewController.instantiateViewController(from: UIStoryboard(name: "IntervalMainViewController", bundle: nil))
        firstVC.tabBarItem = UITabBarItem(title: "First", image: UIImage(systemName: "1.circle"), tag: 0)
        firstVC.viewModel = viewModel
        let secondVC = MypageTabViewController.instantiateViewController(from: UIStoryboard(name: "IntervalMainViewController", bundle: nil))
        secondVC.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "2.circle"), tag: 1)
        secondVC.viewModel = viewModel
        let thirdVC = MyHistoryTabViewController.instantiateViewController(from: UIStoryboard(name: "IntervalMainViewController", bundle: nil))
        thirdVC.tabBarItem = UITabBarItem(title: "third", image: UIImage(systemName: "3.circle"), tag: 2)
        thirdVC.viewModel = viewModel
        
        // 뷰 컨트롤러들을 탭 바에 추가
        self.viewControllers = [firstVC, secondVC, thirdVC]
        self.tabBar.tintColor = .intervalTabTint
    }

    private func setupBehaviours() {
        addBehaviors([BackButtonEmptyTitleNavigationBarBehavior(),
                      BlackStyleNavigationBarBehavior()])
    }
    
    private func updateItems() {
        print("success get main\(viewModel.items.value)")
        
    }
}
