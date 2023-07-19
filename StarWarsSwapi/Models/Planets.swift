//
//  Planets.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import Foundation

struct Planets: Codable {
    var count: Int
    var results: [Planet]
}

struct Planet: Codable {
    var name: String
    var diameter: String
}
