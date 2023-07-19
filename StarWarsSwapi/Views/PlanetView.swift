//
//  PlanetView.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import SwiftUI

struct PlanetView: View {
    var planet: Planet

    var body: some View {
        VStack {
            Text(planet.name)
            Text(planet.diameter)
        }
    }
}

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView(planet: Planet(name: "earth", diameter: "10"))
    }
}
