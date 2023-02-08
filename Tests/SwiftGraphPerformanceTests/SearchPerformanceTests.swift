//
//  SearchPerformanceTests.swift
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

class SearchPerformanceTests: XCTestCase {
    let starGraph = StarGraph.build(withCenter: 0, andLeafs: Array(1 ... 99999))
    let pathGraph = UnweightedGraph.withPath(Array(0 ... 99999))
    let completeGraph = CompleteGraph.build(withVertices: Array(0 ... 2499))

    // MARK: With Goal Test

    func testDfsInStarGraphWithGoalTest() {
        measure {
            _ = starGraph.dfs(from: 0, goalTest: { _ in false })
        }
    }

    func testDfsInStarGraphWithGoalTestByIndex() {
        measure {
            _ = starGraph.dfs(fromIndex: 0, goalTest: { _ in false })
        }
    }

    func testBfsInStarGraphWithGoalTest() {
        measure {
            _ = starGraph.bfs(from: 0, goalTest: { _ in false })
        }
    }

    func testBfsInStarGraphWithGoalTestByIndex() {
        measure {
            _ = starGraph.bfs(fromIndex: 0, goalTest: { _ in false })
        }
    }

    func testDfsInPathWithGoalTest() {
        measure {
            _ = pathGraph.dfs(from: 0, goalTest: { _ in false })
        }
    }

    func testDfsInPathWithGoalTestByIndex() {
        measure {
            _ = pathGraph.dfs(fromIndex: 0, goalTest: { _ in false })
        }
    }

    func testBfsInPathWithGoalTest() {
        measure {
            _ = pathGraph.bfs(from: 0, goalTest: { _ in false })
        }
    }

    func testBfsInPathWithGoalTestByIndex() {
        measure {
            _ = pathGraph.bfs(fromIndex: 0, goalTest: { _ in false })
        }
    }

    func testDfsInCompleteGraphWithGoalTest() {
        measure {
            _ = completeGraph.dfs(from: 0, goalTest: { _ in false })
        }
    }

    func testDfsInCompleteGraphWithGoalTestByIndex() {
        measure {
            _ = completeGraph.dfs(fromIndex: 0, goalTest: { _ in false })
        }
    }

    func testBfsInCompleteGraphWithGoalTest() {
        measure {
            _ = completeGraph.bfs(from: 0, goalTest: { _ in false })
        }
    }

    func testBfsInCompleteGraphWithGoalTestByIndex() {
        measure {
            _ = completeGraph.bfs(fromIndex: 0, goalTest: { _ in false })
        }
    }

    // MARK: To vertex

    func testDfsInStarGraph() {
        measure {
            _ = starGraph.dfs(from: starGraph.vertices.first!, to: starGraph.vertices.last!)
        }
    }

    func testDfsInStarGraphByIndex() {
        measure {
            _ = starGraph.dfs(fromIndex: 0, toIndex: starGraph.vertexCount - 1)
        }
    }

    func testBfsInStarGraph() {
        measure {
            _ = starGraph.bfs(from: starGraph.vertices.first!, to: starGraph.vertices.last!)
        }
    }

    func testBfsInStarGraphByIndex() {
        measure {
            _ = starGraph.bfs(fromIndex: 0, toIndex: starGraph.vertexCount - 1)
        }
    }

    func testDfsInPath() {
        measure {
            _ = pathGraph.dfs(from: 0, to: pathGraph.vertices.last!)
        }
    }

    func testDfsInPathByIndex() {
        measure {
            _ = pathGraph.dfs(fromIndex: 0, toIndex: pathGraph.vertexCount - 1)
        }
    }

    func testBfsInPath() {
        measure {
            _ = pathGraph.bfs(from: 0, to: pathGraph.vertices.last!)
        }
    }

    func testBfsInPathByIndex() {
        measure {
            _ = pathGraph.bfs(fromIndex: 0, toIndex: pathGraph.vertexCount - 1)
        }
    }
}
