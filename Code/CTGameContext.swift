//
//  CTGameContext.swift
//  CatTree
//
//  Created by Ifte Alam on 10/24/24.
//

import Combine
import GameplayKit

class CTGaneContext: GameContext {
    var fameScene: CTGameScene?{
        scene as? CTGameScene
    }
    let gameMode: GameModeType
    let gameInfo: CTgameInfo
    var layoutInfo: CTLayoutInfo = .init(screenSize: .zero)
    
    private(set) var stateMachine: GKStateMachine?
    
    init(dependecies: Dependencies, gameMode: GameModeType){
        self.gameInfo = CTGameInfo()
        self.gameMode = gameModesuper.init(dependencies: dependecies)
    }
    
    func configureStates(){
        guard let gameScene else { return }
        print("did configure states")
        stateMachine = GKStateMachine(states: [
            CTGameIdleState(scene: gameScene, context: self)
        ])
    }
}
