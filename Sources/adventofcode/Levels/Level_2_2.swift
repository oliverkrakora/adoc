//
//  File.swift
//  
//
//  Created by Oliver Krakora on 04.12.22.
//

import Foundation

class Level_2_2: Level_2_1 {

    override func score(for round: Level_2_1.Round) -> Int {
        var round = round

        switch round.me {
        case .rock:
            round.me = Move.allCases.first(where: { $0 < round.player }) ?? .rock
        case .paper:
            round.me = round.player
        case .scissors:
            round.me = Move.allCases.first(where: { $0 > round.player }) ?? .scissors
        }

        return super.score(for: round)
    }
}
