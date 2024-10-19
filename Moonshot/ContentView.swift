//
//  ContentView.swift
//  Moonshot
//
//  Created by Muhammad Dzaky on 17/10/24.
//

import SwiftUI
import VersaUI

struct ContentView: View {
    // Persist the user's theme preference using AppStorage
    @AppStorage("selectedTheme") private var selectedTheme: String = AppTheme.light.rawValue
    @State private var animateIcon = false
    
    
    // Annotation karena decoder kita accept general type
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    // State to toggle between adaptive and fixed grid layouts
    @State private var isAdaptiveGrid = true
    
    let columns = [
        GridItem(.adaptive(minimum: 160), spacing: 12)
    ]
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                MissionGridView(
                    missions: missions,
                    astronauts: astronauts,
                    isAdaptiveGrid: isAdaptiveGrid
                )
                
            }
            .background(VersaColor.Neutral.Background.primary)
            .navigationTitle("Moonshots")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 0) {
                        themeToggle
                        GridToggleButton(isAdaptiveGrid: $isAdaptiveGrid)
                    }
                }
            }
            .preferredColorScheme(currentTheme.colorScheme)
        }
    }
    
    
    // Computed property to get the current theme
    private var currentTheme: AppTheme {
        AppTheme(rawValue: selectedTheme) ?? .light
    }
    
    // Function to toggle between light and dark themes
    private func toggleTheme() {
        selectedTheme = (currentTheme == .light) ? AppTheme.dark.rawValue : AppTheme.light.rawValue
    }
    
    // Theme toggle button
    private var themeToggle: some View {
        Button {
            // Toggle the theme when the button is tapped
            withAnimation(.bouncy(duration:0.2)) {
                toggleTheme()
                // Trigger the symbol effect on button tap
                animateIcon = true
                
                // Reset the effect state after a delay to allow re-triggering
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    animateIcon = false
                }
            }
        } label: {
            // Change the icon based on the current theme
            Image(systemName: currentTheme == .light ? "moon.fill" : "sun.max.fill")
                .foregroundColor(VersaColor.Brand.Foreground.primary)
                .symbolEffect(.bounce ,isActive: animateIcon)
        }
    }
}

#Preview {
    ContentView()
}
