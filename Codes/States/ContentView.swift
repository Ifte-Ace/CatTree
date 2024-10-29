//
//  ContentView.swift
//  CatTreeAlpha
//
//  Created by Ifte Alam on 10/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GameSceneView(context: GameContext(screenSize: UIScreen.main.bounds.size))
            .edgesIgnoringSafeArea(.all) // Optional: makes the game view full screen
    }
}
