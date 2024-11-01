//
//  TTGameContext.swift
//  Test
//
//  Created by Ifte Alam 10/31/24.
//

import Combine
import GameplayKit

class TTGameContext: GameContext {
    var gameScene: TTGameScene? {
        scene as? TTGameScene
    }
    let gameMode: GameModeType
    let gameInfo: TTGameInfo
    var layoutInfo: TTLayoutInfo = .init(screenSize: .zero)
    
    private(set) var stateMachine: GKStateMachine?
    
    init(dependencies: Dependencies, gameMode: GameModeType) {
        self.gameInfo = TTGameInfo()
        self.gameMode = gameMode
        super.init(dependencies: dependencies)
    }
    
    func configureStates() {
        guard let gameScene else { return }
        stateMachine = GKStateMachine(states: [
            StartState(scene: gameScene, context: self),
            TTGameIdleState(scene: gameScene, context: self),
            GameOverState(scene: gameScene) // Add GameOverState here
        ])
        stateMachine?.enter(StartState.self) // Start with StartState
    }



}
