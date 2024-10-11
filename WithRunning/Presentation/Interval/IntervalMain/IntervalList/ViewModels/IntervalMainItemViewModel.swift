//
//  IntervalMainItemViewModel.swift
//  WithRunning
//
//  Created by 김미진 on 10/8/24.
//

import Foundation

struct IntervalMainItemViewModel: Equatable {
    let title: String
}

extension IntervalMainItemViewModel {

    init(course: IntervalCourse) {
        self.title = course.title ?? "unnkown"
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()
