//
//  CharacterView.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import SwiftUI

struct CharacterView: View {
    var character: Character

    var body: some View {
        List {
            Section(header: Text("General")) {
                HStack {
                    Text("Name")
                    Spacer()
                    Text(character.name)
                }
                HStack {
                    Text("Birthday year")
                    Spacer()
                    Text(character.birthYear)
                }
            }
            Section(header: Text("Gender")) {
                Text(character.gender)
                switch character.gender {
                case "male":
                    Text("♂")
                case "female":
                    Text("♀")
                default:
                    Text("🤖")
                }
            }
        }
        .navigationTitle(character.name)
    }
}

#Preview {
    CharacterView(character: Character(name: "Marius", birthYear: "1993", gender: "Male"))
}
