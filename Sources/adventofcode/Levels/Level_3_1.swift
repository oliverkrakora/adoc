//
//  File.swift
//  
//
//  Created by Oliver Krakora on 04.12.22.
//

import Foundation
import adocutils

class Level_3_1: Level {

    required init() {}

    func compartments(from string: String) -> [String] {
        let firstHalf = string.prefix(string.count / 2)
        let secondHalf = string.dropFirst(string.count / 2)
        return [firstHalf, secondHalf].map { "\($0)" }
    }

    func commonItems(in compartments: [String]) -> [Character] {
        let sets = compartments.map { Set($0) }
        var commonItemSet = Set<String.Element>()

        for set in sets {
            for set1 in sets where set != set1 {
                commonItemSet.formUnion(set.intersection(set1))
            }
        }
        return Array(commonItemSet)
    }

    func character(for ascii: Int) -> Character? {
        Unicode.Scalar(ascii).flatMap { Character($0) }
    }

    func priorities(for items: [Character]) -> Int {
        let priorityTableLowercase = zip(97...122, 1...26).map { (character(for: $0.0)!, $0.1) }
        let priorityTableUppercase = zip(65...90, 27...52).map { (character(for: $0.0)!, $0.1) }
        let lookupTable = Dictionary<Character, Int>(uniqueKeysWithValues: priorityTableLowercase + priorityTableUppercase)
        return items.reduce(into: 0, { $0 += lookupTable[$1] ?? 0 })
    }

    func solve(input: URL) async throws -> LosslessStringConvertible {
        var sum = 0
        for try await line in input.allLines {
            let compartments = self.compartments(from: line)
            let commonItems = self.commonItems(in: compartments)
            let priorities = self.priorities(for: commonItems)
            sum += priorities
        }
        return sum
    }
}
