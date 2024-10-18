//
//  IntervalUnit.swift
//  WithRunning
//
//  Created by 김미진 on 10/11/24.
//

import Foundation

struct IntervalUnit: Equatable, Identifiable {
    typealias Identifier = String
    let id: Identifier
    let title: String?
    let timeInSeconds: Int
    let speed: Int // 1~10

    // 분과 초를 반환하는 헬퍼 메서드
    func formattedTime() -> String {
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        return "\(minutes)분 \(seconds)초"
    }
}

struct IntervalCourse: Equatable, Identifiable {
    typealias Identifier = String
    let id: Identifier
    let title: String?
    let oneTrack: [IntervalUnit]
}
