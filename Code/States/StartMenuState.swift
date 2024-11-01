//
//  StartMenuState.swift
//  Test
//
//  Created by Ifte Alam on 10/31/24.
//


import GameplayKit

class StartMenuState: GKState {
    weak var context: TTGameContext?
    
    init(context: TTGameContext) {
        self.context = context
    }

    override func didEnter(from previousState: GKState?) {
        // Display Start Menu UI
        context?.gameScene?.showStartMenu()
    }

    override func willExit(to nextState: GKState) {
        // Hide Start Menu UI
        context?.gameScene?.hideStartMenu()
    }
}
