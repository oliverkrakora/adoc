//
//  File.swift
//  
//
//  Created by Oliver Krakora on 05.12.22.
//

import Foundation
import adocutils

class Level_4_2: Level_4_1 {

    override func fullOverlapCount(in ranges: [ClosedRange<Int>]) -> Int {
        let sets = ranges.map { Set($0) }

        var count = 0
        for set in zip(sets, sets.dropFirst()) {
            count += set.0.intersection(set.1).isEmpty ? 0 : 1
        }
        return count
    }
}
