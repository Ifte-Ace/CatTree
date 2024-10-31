//
//  TTGameIdle.swift
//  Test
//
//  Created by Ifte Alam 10/31/24.
//

import GameplayKit

class TTGameIdleState: GKState {
    weak var scene: TTGameScene?
    weak var context: TTGameContext?
    
    init(scene: TTGameScene, context: TTGameContext) {
        self.scene = scene
        self.context = context
        super.init()
    }

    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return true
    }
    
    override func didEnter(from previousState: GKState?) {
        print("did enter idle state")
    }
    
    func handleTouch(_ touch: UITouch) {
        guard let scene else { return }
        
        // Stop swaying and "stack" the box in place
        scene.stackBlock()
    }
}
