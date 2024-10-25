//
//  IntervalMainItemViewModel.swift
//  WithRunning
//
//  Created by 김미진 on 10/8/24.
//

import Foundation

struct IntervalMainItemViewModel: Equatable {
    typealias Identifier = String
    let id: Identifier
    let title: String?
    let oneTrack: [IntervalUnit]
    
    // 분과 초를 반환하는 헬퍼 메서드
    func formattedTime() -> String {
        let totalTimeInSeconds = oneTrack.reduce(0) { $0 + $1.timeInSeconds }
        let minutes = totalTimeInSeconds / 60
        let seconds = totalTimeInSeconds % 60
        return "\(minutes)분 \(seconds)초"
    }
}

extension IntervalMainItemViewModel {

    init(course: IntervalCourse) {
        self.id = course.id
        self.title = course.title ?? "unnkown"
        self.oneTrack = course.oneTrack
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()
