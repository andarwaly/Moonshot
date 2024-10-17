//
//  ContentView.swift
//  Moonshot
//
//  Created by Muhammad Dzaky on 17/10/24.
//

import SwiftUI

struct ContentView: View {
    // Annotation karena decoder kita accept general type
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
