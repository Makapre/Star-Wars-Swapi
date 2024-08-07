//
//  Starships.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import SwiftUI
import Alamofire

struct StarshipsView: View {
    @ObservedObject var viewModel = StarshipsViewModel()
    @State private var showSheet = false
    @AppStorage("timedOutStarships") private var isTimedOutStarships: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                if isTimedOutStarships {
                    NoInternetView(action: viewModel.fetchStarships)
                } else {
                    if viewModel.starships.isEmpty {
                        ProgressView()
                    } else {
                        List {
                            ForEach(viewModel.starships, id: \.self) { starship in
                                NavigationLink(destination: StarshipView(starship: starship)) {
                                    HStack {
                                        Text(starship.name)
                                        Spacer()
                                        if starship.hyperdriveRating != "unknown" {
                                            Text(starship.hyperdriveRating)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Starships")
            .sheet(isPresented: $showSheet) {
                Settings()
            }
            .toolbar {
                Button {
                    showSheet.toggle()
                } label: {
                    Image(systemName: "gear")
                }
            }
        }
    }
}

#Preview {
    StarshipsView()
}
