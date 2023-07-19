//
//  StarshipView.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import SwiftUI

struct StarshipView: View {
    var starship: Starship

    var body: some View {
        VStack {
            Text(starship.name)
            Text(starship.model)
            Text(starship.manufacturer)
            Text(starship.hyperdriveRating)
        }
    }
}

struct StarshipView_Previews: PreviewProvider {
    static var previews: some View {
        StarshipView(starship: Starship(name: "test", model: "test", manufacturer: "test", hyperdriveRating: "test"))
    }
}
