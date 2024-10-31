//
//  TTGameScene.swift
//  Test
//
//  Created by Ifte Alam 10/31/24.
//

import SpriteKit
import GameplayKit

class TTGameScene: SKScene {
    weak var context: TTGameContext?
    
    var box: TTBoxNode?
    var baseBox: TTBoxNode?
    var swayTimer: Timer?
    var stackHeight: CGFloat = 0 // Track current stacking height
    var canPlaceNewBlock: Bool = true // Track if new blocks can be placed
    private var cameraNode = SKCameraNode()  // Camera node for following stack
    private var scoreLabel: SKLabelNode = SKLabelNode(fontNamed: "AvenirNext-Bold") // Score label
    private var score: Int = 0 // Score variable

    init(context: TTGameContext, size: CGSize) {
        self.context = context
        super.init(size: size)

        // Set up the camera
        self.camera = cameraNode
        addChild(cameraNode)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(to view: SKView) {
        guard let context else {
            return
        }
        context.scene = self
        context.configureStates()

        // Set up score label and add it to the camera
        scoreLabel.fontSize = 24
        scoreLabel.fontColor = .white
        scoreLabel.position = CGPoint(x: 0, y: size.height / 2 - 40)  // Adjusted for camera-relative positioning
        scoreLabel.text = "Score: 0"
        cameraNode.addChild(scoreLabel)  // Add label to camera

        // Position camera at the bottom center initially
        cameraNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        // Spawn base block
        let baseBox = TTBoxNode()
        baseBox.setup(screenSize: size, layoutInfo: context.layoutInfo)
        baseBox.position = CGPoint(x: size.width / 2.0 - context.layoutInfo.boxSize.width / 2.0, y: 0)
        addChild(baseBox)
        self.baseBox = baseBox
        
        // Set the initial stacking height above the base block
        stackHeight = context.layoutInfo.boxSize.height
        
        // Spawn the first swaying block
        spawnSwayingBox()
        
        context.stateMachine?.enter(TTGameIdleState.self)
    }
    
    func spawnSwayingBox() {
        guard let context = context, canPlaceNewBlock else { return }
        
        // Create a new block positioned above the current stack height
        let box = TTBoxNode()
        box.setup(screenSize: size, layoutInfo: context.layoutInfo)
        box.position = CGPoint(x: size.width / 2.0 - context.layoutInfo.boxSize.width / 2.0, y: stackHeight)
        addChild(box)
        self.box = box
        
        // Start swaying animation
        startSwaying()
    }
    
    var swayDirection: CGFloat = 1.0 // 1.0 for right, -1.0 for left
    func startSwaying() {
        swayTimer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { [weak self] _ in
            guard let self = self, let box = self.box else { return }
            // Calculate the new x-position for the sway
            box.position.x += 2.0 * self.swayDirection
            
            // Check boundaries and reverse direction if necessary
            if box.position.x >= self.size.width - (self.context?.layoutInfo.boxSize.width ?? 0) {
                self.swayDirection = -1.0 // Move left
            } else if box.position.x <= 0 {
                self.swayDirection = 1.0 // Move right
            }
        }
    }
    
    func stackBlock() {
        swayTimer?.invalidate() // Stop swaying

        // Check if there are existing boxes to stack on
        if let lastBox = box, let previousBox = baseBox {
            // Calculate the positions and sizes
            let lastBoxX = lastBox.position.x
            let previousBoxX = previousBox.position.x
            let previousBoxWidth = previousBox.box.frame.width

            // Log the positions for debugging
            print("Last Box X: \(lastBoxX)")
            print("Previous Box X: \(previousBoxX)")
            print("Previous Box Width: \(previousBoxWidth)")

            // Determine the left and right edges of the previous box
            let previousBoxLeftEdge = previousBoxX - (previousBoxWidth / 2)
            let previousBoxRightEdge = previousBoxX + (previousBoxWidth / 2)

            // Check if the last box will touch the previous box
            let lastBoxHalfWidth = lastBox.box.frame.width / 2
            let lastBoxLeftEdge = lastBoxX - lastBoxHalfWidth
            let lastBoxRightEdge = lastBoxX + lastBoxHalfWidth

            // Log edges for debugging
            print("Previous Box Left Edge: \(previousBoxLeftEdge)")
            print("Previous Box Right Edge: \(previousBoxRightEdge)")
            print("Last Box Left Edge: \(lastBoxLeftEdge)")
            print("Last Box Right Edge: \(lastBoxRightEdge)")

            // Check for overlap
            if lastBoxRightEdge >= previousBoxLeftEdge && lastBoxLeftEdge <= previousBoxRightEdge {
                // Block is touching correctly
                print("Block landed correctly. Continuing stacking.")
                
                // Update score
                updateScore()

                // Update stacking height
                stackHeight += previousBox.box.frame.height // Update stacking height
                
                // Update camera position to follow the stack height
                updateCameraPosition(for: stackHeight)
                
                // Update the baseBox to be the lastBox for the next round
                baseBox = lastBox

                spawnSwayingBox() // Spawn the next swaying block
            } else {
                // Reset or stop stacking if it does not touch
                print("Block did not land correctly. Stopping stacking.")
                // Implement a reset or stop stacking action if needed
            }
        } else {
            // If no previous box, simply spawn the new swaying box
            spawnSwayingBox()
        }
    }

    func updateScore() {
        score += 1 // Increment score
        scoreLabel.text = "Score: \(score)" // Update score label
    }

    func updateCameraPosition(for stackHeight: CGFloat) {
        // Adjust the camera position to keep the bottom of the stack visible
        cameraNode.position.y = max(size.height / 2, 50 + stackHeight)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let state = context?.stateMachine?.currentState as? TTGameIdleState else {
            return
        }
        state.handleTouch(touch)
    }
}
