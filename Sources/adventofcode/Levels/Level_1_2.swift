//
//  File.swift
//  
//
//  Created by Oliver Krakora on 04.12.22.
//

import Foundation
import adocutils

class Level_1_2: Level_1_1 {

    override func levelCalories(elfs: [Level_1_1.Elf]) -> LosslessStringConvertible {
        let sortedByMaxCalories = elfs.sorted(by: { $0.totalCalories > $1.totalCalories })
        let sum = sortedByMaxCalories.prefix(3).reduce(into: 0, { $0 += $1.totalCalories })
        return sum
    }
}
