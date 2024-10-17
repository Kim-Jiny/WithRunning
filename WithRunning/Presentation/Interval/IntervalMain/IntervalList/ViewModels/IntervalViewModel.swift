//
//  IntervalViewModel.swift
//  WithRunning
//
//  Created by 김미진 on 10/8/24.
//

import Foundation

struct IntervalMainViewModelActions {
    let showIntervalDetail: (IntervalCourse) -> Void
}

protocol IntervalMainViewModelInput {
    func viewDidLoad()
    
    func didSelectItem(at index: Int)
}

protocol IntervalMainViewModelOutput {
    var items: Observable<[IntervalMainItemViewModel]> { get } /// Also we can calculate view model items on demand:  https://github.com/kudoleh/iOS-Clean-Architecture-MVVM/pull/10/files
//    var loading: Observable<MoviesListViewModelLoading?> { get }
    var error: Observable<String> { get }
    var isEmpty: Bool { get }
    var screenTitle: String { get }
    var errorTitle: String { get }
}

typealias IntervalMainViewModel = IntervalMainViewModelInput & IntervalMainViewModelOutput

final class DefaultIntervalMainViewModel: IntervalMainViewModel {
    
    private let getIntervalCourseUseCase: GetIntervalCourseUseCase
    private let actions: IntervalMainViewModelActions?
    private let mainQueue: DispatchQueueType
    
    private var intervalList: [IntervalCourse] = []
    private var intervalListLoadTask: Cancellable? { willSet { intervalListLoadTask?.cancel() } }
    
    // MARK: - OUTPUT

    let items: Observable<[IntervalMainItemViewModel]> = Observable([])
//    let loading: Observable<MoviesListViewModelLoading?> = Observable(.none)
    let error: Observable<String> = Observable("")
    var isEmpty: Bool { return items.value.isEmpty }
    let screenTitle = NSLocalizedString("Interval List", comment: "")
    let errorTitle = NSLocalizedString("Error", comment: "")
    
    // MARK: - Init
    
    init(
        getIntervalCourseUseCase: GetIntervalCourseUseCase,
        actions: IntervalMainViewModelActions? = nil,
        mainQueue: DispatchQueueType = DispatchQueue.main
    ) {
        self.getIntervalCourseUseCase = getIntervalCourseUseCase
        self.actions = actions
        self.mainQueue = mainQueue
    }

    // MARK: - Private
    
    private func load() {
        intervalListLoadTask = getIntervalCourseUseCase.execute(
            completion: { [weak self] result in
                self?.mainQueue.async {
                    switch result {
                    case .success(let courses):
                        self?.fetchList(courses)
                    case .failure(let error):
                        self?.handle(error: error)
                }
            }
        })
    }
    
    private func fetchList(_ courses: [IntervalCourse]) {
        items.value = courses.map(IntervalMainItemViewModel.init)
        intervalList = courses
    }
    
    
    private func handle(error: Error) {
        self.error.value = NSLocalizedString("Failed get data", comment: "")
    }
}

// MARK: - INPUT. View event methods

extension DefaultIntervalMainViewModel {
    
    func viewDidLoad() {
        load()
    }
    
    func didSelectItem(at index: Int) {
        actions?.showIntervalDetail(intervalList[index])
    }
}
