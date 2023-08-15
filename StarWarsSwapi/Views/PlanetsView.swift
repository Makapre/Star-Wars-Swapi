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
    @State private var showSheet = false

    var body: some View {
        NavigationStack {
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
            .sheet(isPresented: $showSheet) {
                Settings()
            }
            .toolbar {
                Button {
                    showSheet.toggle()
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
