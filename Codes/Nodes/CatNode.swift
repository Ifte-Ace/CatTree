//
//  CatNode.swift
//  CatTreeAlpha
//
//  Created by Ifte Alam on 10/29/24.
//

import SpriteKit

class CatNode: SKSpriteNode {
    private var moveAction: SKAction?
    
    init() {
        let texture = SKTexture(imageNamed: "cat")  // Use a cat image
        super.init(texture: texture, color: .clear, size: texture.size())
        setupPhysics()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPhysics() {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.isDynamic = false
    }
    
    func moveLeftRight() {
        moveAction = SKAction.repeatForever(SKAction.sequence([
            SKAction.moveTo(x: 0, duration: 1),
            SKAction.moveTo(x: UIScreen.main.bounds.width, duration: 1)
        ]))
        run(moveAction!)
    }
    
    func stopMovement() {
        removeAction(forKey: "move")
    }
}
