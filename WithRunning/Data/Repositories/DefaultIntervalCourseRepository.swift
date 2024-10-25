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
            IntervalUnit(id: "1", title: "Run", voice: "뛰자", timeInSeconds: 300, speed: 8),  // 5분 뛰기
            IntervalUnit(id: "2", title: "Rest", voice: "걷자", timeInSeconds: 120, speed: 1), // 2분 쉬기
            IntervalUnit(id: "3", title: "Run", voice: "뛰자", timeInSeconds: 360, speed: 8),  // 6분 뛰기
            IntervalUnit(id: "4", title: "Rest", voice: "걷자", timeInSeconds: 120, speed: 1), // 2분 쉬기
            IntervalUnit(id: "5", title: "Run", voice: "뛰자", timeInSeconds: 420, speed: 8)   // 7분 뛰기
        ]
        
        let sampleIntervalUnits2: [IntervalUnit] = [
            IntervalUnit(id: "1", title: "Run", voice: "뛰자", timeInSeconds: 600, speed: 8),  // 10분 뛰기
            IntervalUnit(id: "2", title: "Rest", voice: "걷자", timeInSeconds: 120, speed: 2), // 2분 쉬기
            IntervalUnit(id: "3", title: "Run", voice: "뛰자", timeInSeconds: 600, speed: 8),  // 10분 뛰기
            IntervalUnit(id: "4", title: "Rest", voice: "걷자", timeInSeconds: 120, speed: 2), // 2분 쉬기
            IntervalUnit(id: "5", title: "Run", voice: "뛰자", timeInSeconds: 900, speed: 8)   // 15분 뛰기
        ]
        
        let sampleIntervalUnits3: [IntervalUnit] = [
            IntervalUnit(id: "1", title: "Rest", voice: "시작", timeInSeconds: 3, speed: 1),  // 3초 후 시작
            IntervalUnit(id: "2", title: "Run", voice: "플랭크", timeInSeconds: 90, speed: 10), // 90초 플랭크
            IntervalUnit(id: "3", title: "Rest", voice: "숨쉬는", timeInSeconds: 20, speed: 2),  // 20초 쉬기
            IntervalUnit(id: "4", title: "Run", voice: "플랭크", timeInSeconds: 60, speed: 10), // 60초 플랭크
            IntervalUnit(id: "5", title: "Rest", voice: "숨쉬는", timeInSeconds: 20, speed: 2) ,  // 20초 쉬기
            IntervalUnit(id: "6", title: "Run", voice: "플랭크", timeInSeconds: 90, speed: 10), // 90초 플랭크
            IntervalUnit(id: "7", title: "Rest", voice: "마무리", timeInSeconds: 3, speed: 1), // 수고하셨습니다.
        ]

        let sampleIntervalCourse = IntervalCourse(id: "course1", title: "아침 러닝 코스", oneTrack: sampleIntervalUnits)
        let sampleIntervalCourse2 = IntervalCourse(id: "course2", title: "저녁 러닝 코스", oneTrack: sampleIntervalUnits2)
        let sampleIntervalCourse3 = IntervalCourse(id: "course3", title: "플랭크", oneTrack: sampleIntervalUnits3)
        completion(.success([sampleIntervalCourse, sampleIntervalCourse2, sampleIntervalCourse3]))
        
        return task
    }
}
