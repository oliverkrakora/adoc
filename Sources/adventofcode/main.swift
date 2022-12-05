//
//  File.swift
//  
//
//  Created by Oliver Krakora on 01.12.22.
//

import Foundation
import adocutils

let cookie = try Bundle.module.url(forResource: "cookie", withExtension: nil)
    .flatMap { try Data(contentsOf: $0) }
    .flatMap { String(data: $0, encoding: .utf8) }!

let client = ADOCClient(config: .init(sessionToken: cookie, year: 2022))
let levelRunner = LevelRunner(client: client)
//levelRunner.solveAll(bundle: Bundle.module)
try await levelRunner.solve(level: Level_4_2())
