//
//  GameContext.swift
//  CatTreeAlpha
//
//  Created by Ifte Alam on 10/29/24.
//

import GameplayKit
import CoreGraphics

class GameContext {
    var gameInfo = GameInfo(score: 0, strikes: 0)
    var layoutInfo: LayoutInfo
    private(set) var stateMachine: GKStateMachine?

    init(screenSize: CGSize) {
        self.layoutInfo = LayoutInfo(screenSize: screenSize)
        configureStates()
    }
    
    func configureStates() {
        stateMachine = GKStateMachine(states: [
            IdleState(context: self),
            PlayState(context: self),
            GameOverState(context: self)
        ])
        stateMachine?.enter(IdleState.self)
    }
    
    func updateScore() {
        gameInfo.score += 1
    }
    
    func addStrike() {
        gameInfo.strikes += 1
        if gameInfo.strikes >= 3 {
            stateMachine?.enter(GameOverState.self)
        }
    }
}
