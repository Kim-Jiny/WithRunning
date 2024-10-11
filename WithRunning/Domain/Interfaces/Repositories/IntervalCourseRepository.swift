//
//  IntervalCourseRepository.swift
//  WithRunning
//
//  Created by 김미진 on 10/11/24.
//

import Foundation

protocol IntervalCourseRepository {
    @discardableResult
    func fetchIntervalCourseList(
        completion: @escaping (Result<[IntervalCourse], Error>) -> Void
    ) -> Cancellable?
}
