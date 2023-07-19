//
//  PlanetsViewModel.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import Foundation
import Alamofire

class PlanetsViewModel: ObservableObject {
    @Published var planets: [Planet] = []

    init() {
        fetchPlanets()
    }

    func fetchPlanets() {
        AF.request("https://swapi.dev/api/planets/")
            .validate()
            .responseDecodable(of: Planets.self) { response in
                guard let res = response.value else { return }
                self.planets = res.results
            }
    }
}
