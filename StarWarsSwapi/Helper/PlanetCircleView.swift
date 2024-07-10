//
//  PlanetCircleView.swift
//  StarWarsSwapi
//
//  Created by Marius Preikschat on 09.07.24.
//

import SwiftUI

struct PlanetCircleView: View {
    let radius: CGFloat

    var body: some View {
        Circle()
            .stroke(Color.accentColor, lineWidth: 2)
            .frame(width: radius)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    PlanetCircleView(radius: 200)
}
