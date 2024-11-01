//
//  GameOverState.swift
//  Test
//
//  Created by Ifte Alam on 10/31/24.
//


import GameplayKit

class GameOverState: GKState {
    weak var context: TTGameContext?
    
    init(context: TTGameContext) {
        self.context = context
    }

    override func didEnter(from previousState: GKState?) {
        // Show Game Over UI
        context?.gameScene?.showGameOverMenu()
    }

    override func willExit(to nextState: GKState) {
        // Hide Game Over UI
        context?.gameScene?.hideGameOverMenu()
    }
}
