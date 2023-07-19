//
//  Peoples.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import Foundation

struct People: Codable {
    var count: Int
    var next: String?
    var results: [Character]
}

struct Character: Codable {
    var name: String
}
