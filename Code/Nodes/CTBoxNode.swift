//
//  CTBoxNode.swift
//  CatTree
//
//  Created by Ifte Alam on 10/24/24.
//


import SpriteKit

class CTBoxNode:SKNode {
    var box: SKShapeNode = SKShapeNode()
    func setup(screenSize: CGSize, layoutInfo: CTLayoutInfo){
        let boxNode = SKShapeNode(rect: .init(origin: .zero, size: layoutInfo.boxSize), cornerRadius: 8.0)
        boxNode.fillColor=.redaddChild(boxNode)
        box = boxNode
    }
}
