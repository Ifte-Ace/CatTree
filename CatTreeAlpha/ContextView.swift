//
//  ContextView.swift
//  CatTreeAlpha
//
//  Created by Ifte Alam on 10/29/24.
//
import SwiftUI
import SpriteKit

struct ContentView: View {
    var body: some View {
        SpriteKitContainer()
            .ignoresSafeArea() // Makes the game fill the entire screen
    }
}

struct SpriteKitContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> SKView {
        let view = SKView()

        // Load the GameScene and set its scale mode
        if let scene = GameScene(fileNamed: "GameScene") {
            scene.scaleMode = .aspectFill
            view.presentScene(scene)
        }

        // Optional: Configure the SKView
        view.ignoresSiblingOrder = true
        view.showsFPS = true
        view.showsNodeCount = true

        return view
    }

    func updateUIView(_ uiView: SKView, context: Context) {}
}
