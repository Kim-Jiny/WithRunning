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
    let time: Int
}

struct IntervalCos: Equatable, Identifiable {
    typealias Identifier = String
    let id: Identifier
    let title: String?
    let oneTrack: [IntervalUnit]
}
