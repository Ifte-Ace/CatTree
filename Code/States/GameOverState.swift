//
//  GameOverState.swift
//  Test
//
//  Created by Ifte Alam on 11/1/24.
//


import GameplayKit

class GameOverState: GKState {
    weak var scene: TTGameScene?
    
    init(scene: TTGameScene) {
        self.scene = scene
        super.init()
    }

    override func didEnter(from previousState: GKState?) {
        print("Entered GameOverState")
        scene?.showGameOverLabel() // Display "Game Over" label
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == StartState.self // Allow restarting the game
    }
}
