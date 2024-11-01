//
//  ActiveGameState.swift
//  Test
//
//  Created by Ifte Alam on 10/31/24.
//


import GameplayKit

class ActiveGameState: GKState {
    weak var context: TTGameContext?
    
    init(context: TTGameContext) {
        self.context = context
    }

    override func didEnter(from previousState: GKState?) {
        // Start game logic
        context?.gameScene?.startGame()
    }
    
    override func willExit(to nextState: GKState) {
        // Pause or clean up game logic
    }
}
