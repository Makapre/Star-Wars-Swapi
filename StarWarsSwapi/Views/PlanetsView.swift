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
    @AppStorage("diameter") private var diameter = ""
    @State private var showSheet = false
    @State private var segmentSelection = "Earth"

    var segments = ["Earth", "Moon", "Sun"]

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
            .sheet(isPresented: $showSheet) {
                VStack {
                    Text("Which object to compare with?")
                    Picker("Which object to compare with?", selection: $segmentSelection) {
                        ForEach(segments, id: \.self) {
                            Text($0)
                        }
                    }
                    .padding()
                    .pickerStyle(.segmented)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
                }
                .onDisappear {
                    diameter = segmentSelection
                }
            }
            .onAppear {
                segmentSelection = diameter
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
