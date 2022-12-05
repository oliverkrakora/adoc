//
//  File.swift
//  
//
//  Created by Oliver Krakora on 01.12.22.
//

import Foundation
import adocutils

class Level_1_1: Level {

    required init() {}

    struct Elf {
        var calories: [Int]

        var totalCalories: Int {
            calories.reduce(into: 0, { $0 += $1 })
        }
    }

    func levelCalories(elfs: [Elf]) -> LosslessStringConvertible {
        let maxCalories = elfs.max(by: { $0.totalCalories < $1.totalCalories })?.totalCalories ?? 0
        return maxCalories
    }

    func solve(input: URL) async throws -> LosslessStringConvertible {
        var elfs = [Elf]()
        var elf = Elf(calories: [])

        for try await line in input.allLines {
            guard !line.isEmpty else {
                elfs.append(elf)
                elf = Elf(calories: [])
                continue
            }

            if let number = Int(line) {
                elf.calories.append(number)
            }
        }

        return levelCalories(elfs: elfs)
    }
}
