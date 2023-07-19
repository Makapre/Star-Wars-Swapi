//
//  People.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import SwiftUI
import Alamofire

struct PeopleView: View {
    @ObservedObject var viewModel = PeopleViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.people.isEmpty {
                    ProgressView()
                } else {
                    List {
                        ForEach(viewModel.people, id: \.self) { character in
                            NavigationLink(destination: CharacterView(character: character)) {
                                Text(character.name)
                            }
                        }
                    }
                }
            }
            .navigationTitle("People")
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

struct People_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}
