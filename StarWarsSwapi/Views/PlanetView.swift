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
    private let defaultCircleDiameter: CGFloat = UIScreen.main.bounds.width / 3

    var planet: Planet

    var comparisonCircleDiameter: CGFloat {
        defaultCircleDiameter * getRelation(planetDiameter: planet.diameter)
    }

    var body: some View {
        List {
            Section(header: Text(planet.name)) {
                PlanetCircleView(radius: defaultCircleDiameter)
                HStack {
                    Text("Diameter")
                    Spacer()
                    Text(planet.diameter)
                        .foregroundColor(.red)
                }
            }
            Section(header: Text(comparisonPlanet.rawValue)) {
                if comparisonCircleDiameter > UIScreen.main.bounds.width * 0.8 {
                    Text("way too big")
                        .foregroundColor(.yellow)
                } else {
                    PlanetCircleView(radius: comparisonCircleDiameter)
                }
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
        guard let pDiameter = Double(planetDiameter), pDiameter > 0 else { return 1.0 }
        let cDiameter = getDiameter(for: comparisonPlanet)
        return cDiameter / pDiameter
    }
}

#Preview("Normal") {
    PlanetView(planet: Planet(name: "Test Planet", diameter: "10000"))
}

#Preview("Too big") {
    PlanetView(planet: Planet(name: "Test Planet", diameter: "3000"))
}
