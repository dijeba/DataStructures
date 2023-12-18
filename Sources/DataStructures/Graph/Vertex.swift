//
//  Vertex.swift
//
//
//  Created by Diego Jerez Barroso on 18/12/2023.
//

import Foundation

public struct Vertex<T: Hashable> {
    var data: T
}

extension Vertex: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine("\(data)".hashValue)
    }
}

extension Vertex: CustomStringConvertible {
    
    public var description: String {
        "\(data)"
    }
}
