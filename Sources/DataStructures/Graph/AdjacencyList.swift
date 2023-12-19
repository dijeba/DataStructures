//
//  AdjacencyList.swift
//
//
//  Created by Diego Jerez Barroso on 18/12/2023.
//

import Foundation

open class AdjacencyList<T: Hashable>: Graphable {

    // MARK: - Typealias

    typealias Element = T

    // MARK: - Public variables

    public var adjacencyDict: [Vertex<T>: [Edge<T>]] = [:]

    // MARK: - Public

    @discardableResult
    public func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(data: data)

        if adjacencyDict[vertex] == nil {
            adjacencyDict[vertex] = []
        }

        return vertex
    }

    @discardableResult
    public func add(vertex: Vertex<T>) -> Vertex<T> {
        if adjacencyDict[vertex] == nil {
            adjacencyDict[vertex] = []
        }

        return vertex
    }

    public func add(_ type: EdgeType, from source: Vertex<T>, to destination: Vertex<T>, weight: Double? = nil) {
        switch type {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(vertices: (source, destination), weight: weight)
        }
    }
    
    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        guard let edges = edges(from: source) else {
            return nil
        }

        return edges.first { $0.destination == destination }?.weight
    }

    public func edges(from source: Vertex<T>) -> [Edge<T>]? {
        adjacencyDict[source]
    }

    // MARK: - Private

    private func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        assert(adjacencyDict[source] != nil, "Verify the edge has been inserted")
        adjacencyDict[source]?.append(edge)
    }

    private func addUndirectedEdge(vertices: (Vertex<Element>, Vertex<Element>), weight: Double?) {
        let (source, destination) = vertices
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
}

// MARK: - CustomStringConvertible protocol implementation

extension AdjacencyList {

    var description: CustomStringConvertible {
        var result = ""

        for (vertex, edges) in adjacencyDict {
            var edgeString = ""

            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }

            result.append("\(vertex) ---> [ \(edgeString) ] \n ")
        }

        return result
    }
}
