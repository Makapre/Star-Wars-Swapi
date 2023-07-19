//
//  Planets.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import SwiftUI
import Alamofire

struct PlanetsView: View {
    @ObservedObject var viewModel = PlanetsViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.planets.isEmpty {
                    ProgressView()
                } else {
                    List {
                        ForEach(viewModel.planets, id: \.self) { planet in
                            NavigationLink(destination: PlanetView(planet: planet)) {
                                Text(planet.name)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Planets")
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

struct Planets_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsView()
    }
}
