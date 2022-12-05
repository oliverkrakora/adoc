//
//  File.swift
//  
//
//  Created by Oliver Krakora on 05.12.22.
//

import Foundation
import adocutils

class Level_3_2: Level_3_1 {

    override func commonItems(in compartments: [String]) -> [Character] {
        var sets = compartments.map { Set($0) }
        var commonItemSet = sets.removeFirst()

        for set in sets {
            commonItemSet.formIntersection(set)
        }
        return Array(commonItemSet)
    }

    override func solve(input: URL) async throws -> LosslessStringConvertible {
        var sum = 0
        var rucksacks = [String]()
        for try await line in input.allLines {
            rucksacks.append(line)

            if rucksacks.count == 3 {
                let commonItems = self.commonItems(in: rucksacks)
                let priorities = self.priorities(for: commonItems)
                sum += priorities
                rucksacks.removeAll()
            }
        }
        return sum
    }
}
