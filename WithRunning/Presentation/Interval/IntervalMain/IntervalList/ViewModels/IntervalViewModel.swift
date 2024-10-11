//
//  IntervalViewModel.swift
//  WithRunning
//
//  Created by 김미진 on 10/8/24.
//

import Foundation

struct IntervalMainViewModelActions {
    let showIntervalDetail: (IntervalCos) -> Void
}

protocol IntervalMainViewModelInput {
    func viewDidLoad()
    
    func didSelectItem(at index: Int)
}

protocol IntervalMainViewModelOutput {
    var items: Observable<[IntervalMainItemViewModel]> { get } /// Also we can calculate view model items on demand:  https://github.com/kudoleh/iOS-Clean-Architecture-MVVM/pull/10/files
//    var loading: Observable<MoviesListViewModelLoading?> { get }
    var query: Observable<String> { get }
    var error: Observable<String> { get }
    var isEmpty: Bool { get }
    var screenTitle: String { get }
    var emptyDataTitle: String { get }
    var errorTitle: String { get }
    var searchBarPlaceholder: String { get }
}

typealias IntervalMainViewModel = IntervalMainViewModelInput & IntervalMainViewModelOutput

final class DefaultIntervalMainViewModel: IntervalMainViewModel {
    
    private let actions: IntervalMainViewModelActions?
    private let mainQueue: DispatchQueueType
    
    private var intervalList: [IntervalCos] = []
    
    // MARK: - OUTPUT

    let items: Observable<[IntervalMainItemViewModel]> = Observable([])
//    let loading: Observable<MoviesListViewModelLoading?> = Observable(.none)
    let query: Observable<String> = Observable("")
    let error: Observable<String> = Observable("")
    var isEmpty: Bool { return items.value.isEmpty }
    let screenTitle = NSLocalizedString("Movies", comment: "")
    let emptyDataTitle = NSLocalizedString("Search results", comment: "")
    let errorTitle = NSLocalizedString("Error", comment: "")
    let searchBarPlaceholder = NSLocalizedString("Search Movies", comment: "")
    
    init(
        actions: IntervalMainViewModelActions? = nil,
        mainQueue: DispatchQueueType = DispatchQueue.main
    ) {
        self.actions = actions
        self.mainQueue = mainQueue
    }

    
    func viewDidLoad() {
        
    }
    
    func didSelectItem(at index: Int) {
        actions?.showIntervalDetail(intervalList[index])
    }
}
