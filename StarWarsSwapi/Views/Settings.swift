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

    var segmentCurrency = ["Credits", "Euro"]

    var body: some View {
        VStack {
            Text("Which object to compare with?")
            Picker("Which object to compare with?", selection: $segmentSelectionComparisson) {
                ForEach(ComparisonPlanets.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .padding()
            .pickerStyle(.segmented)

            Text("Which currency to use?")
            Picker("Which currency to use?", selection: $segmentSelectionCurrency) {
                ForEach(segmentCurrency, id: \.self) {
                    Text($0)
                }
            }
            .padding()
            .pickerStyle(.segmented)
            .presentationDetents([.medium])
            .presentationDragIndicator(.visible)
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

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
