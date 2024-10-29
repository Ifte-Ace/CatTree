//
//  GameOverState.swift
//  CatTreeAlpha
//
//  Created by Ifte Alam on 10/29/24.
//

import GameplayKit

class GameOverState: GKState {
    weak var context: GameContext?
    
    init(context: GameContext) {
        self.context = context
    }
    
    override func didEnter(from previousState: GKState?) {
        print("Game Over")
        // Handle game over screen display here
    }
}
