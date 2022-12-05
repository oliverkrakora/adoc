//
//  File.swift
//  
//
//  Created by Oliver Krakora on 05.12.22.
//

import Foundation
import adocutils

class Level_4_1: Level {
    required init() {}

    func sectionRanges(from string: String) -> [ClosedRange<Int>] {
        var ranges = [ClosedRange<Int>]()

        for section in string.split(separator: ",") {
            let range = section.split(separator: "-")
            guard range.count == 2 else { continue }
            guard let lb = range.first.flatMap({ Int($0) }), let ub = range.last.flatMap({ Int($0) }) else { continue }

            ranges.append(lb...ub)
        }
        return ranges
    }

    func fullOverlapCount(in ranges: [ClosedRange<Int>]) -> Int {
        let sets = ranges.map { Set($0) }

        var count = 0
        for set in zip(sets, sets.dropFirst()) {
            count += set.0.intersection(set.1).count == min(set.0.count, set.1.count) ? 1 : 0
        }
        return count
    }

    func solve(input: URL) async throws -> LosslessStringConvertible {
        var sum = 0
        for try await line in input.allLines {
            let ranges = sectionRanges(from: line)
            let overlapCount = fullOverlapCount(in: ranges)
            sum += overlapCount
        }
        return sum
    }
}
