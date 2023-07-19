//
//  Planets.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import SwiftUI
import Alamofire

struct PlanetsView: View {
    @AppStorage("planets") private var planets = 0

    var body: some View {
        NavigationView {
            VStack {
                Text(String(planets))
            }
            .toolbar {
                Button {
                    print("pressed")
                } label: {
                    Image(systemName: "gear")
                }
            }
        }
    }
}

struct Planets_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsView()
    }
}
