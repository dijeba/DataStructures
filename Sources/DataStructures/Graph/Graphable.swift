//
//  Graphable.swift
//
//
//  Created by Diego Jerez Barroso on 18/12/2023.
//

import Foundation

protocol Graphable {
    associatedtype Element: Hashable
    
    var description: CustomStringConvertible { get }

    @discardableResult func createVertex(data: Element) -> Vertex<Element>
    @discardableResult func add(vertex: Vertex<Element>) -> Vertex<Element>
    func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
    func edges(from source: Vertex<Element>) -> [Edge<Element>]?
}
