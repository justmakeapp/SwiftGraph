//
//  ConstructorsPerformanceTests.swift
//  SwiftGraphTests
//
//  Copyright (c) 2018 Ferran Pujol Camins
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

@testable import SwiftGraph
import XCTest

class ConstructorsPerformanceTests: XCTestCase {
    struct AnyEquatable<T: Equatable>: Equatable, Codable {
        let value: T
    }

    func testPathUnweightedGraphConstructor() {
        measure {
            _ = UnweightedGraph.withPath(Array(1 ... 999_999))
        }
    }

    func testCycleUnweightedGraphConstructor() {
        measure {
            _ = UnweightedGraph.withCycle(Array(1 ... 999_999))
        }
    }

    func testPathUnweightedUniqueElementsGraphConstructor() {
        let array = Array(1 ... 2999).map { AnyEquatable(value: $0) }
        measure {
            _ = UnweightedUniqueElementsGraph.withPath(array)
        }
    }

    func testPathUnweightedUniqueElementsGraphHashableConstructor() {
        measure {
            _ = UnweightedUniqueElementsGraph<Int>.withPath(Array(1 ... 2999))
        }
    }

    func testCycleUnweightedUniqueElementsGraphConstructor() {
        measure {
            _ = UnweightedUniqueElementsGraph.withCycle(Array(1 ... 2999))
        }
    }

    func testCycleUniqueElementsHashableConstructor() {
        let array = Array(1 ... 2999).map { AnyEquatable(value: $0) }
        measure {
            _ = UnweightedUniqueElementsGraph.withCycle(array)
        }
    }

    func testStarGraphConstructor() {
        measure {
            _ = StarGraph.build(withCenter: 0, andLeafs: Array(1 ... 999_999))
        }
    }

    func testCompleteGraphConstructor() {
        measure {
            _ = CompleteGraph.build(withVertices: Array(0 ... 1999))
        }
    }
}
