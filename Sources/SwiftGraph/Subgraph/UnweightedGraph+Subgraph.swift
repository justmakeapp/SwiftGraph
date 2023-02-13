//
//  File.swift
//  
//
//  Created by Bình Nguyễn Thanh on 13/02/2023.
//

import Foundation
import DequeModule

public extension UnweightedGraph where V: Hashable {
    private struct TempEdge<V: Hashable>: Hashable {
        let src: V
        let dest: V
        let directed: Bool
    }

    func getSubgraphStartAtVertices(_ vertices: [V]) -> UnweightedGraph<V> {
        let startVertices = Set(self.vertices).intersection(vertices)
        guard startVertices.count > 0, Set(self.vertices).count == self.vertexCount else {
            return .init(vertices: [])
        }

        let verticesToIndexes = [V: Int](uniqueKeysWithValues: self.vertices.enumerated().map { ($1, $0) })

        var queue: Deque<V> = Deque(startVertices)
        var visited: Set<V> = []
        var newEdges: Set<TempEdge<V>> = []

        while let currentVertex = queue.popFirst() {
            guard !visited.contains(currentVertex) else {
                continue
            }

            visited.insert(currentVertex)
            guard let currentIndex = verticesToIndexes[currentVertex] else {
                continue
            }

            let children = self.edges[currentIndex].map { self.vertices[$0.v] }
            queue.append(contentsOf: children)
            newEdges
                .formUnion(self.edges[currentIndex]
                    .map { TempEdge(src: currentVertex, dest: self.vertices[$0.v], directed: $0.directed) })
        }

        let newVertices = Array(visited)
        let newVerticesToIndexes = [V: Int](uniqueKeysWithValues: newVertices.enumerated().map { ($1, $0) })

        let resultGraph = UnweightedGraph(vertices: newVertices)
        newEdges.forEach { edge in
            guard let srcIndex = newVerticesToIndexes[edge.src], let destIndex = newVerticesToIndexes[edge.dest] else {
                return
            }
            resultGraph.addEdge(fromIndex: srcIndex, toIndex: destIndex, directed: edge.directed)
        }

        return resultGraph
    }

    func getSubgraphStartAtVertices(where condition: (V) -> Bool) -> UnweightedGraph<V> {
        let startVertices = self.vertices.filter(condition)
        return getSubgraphStartAtVertices(startVertices)
    }
}
