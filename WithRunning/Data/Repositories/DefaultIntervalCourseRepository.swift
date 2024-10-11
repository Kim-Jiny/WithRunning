//
//  DefaultIntervalCosRepository.swift
//  WithRunning
//
//  Created by 김미진 on 10/11/24.
//

import Foundation

final class DefaultIntervalCourseRepository {
    init() { }
}

extension DefaultIntervalCourseRepository: IntervalCourseRepository {
    
    func fetchIntervalCourseList(
        completion: @escaping (Result<[IntervalCourse], Error>) -> Void
    ) -> Cancellable? {
        
        let task = RepositoryTask()
        
        //  MARK: - 추후 통신이 추가해야함.
        let sampleIntervalUnits: [IntervalUnit] = [
            IntervalUnit(id: "1", title: "Run", timeInSeconds: 300),  // 5분 뛰기
            IntervalUnit(id: "2", title: "Rest", timeInSeconds: 120), // 2분 쉬기
            IntervalUnit(id: "3", title: "Run", timeInSeconds: 360),  // 6분 뛰기
            IntervalUnit(id: "4", title: "Rest", timeInSeconds: 120), // 2분 쉬기
            IntervalUnit(id: "5", title: "Run", timeInSeconds: 420)   // 7분 뛰기
        ]

        let sampleIntervalCourse = IntervalCourse(id: "course1", title: "Interval Training", oneTrack: sampleIntervalUnits)
        completion(.success([sampleIntervalCourse]))
        
        return task
    }
}
