//
//  Settings.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import SwiftUI

struct Settings: View {
    @State private var segmentSelectionComparisson = ComparisonPlanets.earth
    @State private var segmentSelectionCurrency = "Credits"
    @AppStorage("comparisonPlanet") private var comparisonPlanet = ComparisonPlanets.earth
    @AppStorage("currency") private var currency = "Credits"
    
    @Environment(\.openURL) var openURL

    private var segmentCurrency = ["Credits", "Euro"]

    var body: some View {
        List {
            Section("Comparrison object") {
                Text("Which object to compare with?")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Picker("Which object to compare with?", selection: $segmentSelectionComparisson) {
                    ForEach(ComparisonPlanets.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .padding()
                .pickerStyle(.segmented)
            }
            .padding(.top)
            
            Section("Currency") {
                Text("Which currency to use?")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Picker("Which currency to use?", selection: $segmentSelectionCurrency) {
                    ForEach(segmentCurrency, id: \.self) {
                        Text($0)
                    }
                }
                .padding()
                .pickerStyle(.segmented)
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
            }
            
            Section("Info") {
                Text("Developed as a Coding challenge by Marius Preikschat")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Api used [swapi.dev](https://swapi.dev/documentation#root)")
                    .tint(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            if let url = URL(string: "https://github.com/Makapre/Star-Wars-Swapi") {
                Button {
                    openURL(url)
                } label: {
                    Label("Github repository", systemImage: "square.and.arrow.up")
                        .foregroundStyle(.link)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .onAppear {
            segmentSelectionComparisson = comparisonPlanet
            segmentSelectionCurrency = currency
        }
        .onDisappear {
            comparisonPlanet = segmentSelectionComparisson
            currency = segmentSelectionCurrency
        }
    }
}

#Preview {
    Settings()
}
