//
//  ContentView.swift
//  CatTree
//
//  Created by Ifte Alam on 10/24/24.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    let context = CTGameContext(dependencies: .init(),
                                gameMode: .single)
    let screenSize: CGSize = UIScreen.main.bounds.size
    
    var body: some View {
        SpriteView(scene: CTGameScene(context: context,
                                      size: screenSize))
    }
}

#Preview {
    ContentView()
        .ignoresSafeArea()
}
