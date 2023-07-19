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

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.starships.isEmpty {
                    ProgressView()
                } else {
                    List {
                        ForEach(viewModel.starships, id: \.self) { starship in
                            NavigationLink(destination: StarshipView(starship: starship)) {
                                Text(starship.name)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Starships")
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

struct Starships_Previews: PreviewProvider {
    static var previews: some View {
        StarshipsView()
    }
}
