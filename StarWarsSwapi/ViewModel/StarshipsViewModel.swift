//
//  StarshipsViewModel.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import Foundation
import Alamofire

class StarshipsViewModel: ObservableObject {
    @Published var starships: [Starship] = []

    init() {
        fetchStarships()
    }

    func fetchStarships() {
        AF.request("https://swapi.dev/api/starships/")
            .validate()
            .responseDecodable(of: Starships.self) { response in
                guard let res = response.value else { return }
                self.starships = res.results
            }
    }
}
