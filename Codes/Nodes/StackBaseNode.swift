//
//  StackBaseNode.swift
//  CatTreeAlpha
//
//  Created by Ifte Alam on 10/29/24.
//

import SpriteKit

class StackBaseNode: SKSpriteNode {
    init() {
        let texture = SKTexture(imageNamed: "base")  // Use a base image
        super.init(texture: texture, color: .clear, size: texture.size())
        setupPhysics()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPhysics() {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.isDynamic = false
    }
}
