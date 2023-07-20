//
//  StarshipView.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import SwiftUI

struct StarshipView: View {
    @AppStorage("currency") private var currency = "Credits"

    var starship: Starship

    var body: some View {
        List {
            Section(header: Text("Model")) {
                Text(starship.model)
            }
            Section(header: Text("Manufacturer")) {
                Text(starship.manufacturer)
            }
            Section(header: Text("Hyperdrive rating")) {
                Text(starship.hyperdriveRating)
            }
            Section(header: Text("Costs")) {
                if let costs = Double(starship.costInCredits) {
                    HStack {
                        Text(String((currency == "Credits" ? costs : costs * 0.89).formatted()))
                        Spacer()
                        Text(currency)
                    }
                } else {
                    Text(starship.costInCredits)
                }
            }
        }
        .navigationTitle(starship.name)
    }
}

struct StarshipView_Previews: PreviewProvider {
    static var previews: some View {
        StarshipView(starship: Starship(name: "test", model: "test", manufacturer: "test", hyperdriveRating: "6.0", costInCredits: "100"))
    }
}
