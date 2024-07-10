//
//  NoInternetView.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 09.07.24.
//

import SwiftUI

struct NoInternetView: View {
    var action: () -> Void

    var body: some View {
        VStack {
            ContentUnavailableView("Wifi", systemImage: "wifi.exclamationmark", description: Text("No internet available!"))
            Button {
                action()
            } label: {
                Label("reload", systemImage: "arrow.clockwise")
            }
            .buttonStyle(.borderedProminent)
            .tint(.accentColor)
            .padding(.bottom)
        }
    }
}

#Preview {
    NoInternetView {}
}
