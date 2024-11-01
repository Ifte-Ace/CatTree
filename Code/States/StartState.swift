//
//  StartState.swift
//  Test
//
//  Created by Ifte Alam on 10/31/24.
//

import GameplayKit

class StartState: GKState {
    weak var scene: TTGameScene?
    weak var context: TTGameContext?

    init(scene: TTGameScene, context: TTGameContext) {
        self.scene = scene
        self.context = context
        super.init()
    }

    override func didEnter(from previousState: GKState?) {
        // Show the start button when entering this state
        scene?.showStartButton()
    }

    override func willExit(to nextState: GKState) {
        // Hide the start button when exiting this state
        scene?.hideStartButton()
    }

    func handleTouch(_ touch: UITouch) {
        // Transition to the game idle state when the button is tapped
        context?.stateMachine?.enter(TTGameIdleState.self)
    }
}
