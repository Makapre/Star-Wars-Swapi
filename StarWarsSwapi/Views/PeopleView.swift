//
//  People.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import SwiftUI
import Alamofire

struct PeopleView: View {
    @AppStorage("people") private var people = 0

    var body: some View {
        NavigationView {
            VStack {
                Text(String(people))
            }
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
