//
//  Edge.swift
//
//
//  Created by Diego Jerez Barroso on 18/12/2023.
//

import Foundation

public enum EdgeType {
    case directed
    case undirected
}

public struct Edge<T: Hashable> {
    public var source: Vertex<T>
    public var destination: Vertex<T>
    public let weight: Double?

    init(source: Vertex<T>, destination: Vertex<T>, weight: Double? = 0) {
        self.source = source
        self.destination = destination
        self.weight = weight
    }
}

extension Edge: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine("\(source)\(destination)\(String(describing: weight))".hashValue)
    }
}
