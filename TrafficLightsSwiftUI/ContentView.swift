//
//  ContentView.swift
//  TrafficLightsSwiftUI
//
//  Created by Alexander on 20.04.2022.
//

import SwiftUI

struct ContentView: View {
    let lightIsOn = 1.0
    let lightIsOff = 0.3

    @State var whichLightIsOn = WhichLightIsOn.none

    @State var greenOpacity = 0.3
    @State var yellowOpacity = 0.3
    @State var redOpacity = 0.3

    @State var buttonText = "START"

    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack(spacing: 16) {
                LightView(color: .green, opacity: $greenOpacity)
                LightView(color: .yellow, opacity: $yellowOpacity)
                LightView(color: .red, opacity: $redOpacity)
                Spacer()
                switchButton
            }
            .padding(.vertical, 32)
        }
    }

    private var switchButton: some View {
        Button(action: switchLight) {
            Text(buttonText)
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(width: 200, height: 60)
                .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.white, lineWidth: 8))
        }
        .background(Color.accentColor)
        .cornerRadius(25)
    }

    private func switchLight() {
        switch whichLightIsOn {
        case .green:
            greenOpacity = lightIsOff
            yellowOpacity = lightIsOn
            whichLightIsOn = .yellow
        case .yellow:
            yellowOpacity = lightIsOff
            redOpacity = lightIsOn
            whichLightIsOn = .red
        case .red, .none:
            buttonText = "NEXT"
            redOpacity = lightIsOff
            greenOpacity = lightIsOn
            whichLightIsOn = .green
        }
    }
}

extension ContentView {
    enum WhichLightIsOn {
        case green
        case yellow
        case red
        case none
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
            .previewDisplayName("iPhone SE")

        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
            .previewDisplayName("iPhone 12 Pro Max")
    }
}
