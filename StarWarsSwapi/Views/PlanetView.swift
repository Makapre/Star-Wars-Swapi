//
//  PlanetView.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import SwiftUI

func getDiameter(for planet: ComparisonPlanets) -> Double {
    switch planet {
    case .earth:
        return 12742
    case .moon:
        return 3474
    case .sun:
        return 1392700
    }
}

struct PlanetView: View {
    @AppStorage("comparisonPlanet") private var comparisonPlanet = ComparisonPlanets.earth

    var planet: Planet

    var body: some View {
        List {
            Section(header: Text(planet.name)) {
                Circle()
                    .stroke(Color.accentColor, lineWidth: 2)
                    .frame(width: 100, height: 100)
                HStack {
                    Text("Diameter")
                    Spacer()
                    Text(planet.diameter)
                        .foregroundColor(.red)
                }
            }
            Section(header: Text(comparisonPlanet.rawValue)) {
                Circle()
                    .stroke(Color.accentColor, lineWidth: 2)
                    .frame(width: 100 * getRelation(planetDiameter: planet.diameter), height: 100 * getRelation(planetDiameter: planet.diameter))
                HStack {
                    Text("Diameter")
                    Spacer()
                    Text(String(Int(getDiameter(for: comparisonPlanet))))
                        .foregroundColor(.red)
                }
            }
        }
        .navigationTitle(planet.name)
    }

    func getRelation(planetDiameter: String) -> Double {
        let pDiameter = (Double(planetDiameter) ?? 1.0)
        let cDiameter = getDiameter(for: comparisonPlanet)
        return cDiameter / pDiameter
    }
}

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView(planet: Planet(name: "Earth", diameter: "10000"))
    }
}
