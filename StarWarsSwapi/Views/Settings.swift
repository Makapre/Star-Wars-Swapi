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
    @Environment(\.dismiss) private var dismiss

    private var segmentCurrency = ["Credits", "Euro"]

    var body: some View {
        NavigationStack {
            List {
                Section("Comparrison object") {
                    Text("Which object to compare with?")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Picker("Which object to compare with?", selection: $segmentSelectionComparisson) {
                        ForEach(ComparisonPlanets.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Currency") {
                    Text("Which currency to use?")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Picker("Which currency to use?", selection: $segmentSelectionCurrency) {
                        ForEach(segmentCurrency, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
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
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
            }
            .navigationTitle("Preferences")
            .presentationDetents([.large])
            .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    Settings()
}
