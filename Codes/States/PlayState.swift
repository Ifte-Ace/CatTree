//
//  PlayState.swift
//  CatTreeAlpha
//
//  Created by Ifte Alam on 10/29/24.
//

import GameplayKit

class PlayState: GKState {
    weak var context: GameContext?
    
    init(context: GameContext) {
        self.context = context
    }
    
    override func didEnter(from previousState: GKState?) {
        print("Game is now playing")
    }
}
