//
//  File.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import Foundation
import SwiftUI
import Alamofire

class ViewModel: ObservableObject {
    @AppStorage("people") private var peopleStorage = 0
    @AppStorage("vehicles") private var vehiclesStorage = 0
    @AppStorage("films") private var filmsStorage = 0
    @AppStorage("species") private var speciesStorage = 0
    @AppStorage("starships") private var starshipsStorage = 0
    @AppStorage("planets") private var planetsStorage = 0
    @AppStorage("lastFetch") private var lastFetch = Date.now.timeIntervalSince1970

    let dayInSeconds: Double = 86400

    init() {
        fetchAll()
    }

    func fetchAll() {
//        if lastFetch < Date.now.timeIntervalSince1970 - dayInSeconds {
        if true {
            AF.request("https://swapi.dev/api/people/")
                .validate()
                .responseDecodable(of: People.self) { [self] response in
                    guard let res = response.value else { return }
                    peopleStorage = res.count
                }
            AF.request("https://swapi.dev/api/vehicles/")
                .validate()
                .responseDecodable(of: Vehicles.self) { response in
                    guard let res = response.value else { return }
                    self.vehiclesStorage = res.count
                }
            AF.request("https://swapi.dev/api/films/")
                .validate()
                .responseDecodable(of: Films.self) { response in
                    guard let res = response.value else { return }
                    self.filmsStorage = res.count
                }
            AF.request("https://swapi.dev/api/species/")
                .validate()
                .responseDecodable(of: Species.self) { response in
                    guard let res = response.value else { return }
                    self.speciesStorage = res.count
                }
            AF.request("https://swapi.dev/api/starships/")
                .validate()
                .responseDecodable(of: Starships.self) { response in
                    guard let res = response.value else { return }
                    self.starshipsStorage = res.count
                }
            AF.request("https://swapi.dev/api/planets/")
                .validate()
                .responseDecodable(of: Planets.self) { response in
                    guard let res = response.value else { return }
                    self.planetsStorage = res.count
                }
        }
    }
}
