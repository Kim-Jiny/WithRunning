//
//  IntervalDetailViewModel.swift
//  WithRunning
//
//  Created by 김미진 on 10/11/24.
//

import Foundation

protocol IntervalDetailViewModelInput {
    
}

protocol IntervalDetailViewModelOutput {
    var title: String { get }
}

protocol IntervalDetailViewModel: IntervalDetailViewModelInput, IntervalDetailViewModelOutput { }

final class DefaultIntervalDetailViewModel: IntervalDetailViewModel {
    
    let title: String
    private let mainQueue: DispatchQueueType
    
    init(
        course: IntervalCourse,
        mainQueue: DispatchQueueType = DispatchQueue.main
    ) {
        self.title = course.title ?? ""
        self.mainQueue = mainQueue
    }
}
