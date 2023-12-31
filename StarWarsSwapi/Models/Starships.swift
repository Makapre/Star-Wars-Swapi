//
//  Starships.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import Foundation

struct Starships: Codable {
    var count: Int
    var results: [Starship]
}

struct Starship: Codable, Hashable {
    var name: String
    var model: String
    var manufacturer: String
    var hyperdriveRating: String
    var costInCredits: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case model = "model"
        case manufacturer = "manufacturer"
        case hyperdriveRating = "hyperdrive_rating"
        case costInCredits = "cost_in_credits"
    }
}
