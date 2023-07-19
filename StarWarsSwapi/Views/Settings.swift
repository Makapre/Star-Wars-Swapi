//
//  Settings.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import SwiftUI

struct Settings: View {
    @State private var segmentSelection = "Earth"
    @AppStorage("diameter") private var diameter = ""

    var segments = ["Earth", "Moon", "Sun"]

    var body: some View {
        VStack {
            Text("Which object to compare with?")
            Picker("Which object to compare with?", selection: $segmentSelection) {
                ForEach(segments, id: \.self) {
                    Text($0)
                }
            }
            .padding()
            .pickerStyle(.segmented)
            .presentationDetents([.medium])
            .presentationDragIndicator(.visible)
        }
        .onAppear {
            segmentSelection = diameter
        }
        .onDisappear {
            diameter = segmentSelection
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
