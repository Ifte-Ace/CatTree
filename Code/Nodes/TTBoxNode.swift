//
//  TTBoxNode.swift
//  Test
//
//  Created by Ifte Alam 10/31/24.
//

import SpriteKit

class TTBoxNode: SKNode {
    var box: SKShapeNode = SKShapeNode()
    func setup(screenSize: CGSize, layoutInfo: TTLayoutInfo) {
        let boxNode = SKShapeNode(rect: .init(origin: .zero,
                                          size: layoutInfo.boxSize),
                              cornerRadius: 8.0)
        boxNode.fillColor = .red
        addChild(boxNode)
        box = boxNode
    }
}
