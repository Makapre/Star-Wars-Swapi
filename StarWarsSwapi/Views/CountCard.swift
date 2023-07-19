//
//  CountCard.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 19.07.23.
//

import SwiftUI

struct CountCard: View {
    var count: Int
    var title: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.gray)
            VStack {
                VStack {
                    Text(String(count))
                    Text(title)
                }
            }
            .padding(5)
        }
        .padding()
    }
}

struct CountCard_Previews: PreviewProvider {
    static var previews: some View {
        CountCard(count: 0, title: "test title")
    }
}
