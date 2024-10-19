//
//  CardView.swift
//  Moonshot
//
//  Created by Muhammad Dzaky on 18/10/24.
//

import SwiftUI
import VersaUI


private struct CardPreview: View {
    var body: some View {
        VStack {
            VerticalCard {
                Text("Title Card")
                Color(VersaColor.Neutral.Background.secondary)
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(VersaColor.Neutral.Background.primary)
    }
}


struct CardStack<Content: View>: View {
    let content: () -> Content
    
    var body: some View {
        VStack {
            content()
        }
    }
}


#Preview {
    CardPreview()
}
