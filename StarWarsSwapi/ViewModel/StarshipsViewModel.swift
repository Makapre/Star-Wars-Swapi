//
//  StarshipsViewModel.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import SwiftUI
import Alamofire

class StarshipsViewModel: ObservableObject {
    @Published var starships: [Starship] = []
    @AppStorage("timedOutStarships") private var isTimedOutStarships: Bool = false

    init() {
        fetchStarships()
    }

    func fetchStarships() {
        isTimedOutStarships = false

        AF.request("https://swapi.dev/api/starships/") {
            $0.timeoutInterval = 15
        }
            .validate()
            .responseDecodable(of: Starships.self) { [weak self] response in
                guard let self else { return }
                if response.error != nil {
                    isTimedOutStarships = true
                }
                guard let res = response.value else { return }
                self.starships = res.results
            }
    }
}
