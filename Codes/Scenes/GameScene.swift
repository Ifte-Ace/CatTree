//
//  GameScene.swift
//  CatTreeAlpha
//
//  Created by Ifte Alam on 10/29/24.
//

import SpriteKit

class GameScene: SKScene {
    weak var context: GameContext?
    private var currentCat: CatNode?
    
    init(context: GameContext, size: CGSize) {
        self.context = context
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = .white
        addBase()
        spawnCat()
    }
    
    func addBase() {
        let baseNode = StackBaseNode()
        baseNode.position = context?.layoutInfo.basePosition ?? CGPoint.zero
        addChild(baseNode)
    }
    
    func spawnCat() {
        let cat = CatNode()
        cat.position = context?.layoutInfo.catStartPosition ?? CGPoint(x: size.width / 2, y: size.height - 50)
        addChild(cat)
        currentCat = cat
        cat.moveLeftRight()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentCat?.stopMovement()
        if let cat = currentCat, let context = context {
            if cat.position.x.isApproximatelyEqual(to: context.layoutInfo.stackCenter.x) {
                context.updateScore()
                spawnCat()  // Spawn next cat if stacked successfully
            } else {
                context.addStrike()
            }
        }
    }
}
