//
//  Settings.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import SwiftUI

struct Settings: View {
    @State private var segmentSelectionComparisson = "Earth"
    @State private var segmentSelectionCurrency = "Credits"
    @AppStorage("diameter") private var diameter = "Earth"
    @AppStorage("currency") private var currency = "Credits"

    var segmentsComparisson = ["Earth", "Moon", "Sun"]
    var segmentCurrency = ["Credits", "Euro"]

    var body: some View {
        VStack {
            Text("Which object to compare with?")
            Picker("Which object to compare with?", selection: $segmentSelectionComparisson) {
                ForEach(segmentsComparisson, id: \.self) {
                    Text($0)
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
            segmentSelectionComparisson = diameter
            segmentSelectionCurrency = currency
        }
        .onDisappear {
            diameter = segmentSelectionComparisson
            currency = segmentSelectionCurrency
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
