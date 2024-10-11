//
//  GetIntervalCourseUseCase.swift
//  WithRunning
//
//  Created by 김미진 on 10/11/24.
//

import Foundation

protocol GetIntervalCourseUseCase {
    func execute(
        completion: @escaping (Result<[IntervalCourse], Error>) -> Void
    ) -> Cancellable?
}

final class DefaultGetIntervalCourseUseCase: GetIntervalCourseUseCase {

    private let intervalCourseRepository: IntervalCourseRepository

    init(
        intervalCourseRepository: IntervalCourseRepository
    ) {

        self.intervalCourseRepository = intervalCourseRepository
    }

    func execute(
        completion: @escaping (Result<[IntervalCourse], Error>) -> Void
    ) -> Cancellable? {

        return intervalCourseRepository.fetchIntervalCourseList(completion: { result in
            completion(result)
        })
    }
}
