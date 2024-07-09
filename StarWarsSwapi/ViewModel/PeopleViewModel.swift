//
//  PeopleViewModel.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import SwiftUI
import Alamofire

class PeopleViewModel: ObservableObject {
    @Published var people: [Character] = []
    @AppStorage("timedOutPeople") private var isTimedOutPeople: Bool = false

    init() {
        fetchPeople()
    }

    func fetchPeople() {
        isTimedOutPeople = false

        AF.request("https://swapi.dev/api/people/") {
            $0.timeoutInterval = 15
        }
            .validate()
            .responseDecodable(of: People.self) { [weak self] response in
                guard let self else { return }
                if response.error != nil {
                    isTimedOutPeople = true
                }
                guard let res = response.value else { return }
                self.people = res.results
            }
    }
}
