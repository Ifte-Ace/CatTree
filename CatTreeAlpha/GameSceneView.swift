//
//  GameSceneView.swift
//  CatTreeAlpha
//
//  Created by Ifte Alam on 10/29/24.
//
import SwiftUI
import SpriteKit

struct GameSceneView: UIViewRepresentable {
    let context: GameContext
    
    func makeUIView(context: Context) -> SKView {
        let skView = SKView()
        let scene = GameScene(context: self.context, size: UIScreen.main.bounds.size)
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
        skView.ignoresSiblingOrder = true
        return skView
    }
    
    func updateUIView(_ uiView: SKView, context: Context) {
        // No need to update the view on SwiftUI state changes for now
    }
}
