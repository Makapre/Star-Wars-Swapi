//
//  Dashboard.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import SwiftUI
import Alamofire

struct Dashboard: View {
    @AppStorage("people") private var peopleStorage = 0
    @AppStorage("vehicles") private var vehiclesStorage = 0
    @AppStorage("films") private var filmsStorage = 0
    @AppStorage("species") private var speciesStorage = 0
    @AppStorage("starships") private var starshipsStorage = 0
    @AppStorage("planets") private var planetsStorage = 0

    @ObservedObject var viewModel: ViewModel

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            VStack {
                LazyVGrid(columns: columns) {
                    CountCard(count: peopleStorage, title: "People")
                    CountCard(count: vehiclesStorage, title: "Vehicles")
                    CountCard(count: speciesStorage, title: "Species")
                    CountCard(count: starshipsStorage, title: "Starships")
                    CountCard(count: planetsStorage, title: "Planets")
                }
                List {
                    if filmsStorage > 0 {
                        ForEach(1...filmsStorage, id: \.self) { film in
                            Text(String(film))
                        }
                    }
                }
                .scrollDisabled(true)
            }
            .toolbar {
                Button {
                    print("pressed")
                } label: {
                    Image(systemName: "gear")
                }
            }
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ViewModel()
        Dashboard(viewModel: viewModel)
    }
}
