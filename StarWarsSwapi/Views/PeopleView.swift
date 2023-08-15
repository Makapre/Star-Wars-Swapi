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
    @State private var showSheet = false

    var body: some View {
        NavigationStack {
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

struct People_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}
