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
    @AppStorage("timedOutPeople") private var isTimedOutPeople: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                if isTimedOutPeople {
                    NoInternetView(action: viewModel.fetchPeople)
                } else {
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

#Preview {
    PeopleView()
}
