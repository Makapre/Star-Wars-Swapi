//
//  Films.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import Foundation

struct Films: Codable {
    var count: Int
    var results: [Film]
}

struct Film: Codable {
    var title: String
    var releaseDate: String
}
