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
    private let defaultCircleDiameter: CGFloat = 100

    var planet: Planet

    var relationToPlanet: CGFloat {
        getRelation(planetDiameter: planet.diameter)
    }

    var comparisonCircleDiameter: CGFloat {
        defaultCircleDiameter * relationToPlanet
    }

    var body: some View {
        List {
            Section(header: Text(planet.name)) {
                Circle()
                    .stroke(Color.accentColor, lineWidth: 2)
                    .frame(width: defaultCircleDiameter, height: defaultCircleDiameter)
                HStack {
                    Text("Diameter")
                    Spacer()
                    Text(planet.diameter)
                        .foregroundColor(.red)
                }
            }
            Section(header: Text(comparisonPlanet.rawValue)) {
                if relationToPlanet > 4 {
                    Text("way too big")
                        .foregroundColor(.yellow)
                } else {
                    Circle()
                        .stroke(Color.accentColor, lineWidth: 2)
                        .frame(width: comparisonCircleDiameter, height: comparisonCircleDiameter)
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

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView(planet: Planet(name: "Test Planet", diameter: "3000"))
    }
}
