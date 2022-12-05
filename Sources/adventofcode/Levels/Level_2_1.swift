//
//  File.swift
//  
//
//  Created by Oliver Krakora on 04.12.22.
//

import Foundation
import adocutils

class Level_2_1: Level {

    enum Move: Equatable, Comparable, Hashable, CaseIterable {
        case rock
        case paper
        case scissors

        var score: Int {
            switch self {
            case .rock: return 1
            case .paper: return 2
            case .scissors: return 3
            }
        }

        static func < (lhs: Move, rhs: Move) -> Bool {
            switch (lhs, rhs) {
            case (.rock, .rock):
                return false
            case (.rock, .scissors):
                return false
            case (.rock, .paper):
                return true
            case (.paper, .paper):
                return false
            case (.paper, .rock):
                return false
            case (.paper, .scissors):
                return true
            case (.scissors, .scissors):
                return false
            case (.scissors, .rock):
                return true
            case (.scissors, .paper):
                return false
            }
        }
    }

    struct Round {
        var player: Move
        var me: Move
    }

    required init() {}

    func score(for round: Round) -> Int {
        if round.player < round.me {
            return 6 + round.me.score
        } else if round.me == round.player {
            return 3 + round.me.score
        } else {
            return round.me.score
        }
    }

    func move(for string: String) -> Move {
        if string == "A" {
            return .rock
        } else if string == "B" {
            return .paper
        } else if string == "C" {
            return .scissors
        } else if string == "X" {
            return .rock
        } else if string == "Y" {
            return .paper
        } else {
            return .scissors
        }
    }

    func solve(input: URL) async throws -> LosslessStringConvertible {
        var score: Int = 0

        for try await line in input.allLines {
            let moves = line.components(separatedBy: .whitespacesAndNewlines)
            guard moves.count == 2 else { continue }
            guard let move = moves.first.flatMap(move(for:)), let move1 = moves.last.flatMap(move(for:)) else { continue }
            let round = Round(player: move, me: move1)
            score += self.score(for: round)
        }
        return score
    }
}
