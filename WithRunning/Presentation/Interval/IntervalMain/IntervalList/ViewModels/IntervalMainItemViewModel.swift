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
