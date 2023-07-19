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
                    Label("people", systemImage: "person.circle")
                }
            PlanetsView()
                .tabItem {
                    Label("planets", systemImage: "moon.stars.circle")
                }
            StarshipsView()
                .tabItem {
                    Label("starships", systemImage: "airplane.circle")
                }
        }
    }
}
