//
//  File.swift
//  
//
//  Created by Oliver Krakora on 04.12.22.
//

import XCTest
@testable import adventofcode
import adocutils
import adocutilsTests

class LevelTests: adocutilsTests.LevelTests {

    override var executableBundle: Bundle {
        Bundle.adventofcode
    }

    override var resourceBundle: Bundle {
        Bundle.module
    }
}
