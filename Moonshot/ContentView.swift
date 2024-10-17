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
    
    let columns = [
        GridItem(.adaptive(minimum: 160), spacing: 12)
    ]
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            Text("Detail View")
                        } label: {
                            // Card Container
                            VStack (spacing: 0) {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .padding(24)
                                    .frame(maxWidth: .infinity)
                                    .background(VersaColor.Neutral.Background.secondary)
                                // Text Container
                                VStack (alignment: .leading, spacing: 6) {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(VersaColor.Neutral.Text.primary)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(VersaColor.Neutral.Text.secondary)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                                .frame(maxWidth: .infinity)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .background(RoundedRectangle(cornerRadius: 8)
                                .fill(.bgPrimary)
                                .stroke(VersaColor.Neutral.Border.subtle.opacity(0.4), lineWidth: 1)
                            )
                            .shadow(color: .black.opacity(0.08),radius: 2)
                        }
                    }
                }
                .padding(16)
            }
            .background(VersaColor.Neutral.Background.primary)
            .navigationTitle("Moonshots")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
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
                    }) {
                        // Change the icon based on the current theme
                        Image(systemName: currentTheme == .light ? "moon.fill" : "sun.max.fill")
                            .foregroundColor(VersaColor.Brand.Text.primary)
                            .symbolEffect(.bounce ,isActive: animateIcon)
                        
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
}

#Preview {
    ContentView()
}
