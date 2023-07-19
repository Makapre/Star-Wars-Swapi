//
//  PlanetView.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import SwiftUI

func getDiameter(dia: String) -> Double {
    switch dia {
    case "Earth":
        return 12742
    case "Moon":
        return 3474
    case "Sun":
        return 1392700
    default:
        return 1
    }
}

struct PlanetView: View {
    @AppStorage("diameter") private var diameter = ""

    var planet: Planet

    var body: some View {
        VStack {
            VStack {
                VStack {
                    Text(planet.name)
                    Circle()
                        .stroke(Color.accentColor, lineWidth: 5)
                        .frame(width: 110 * getRelation(planetDiameter: planet.diameter), height: 110 * getRelation(planetDiameter: planet.diameter))
                    Text(planet.diameter)
                        .foregroundColor(.red)
                }
                VStack {
                    Text(diameter)
                    Circle()
                        .stroke(Color.accentColor, lineWidth: 5)
                        .frame(width: 110, height: 110)
                    Text(String(Int(getDiameter(dia: diameter))))
                        .foregroundColor(.red)
                }
                .padding(.top)
            }
            .padding()
        }
    }

    func getRelation(planetDiameter: String) -> Double {
        let pDiameter = (Double(planetDiameter) ?? 1.0)
        let cDiameter = getDiameter(dia: diameter)
        return pDiameter < cDiameter ? pDiameter / cDiameter : cDiameter / pDiameter
    }
}

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView(planet: Planet(name: "Earth", diameter: "10000"))
    }
}
