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

struct Character: Codable, Hashable {
    var name: String
    var birthYear: String
    var gender: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case gender = "gender"
        case birthYear = "birth_year"
    }
}
