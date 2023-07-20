//
//  ContentView.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PeopleView()
                .tabItem {
                    Label("People", systemImage: "person.circle")
                }
            PlanetsView()
                .tabItem {
                    Label("Planets", systemImage: "moon.stars.circle")
                }
            StarshipsView()
                .tabItem {
                    Label("Starships", systemImage: "airplane.circle")
                }
        }
    }
}
