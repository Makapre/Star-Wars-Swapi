//
//  Starships.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import SwiftUI
import Alamofire

struct StarshipsView: View {
    @AppStorage("starships") private var starships = 0

    var body: some View {
        NavigationView {
            VStack {
                Text(String(starships))
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

struct Starships_Previews: PreviewProvider {
    static var previews: some View {
        StarshipsView()
    }
}
