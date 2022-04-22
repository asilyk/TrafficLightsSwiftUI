//
//  LightView.swift
//  TrafficLightsSwiftUI
//
//  Created by Alexander on 20.04.2022.
//

import SwiftUI

struct LightView: View {
    let color: Color
    let opacity: Double

    var body: some View {
        Circle()
            .foregroundColor(color)
            .opacity(opacity)
            .frame(width: 125, height: 125)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
}

struct LightView_Previews: PreviewProvider {
    static var previews: some View {
        LightView(color: .green, opacity: 1)
    }
}
