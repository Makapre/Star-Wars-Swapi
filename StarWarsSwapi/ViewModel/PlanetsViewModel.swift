//
//  PlanetsViewModel.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import SwiftUI
import Alamofire

class PlanetsViewModel: ObservableObject {
    @Published var planets: [Planet] = []
    @AppStorage("timedOutPlanets") private var isTimedOutPlanets: Bool = false

    init() {
        fetchPlanets()
    }

    func fetchPlanets() {
        isTimedOutPlanets = false
        
        AF.request("https://swapi.dev/api/planets/") {
            $0.timeoutInterval = 15
        }
            .validate()
            .responseDecodable(of: Planets.self) { [weak self] response in
                guard let self else { return }
                if response.error != nil {
                    isTimedOutPlanets = true
                }
                guard let res = response.value else { return }
                self.planets = res.results
            }
    }
}
