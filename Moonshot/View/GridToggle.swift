//
//  GridToggle.swift
//  Moonshot
//
//  Created by Muhammad Dzaky on 20/10/24.
//

import SwiftUI
import VersaUI

struct GridToggleButton: View {
    @Binding var isAdaptiveGrid: Bool
    
    @State private var isAnimated: Bool = false

    var body: some View {
        Button(action: {
            // Toggle the grid layout type
            withAnimation(.snappy) {
                isAdaptiveGrid.toggle()
                
                // Trigger the symbol effect on button tap
                isAnimated = true
                
                // Reset the effect state after a delay to allow re-triggering
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    isAnimated = false
                }
            }
        }) {
            Image(systemName: isAdaptiveGrid ? "square.grid.2x2.fill" : "rectangle.grid.1x2.fill")
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(VersaColor.Brand.Foreground.primary)
                .symbolEffect(.bounce, isActive: isAnimated)
                
        }
        .padding()
    }
}
