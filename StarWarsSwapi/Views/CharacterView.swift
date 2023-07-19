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
        VStack {
            Text(character.name)
            Text(character.gender)
            Text(character.birthYear)
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(character: Character(name: "Marius", birthYear: "1993", gender: "Male"))
    }
}
