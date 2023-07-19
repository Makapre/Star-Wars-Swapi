//
//  PeopleViewModel.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import Foundation
import Alamofire

class PeopleViewModel: ObservableObject {
    @Published var people: [Character] = []

    init() {
        fetchPeople()
    }

    func fetchPeople() {
        AF.request("https://swapi.dev/api/people/")
            .validate()
            .responseDecodable(of: People.self) { response in
                guard let res = response.value else { return }
                self.people = res.results
            }
    }
}
